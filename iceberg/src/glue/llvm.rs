//! This module implements functionalities that glues the
//! LLVM frontend and the middleend.
//!
//! To be exact, the `Type`s from `frontend::ast` are converted
//! into `Type`s in `middleend::types` here; the `Value`s are
//! converted into `middleend::exp::Exp`s and `middleend::exp::CfgNode`s
//! accordingly.
//!
//! Whereas the frontend parser neglects type checking when parsing,
//! the building process of middleend `Exp`s should be rigorously
//! type-checked.
//!
//! Regarding name conflictions between `Type`s and other names in
//! the frontend and the middleend: the principle is **middleend**
//! first. Consequently, we `use` `Type` from middleend as `Type`,
//! but refer to the frontend `Type` as `ast::Type`.
//!
//! ### LLVM Opaque Pointer
//! See <https://llvm.org/docs/OpaquePointers.html>.
//! LLVM has been shifting from typed pointers to opaque pointers,
//! denoted as `ptr` in the IR. This change seems to go against the
//! strongly typed design of the middleend, but is in fact manageable.
//!
//! In Iceberg, we use the ubiquitous `Type::Pointer` to represent any
//! pointer type, just like the concept of opaque pointers in LLVM.
//! This on the one hand solves any type check issues (when the IR use
//! typed pointers, we simply ignore the extra information). On the
//! other hand, what `Type::Pointer` really means is that the actual
//! type check is deferred to use sites, rather than at the declaration
//! sites; in other words, doing so does not compromise the type safety.

use crate::middleend::*;
use crate::util::StringRef;
use core::panic;
use llvm_frontend::ast;
use log::info;
use std::collections::{HashMap, HashSet, VecDeque};
use std::rc::Rc;

/// Exception stack size for LLVM exception handling.
pub const EX_STK_SZ: usize = 16;

impl From<ast::BinaryInstOp> for op::ArithOp {
    fn from(value: ast::BinaryInstOp) -> Self {
        match value {
            ast::BinaryInstOp::Add => op::ArithOp::Add,
            ast::BinaryInstOp::Sub => op::ArithOp::Sub,
            ast::BinaryInstOp::And => op::ArithOp::And,
            ast::BinaryInstOp::Or => op::ArithOp::Or,
            ast::BinaryInstOp::Xor => op::ArithOp::Xor,
            ast::BinaryInstOp::Lshr => op::ArithOp::Lshr,
            ast::BinaryInstOp::Ashr => op::ArithOp::Ashr,
            ast::BinaryInstOp::Shl => op::ArithOp::Shl,
            ast::BinaryInstOp::Mul => op::ArithOp::Mul,
            ast::BinaryInstOp::Sdiv => op::ArithOp::Sdiv,
            ast::BinaryInstOp::Udiv => op::ArithOp::Udiv,
            ast::BinaryInstOp::Srem => op::ArithOp::Srem,
            ast::BinaryInstOp::Urem => op::ArithOp::Urem,
        }
    }
}

impl From<ast::IcmpInstOp> for op::CompareOp {
    fn from(value: ast::IcmpInstOp) -> Self {
        match value {
            ast::IcmpInstOp::Eq => op::CompareOp::Eq,
            ast::IcmpInstOp::Ne => op::CompareOp::Neq,
            ast::IcmpInstOp::Ugt => op::CompareOp::Ugt,
            ast::IcmpInstOp::Uge => op::CompareOp::Uge,
            ast::IcmpInstOp::Ult => op::CompareOp::Ult,
            ast::IcmpInstOp::Ule => op::CompareOp::Ule,
            ast::IcmpInstOp::Sgt => op::CompareOp::Sgt,
            ast::IcmpInstOp::Sge => op::CompareOp::Sge,
            ast::IcmpInstOp::Slt => op::CompareOp::Slt,
            ast::IcmpInstOp::Sle => op::CompareOp::Sle,
        }
    }
}

/// `ValueManager` manages the mapping from names to value `Type`s,
/// to implement struct type checking.
///
/// A complexity of LLVM IR is that value definitions may not have
/// a topological ordering, such as:
/// ```llvm
/// block1:
///   %1 = phi i32 [ 0, %block0 ], [ %2, %block2 ]
///   br %block2
/// block2:
///   %2 = add i32 %1, i32 1
///   br i1 %cond, label %block1, label %block3
/// ```
/// where the definition of `%1` depends on `%2`, and vice versa.
/// This makes it difficult to type check and build the dependency
/// graph in one traversal.
///
/// The solution is to facilitate type checks by "inferring types".
/// In the above example, while `%2` is undefined, its type can be
/// inferred to be `i32`, which can be checked later when it is
/// defined.
///
/// `ValueManager` thus exists to provide such functionality; otherwise,
/// a simple `HashMap` would suffice.
struct ValueManager<'see> {
    /*
      Since global definitions in LLVM always has a pointer type, and `Type::Pointer`
      is opaque in Iceberg, `global_defs` records the base type for global definitions
      for type hints.
    */
    global_defs: HashMap<StringRef, Rc<Type>>,

    values: HashMap<StringRef, Rc<Type>>,
    inferred_values: HashMap<StringRef, Rc<Type>>,

    // ..wraps the middleend `ValueState`
    vstate: &'see mut ValueState,
}

impl<'see> ValueManager<'see> {
    pub fn new(vstate: &'see mut ValueState) -> Self {
        ValueManager {
            global_defs: HashMap::default(),
            values: HashMap::default(),
            inferred_values: HashMap::default(),
            vstate,
        }
    }

    pub fn insert_global(&mut self, value: StringRef, ty: Rc<Type>) {
        assert!(value.starts_with("@"));
        self.global_defs.insert(value, ty);
    }

    pub fn get_global(&mut self, value: &str) -> Option<Rc<Type>> {
        assert!(value.starts_with("@"));
        self.global_defs.get(value).cloned()
    }

    pub fn get(&self, value: &str) -> Option<&Rc<Type>> {
        self.values.get(value)
    }

    pub fn get_inferred(&self, value: &str) -> Option<&Rc<Type>> {
        self.inferred_values.get(value)
    }

    pub fn insert(&mut self, value: StringRef, ty: Rc<Type>) {
        self.verify(&value, ty.clone());
        self.values.insert(value, ty);
    }

    pub fn insert_inferred(&mut self, value: StringRef, ty: Rc<Type>) {
        info!("[ValueManager::insert_inferred] infer type of value {value} as {ty}");
        self.inferred_values.insert(value, ty);
    }

    // --- relayed to `vstate` ---
    pub fn local(&mut self, scope: &str, name: &str) -> ValueDesc {
        self.vstate.local(scope, name)
    }

    pub fn global(&mut self, name: &str) -> ValueDesc {
        self.vstate.global(name)
    }

    pub fn temporary(&mut self) -> ValueDesc {
        self.vstate.temporary()
    }

    fn verify(&mut self, value: &str, truth: Rc<Type>) {
        if let Some(ty) = self.inferred_values.remove(value) {
            info!("[ValueManager::verify] verifying type of value {value}");
            if !type_eq!(ty, truth) {
                panic!("[ValueManager::verify] value {value} inferred to be {ty}, but is actually {truth}")
            }
        };
    }
}

/// Converts frontend AST into middleend `AST`.
///
/// Performs rigorous type checks to ensure well-formedness of
/// the built `Ast`.
pub fn ast_fe_to_me(ast: ast::Prog) -> SeeBuilder<crate::middleend::se::Parsed> {
    let mut see_builder = SeeBuilder::new();

    let mut functions = HashMap::new();
    let mut vman = ValueManager::new(see_builder.vstate_mut());
    let mut global_inits = Vec::new();

    // Analyze data layout
    ast_data_layout(&ast.layout);

    // First collect types
    let all_decls = HashMap::from_iter(ast.decls.iter().filter_map(|decl| match decl {
        ast::Decl::TypeDecl(type_decl) => Some((type_decl.id.clone(), type_decl)),
        _ => None,
    }));
    let mut eta = HashMap::new();
    for decl in ast.decls.iter() {
        match decl {
            ast::Decl::TypeDecl(type_decl) => {
                if let Some(types) = ast_type_decl_to_type(&all_decls, type_decl) {
                    _ = eta.insert(type_decl.id.clone(), types);
                }
            }
            _ => {}
        }
    }

    // Then collect all function signatures, and global value types
    for decl in ast.decls.iter() {
        match decl {
            ast::Decl::FuncDecl(func_decl) => {
                let ret_ty = ast_type_to_type(&func_decl.ty, None);
                let is_va_args = if let Some(ast::Type::VaArgs) = func_decl.params.last() {
                    true
                } else {
                    false
                };
                let arg_ty: Vec<Rc<Type>> = func_decl
                    .params
                    .iter()
                    .filter(|ast_ty| !matches!(ast_ty, ast::Type::VaArgs))
                    .map(|ty| ast_type_to_type(ty, None))
                    .collect();
                let func_ty = Type::mk_lambda(ret_ty, arg_ty, is_va_args);
                vman.insert_global(func_decl.id.clone(), func_ty.clone());

                // Function identifiers are added as `Ident` function pointers
                let ptr = Type::mk_pointer();
                global_inits.push((
                    func_decl.id.clone(),
                    Initializer::ByValue(Exp::ident(ptr, func_decl.id.clone())),
                ));
            }
            ast::Decl::FuncDef(func_def) => {
                let ret_ty = ast_type_to_type(&func_def.ty, None);
                let is_va_args = if let Some(ast::Type::VaArgs) =
                    func_def.params.last().map(|param| &param.ty)
                {
                    true
                } else {
                    false
                };
                let arg_ty: Vec<Rc<Type>> = func_def
                    .params
                    .iter()
                    .filter(|p| !matches!(p.ty, ast::Type::VaArgs))
                    .map(|p| ast_type_to_type(&p.ty, None))
                    .collect();
                let func_ty = Type::mk_lambda(ret_ty, arg_ty, is_va_args);
                vman.insert_global(func_def.id.clone(), func_ty.clone());

                // Function identifiers are added as `Ident` function pointers
                let ptr = Type::mk_pointer();
                global_inits.push((
                    func_def.id.clone(),
                    Initializer::ByValue(Exp::ident(ptr, func_def.id.clone())),
                ));
            }
            ast::Decl::VarDecl(var_decl) => {
                let var_ty = ast_type_to_type(&var_decl.ty, None);
                vman.insert_global(var_decl.id.clone(), var_ty);
            }
            _ => {}
        }
    }

    // Then global value initializations
    for decl in ast.decls.iter() {
        match decl {
            ast::Decl::VarDecl(var_decl) => {
                // Zero-init values need a type hint
                info!(
                    "[AST_FE_TO_ME] visiting variable initializer {:?}\n",
                    var_decl
                );
                let constant = match var_decl.decl_ty {
                    ast::VarDeclType::Constant => true,
                    _ => false,
                };
                let ty = vman.get_global(&var_decl.id).unwrap();
                let initializer = var_decl
                    .init
                    .as_ref()
                    .map(|v| ast_value_to_exp(v, &mut vman, None, Some(ty.clone())))
                    .map_or(Initializer::Undef(ty), |exp| {
                        Initializer::InMemory(exp, constant)
                    });
                global_inits.push((var_decl.id.clone(), initializer));
            }
            _ => {}
        }
    }

    // Finally build functions
    for decl in ast.decls {
        let ValueManager {
            global_defs,
            values,
            inferred_values,
            vstate,
        } = &mut vman;
        let mut local_vman = ValueManager {
            global_defs: global_defs.clone(),
            values: values.clone(),
            inferred_values: inferred_values.clone(),
            vstate,
        };
        match decl {
            ast::Decl::FuncDef(func_def) => {
                ast_function_def(func_def, &mut local_vman, &mut functions)
            }
            _ => {}
        }
    }

    let ast = Ast {
        functions,
        global_inits,
        eta,
    };
    see_builder.parse(ast)
}

/// Process the data layout string.
///
/// Here, we only verify that the data layout matches the standard C alignment rules.
/// Notably, it is the compiler's responsibility to generate code that make use of the
/// data layout correctly, which is out of scope for Iceberg.
/// By relying on a specific data layout in Iceberg, we are only going for a simpler
/// implementation, without compromising the effectiveness or correctness in general.
///
/// LLVM Data Layout: https://llvm.org/docs/LangRef.html#id1777
fn ast_data_layout(layout: &str) {
    for specification in layout.split("-") {
        let (first, rest) = specification.as_bytes().split_first().unwrap();
        match *first {
            b'i' => {
                let s = rest.split(|ch| *ch == b':');
                let s = s
                    .map(|s| std::str::from_utf8(s).unwrap().parse().unwrap())
                    .collect::<Vec<usize>>();
                let (&width, rest) = s.split_first().unwrap();
                let abi = rest[0];
                match width {
                    1 | 8 | 16 | 32 | 64 | 128 => assert!(
                        width == abi,
                        "[AST_DATA_LAYOUT] non-default alignment {abi} for i{width}"
                    ),
                    _ => panic!("[AST_DATA_LAYOUT] unsupported layout for i{width}"),
                }
            }
            b'p' => {
                let s = rest.split(|ch| *ch == b':');
                let s = s
                    .map(|s| std::str::from_utf8(s).unwrap().parse().unwrap_or(0))
                    .collect::<Vec<u32>>();
                let address_space = s[0];
                if address_space == 0 {
                    let size = s[1];
                    let abi = s[2];
                    assert!(size == TYPE_POINTER_WIDTH, "[AST_DATA_LAYOUT] non-default pointer size {size} for {TYPE_POINTER_WIDTH}-bit pointer");
                    assert!(size == abi, "[AST_DATA_LAYOUT] non-default alignmnet {abi} for {TYPE_POINTER_WIDTH}-bit pointer");
                }
            }
            _ => { /* We do not attempt to check or use any other fields */ }
        }
    }
}

/// Parses frontend `type_decl`, and records the name as a to-be alias for
/// the actual type declaration.
///
/// Returns the type annotations, if available, as `TypeExt`s.
fn ast_type_decl_to_type(
    all_decls: &HashMap<Rc<str>, &ast::TypeDecl>,
    type_decl: &ast::TypeDecl,
) -> Option<Vec<Option<Rc<TypeExt>>>> {
    let name = type_decl.id.clone();

    let ast_ty = &type_decl.ty;
    let ty = ast_type_to_type(ast_ty, Some(all_decls));
    if Type::resolve(name.as_ref()).is_err() {
        Type::bind(name, ty).unwrap();
    }

    match ast_ty {
        ast::Type::Struct(fields, _) => {
            let mut types = Vec::with_capacity(fields.len());
            for mut field in fields {
                let ext;
                let mut ptr_level = 0;
                loop {
                    match field {
                        ast::Type::Named(name) => {
                            ext = Some(Rc::new(TypeExt::Named(name.clone())));
                            break;
                        }

                        /*
                            XXX: we stop at a pointer to array without going deeper.
                            It is possible to have further annotations, like with [i64* x 10]*;
                            but for simplicity we do not handle that for now.
                        */
                        ast::Type::Array(elem_ty, _) | ast::Type::Vector(elem_ty, _)
                            if ptr_level == 0 =>
                        {
                            field = elem_ty.as_ref();
                        }
                        ast::Type::ExplicitPtr(bty) => {
                            ptr_level += 1;
                            field = bty.as_ref();
                        }
                        _ => {
                            let ty = ast_type_to_type(field, None);
                            match ty.as_ref() {
                                Type::BitVec(_) => {
                                    ext = Some(Rc::new(TypeExt::Type(ty)));
                                }
                                Type::Tuple(kind) if !kind.fields.is_empty() => {
                                    ext = Some(Rc::new(TypeExt::Type(ty)));
                                }
                                Type::Array(kind) if kind.len > 0 => {
                                    // println!("[eta] ({}) {ty} for {:?}", type_decl.id, field);
                                    ext = Some(Rc::new(TypeExt::Type(ty)));
                                }
                                _ => {
                                    ext = None;
                                    ptr_level = 0;
                                }
                            }
                            break;
                        }
                    }
                }
                if ext.is_some() {
                    let mut ext = ext.unwrap();
                    for _ in 0..ptr_level {
                        ext = Rc::new(TypeExt::TypedPtr(ext));
                    }
                    types.push(Some(ext));
                } else {
                    types.push(None);
                }
            }
            Some(types)
        }
        _ => None,
    }
}

/// Resolve frontend type declarations as `Type`s.
fn ast_type_to_type(
    ast_ty: &ast::Type,
    all_decls: Option<&HashMap<Rc<str>, &ast::TypeDecl>>,
) -> Rc<Type> {
    match ast_ty {
        ast::Type::Array(ast_elem_ty, len) | ast::Type::Vector(ast_elem_ty, len) => {
            let elem_ty = ast_type_to_type(ast_elem_ty, all_decls);
            Type::mk_array(*len, elem_ty)
        }
        ast::Type::ExplicitPtr(_) | ast::Type::FuncPtr(_, _) | ast::Type::Ptr => Type::mk_pointer(),
        ast::Type::Int(width) => Type::mk_bitvec(*width as u32),
        ast::Type::Named(name) => {
            Type::resolve(name).unwrap_or_else(|_| {
                if let Some(all_decls) = all_decls {
                    let decl = all_decls.get(name).unwrap();
                    let ty = ast_type_to_type(&decl.ty, Some(all_decls));
                    /* won't double bind because type declaration cannot be recursive */
                    Type::bind(name.clone(), ty.clone()).unwrap();
                    ty
                } else {
                    panic!("[AST_TYPE_TO_TYPE] type {name} is not bound")
                }
            })
        }
        ast::Type::Opaque => {
            // Model opaque structs with an "empty" tuple
            Type::mk_tuple(vec![])
        }
        ast::Type::Struct(fields, packed) => {
            let fields: Vec<Rc<Type>> = fields
                .iter()
                .map(|ast_ty| ast_type_to_type(ast_ty, all_decls))
                .collect();
            if *packed {
                Type::mk_tuple_packed(fields)
            } else {
                Type::mk_tuple(fields)
            }
        }
        ast::Type::Void => Type::mk_unit(),
        _ => unreachable!("ast::Type::VaArgs unreachable"),
    }
}

/// Resolve frontend values as `Exp`s.
///
/// `vman`: a collection of `Type`s, indexed by `Exp::Var` names, to
/// determine the type of identifiers.
///
/// `type_hint`: optional `Type` for determining the type of unnamed
/// values such as `undef`, `poison` and so on.
fn ast_value_to_exp(
    ast_value: &ast::Value,
    vman: &mut ValueManager,
    func_name: Option<StringRef>,
    type_hint: Option<Rc<Type>>,
) -> Rc<Exp> {
    match ast_value {
        ast::Value::Undef | ast::Value::Poison => {
            let Some(ty) = type_hint else {
                panic!(
                    "[AST_VALUE_TO_EXP] parsing {:?} without a type hint",
                    ast_value
                )
            };
            Exp::havoc(ty)
        }
        ast::Value::Null => {
            if let Some(ty) = type_hint {
                assert!(
                    type_is_kind!(ty, Type::Pointer),
                    "[AST_VALUE_TO_EXP] type mismatch; expect {ty}, found Ptr",
                )
            };
            Exp::null()
        }
        ast::Value::ZeroInit => {
            let Some(ty) = type_hint else {
                panic!(
                    "[AST_VALUE_TO_EXP] parsing {:?} without a type hint",
                    ast_value
                )
            };
            Exp::zero_val(ty).unwrap()
        }
        ast::Value::LocalIdent(id) => {
            let mut ty = vman.get(id).cloned();
            if ty.is_none() {
                // Try inferred type instead
                ty = vman.get_inferred(id).cloned();
                if ty.is_none() {
                    let Some(infer_ty) = type_hint.clone() else {
                        panic!(
                            "[AST_VALUE_TO_EXP] inferring type of {:?} without a type hint",
                            ast_value
                        )
                    };
                    vman.insert_inferred(id.clone(), infer_ty.clone());
                    ty = Some(infer_ty);
                }
            };
            let Some(ty) = ty else {
                panic!(
                    "[AST_VALUE_TO_EXP] local identifier {:?} is not defined",
                    id
                );
            };
            assert!(func_name.is_some());
            let exp = Exp::var(
                vman.local(&func_name.unwrap(), id.as_ref()), 
                ty.clone()
            );
            exp
        }
        ast::Value::GlobalIdent(id) => {
            let Some(_) = vman.get_global(id) else {
                // Global identifiers should always be defined
                panic!(
                    "[AST_VALUE_TO_EXP] global identifier {:?} is not defined",
                    id
                )
            };
            // ..and it is always a pointer type
            let ty = Type::mk_pointer();
            let exp = Exp::var(vman.global(id.as_ref()), ty);
            exp
        }
        ast::Value::Int(i) => {
            let Some(ty) = type_hint else {
                panic!(
                    "[AST_VALUE_TO_EXP] parsing {:?} without a type hint",
                    ast_value
                )
            };
            let width: Option<u32>;
            if type_is_kind!(ty, Type::BitVec) {
                width = Some(type_as_kind!(ty, Type::BitVec).width);
            } else if type_is_kind!(ty, Type::Int) {
                width = None;
            } else {
                panic!(
                    "[AST_VALUE_TO_EXP] type hint {ty} of {:?} must be BitVec or Int",
                    ast_value
                )
            }
            Exp::int_literal(*i, width).unwrap()
        }
        ast::Value::Gep(gep) => ast_gep(vman, gep, func_name, type_hint),
        ast::Value::Bitcast(bitcast) => ast_bitcast(vman, bitcast, func_name),
        ast::Value::Aggregate(agg) => ast_aggregate(vman, agg, func_name),
        ast::Value::Binary(binary) => ast_binary(vman, binary, func_name),
    }
}

/// Builds an `Exp` from an `ast::Gep`.
///
/// Note that this may produce a series of nested `Exp`s; see the
/// comment for `Exp::GetPtr` and `Exp::GetElemPtr` for details.
fn ast_gep(
    vman: &mut ValueManager,
    gep: &ast::Gep,
    func_name: Option<StringRef>,
    type_hint: Option<Rc<Type>>,
) -> Rc<Exp> {
    let ptr_hint = ast_type_to_type(&gep.ptr_ty, None);
    // Obey type hint
    if let Some(hint) = type_hint {
        assert!(type_eq!(hint, ptr_hint));
    }
    let ptr_exp = ast_value_to_exp(&gep.ptr, vman, func_name.clone(), Some(ptr_hint));

    assert!(gep.indices.len() > 0);

    let mut btype = ast_type_to_type(&gep.btype, None);
    let ((first_ty, first_value), rest) = gep.indices.split_first().unwrap();

    let inbounds = gep.inbounds;
    let mut exp = {
        // The first index behaves like `GetPtr`
        let ty = ast_type_to_type(first_ty, None);
        let index = ast_value_to_exp(first_value, vman, func_name.clone(), Some(ty));
        Exp::get_ptr(btype.clone(), ptr_exp, index, inbounds).unwrap()
    };

    for (index_ty, index_value) in rest.iter() {
        let ty = ast_type_to_type(index_ty, None);
        // The rest index behaves like `GetElemPtr
        let index = ast_value_to_exp(index_value, vman, func_name.clone(), Some(ty));
        exp = Exp::get_elem_ptr(btype.clone(), exp, index.clone(), inbounds).unwrap();
        btype = Type::sub_type(btype, index).unwrap();
    }

    exp
}

/// Builds an `Exp` from an `ast::Bitcast`.
fn ast_bitcast(
    vman: &mut ValueManager,
    bitcast: &ast::Bitcast,
    func_name: Option<StringRef>,
) -> Rc<Exp> {
    let old_ty = ast_type_to_type(&bitcast.old_ty, None);
    let new_ty = ast_type_to_type(&bitcast.new_ty, None);
    let value = ast_value_to_exp(&bitcast.value, vman, func_name, Some(old_ty.clone()));

    Exp::bitcast(new_ty, value).unwrap()
}

fn ast_binary(
    vman: &mut ValueManager,
    binary: &ast::Binary,
    func_name: Option<StringRef>,
) -> Rc<Exp> {
    let ty = ast_type_to_type(&binary.ty, None);
    let lhs = ast_value_to_exp(&binary.lhs, vman, func_name.clone(), Some(ty.clone()));
    let rhs = ast_value_to_exp(&binary.lhs, vman, func_name.clone(), Some(ty));

    Exp::arith(binary.op.into(), lhs, rhs).unwrap()
}

/// Builds an `Exp` from an `ast::Aggregate`.
fn ast_aggregate(
    vman: &mut ValueManager,
    agg: &ast::Aggregate,
    func_name: Option<StringRef>,
) -> Rc<Exp> {
    let fields: Vec<_> = agg
        .elems
        .iter()
        .map(|(ast_ty, e)| {
            let ty = ast_type_to_type(ast_ty, None);
            ast_value_to_exp(e, vman, func_name.clone(), Some(ty))
        })
        .collect();
    let field_ty: Vec<_> = fields.iter().map(|field| field.ty()).collect();

    if agg.is_array {
        let elem_ty = field_ty.get(0).cloned().unwrap();
        let ty = Type::mk_array(field_ty.len(), elem_ty.clone());
        Exp::vector(ty, fields).unwrap()
    } else {
        Exp::tuple(fields, agg.packed)
    }
}

/// Parses a frontend function definition and builds a `Function`.
fn ast_function_def(
    func_def: ast::FuncDef,
    local_vman: &mut ValueManager,
    functions: &mut HashMap<StringRef, Rc<Function>>,
) {
    // function name
    let name = func_def.id;

    // function return type
    let ret_ty = ast_type_to_type(&func_def.ty, None);

    // function arguments
    let args: Vec<(StringRef, Rc<Type>)> = func_def
        .params
        .into_iter()
        .filter(|p| !matches!(p.ty, ast::Type::VaArgs))
        .map(|p| {
            (
                StringRef::from(p.id.unwrap()),
                ast_type_to_type(&p.ty, None),
            )
        })
        .collect();

    // function entry
    for (arg_name, arg_ty) in args.iter() {
        local_vman.insert(arg_name.clone(), arg_ty.clone());
    }
    let lman = LabelManager::with_blocks(&func_def.body);

    let mut cfg = Cfg::new();
    let mut entry = None;
    let blocks: HashMap<StringRef, CfgNodeId> =
        HashMap::from_iter(func_def.body.into_iter().map(|block| {
            let (label, cfg) = ast_block(block, &mut cfg, local_vman, &lman, name.clone());
            if entry.is_none() {
                _ = entry.insert(cfg);
            }
            (label, cfg)
        }));
    ast_connect_block(&blocks, &mut cfg);
    let entry = entry.unwrap();

    // TODO: we may be able to do static analysis and skip this step
    // for functions that do not throw exceptions

    // add `CfgNode`s to initialize the local exception stack
    let ex_stk_top = Exp::var(
        local_vman.local(name.as_ref(), ValueDesc::EX_STK_TOP),
        Type::mk_pointer(),
    );
    let ex_stk_top_node = cfg
        .let_node(
            ex_stk_top.clone(),
            Exp::alloca(
                Type::mk_bitvec(8),
                name.clone(),
                ValueDesc::EX_STK_TOP.into(),
            ),
        )
        .unwrap();

    let ex_stk_node = cfg
        .let_node(
            Exp::var(
                local_vman.local(name.as_ref(), ValueDesc::EX_STK),
                Type::mk_pointer(),
            ),
            Exp::alloca(
                typ!([ptr; EX_STK_SZ]),
                name.clone(),
                ValueDesc::EX_STK.into(),
            ),
        )
        .unwrap();

    let init_node = cfg
        .let_node(
            Exp::var(local_vman.temporary(), Type::mk_unit()),
            Exp::store(ex_stk_top, Exp::int_literal(-1, Some(8)).unwrap()).unwrap(),
        )
        .unwrap();

    cfg.connect(ex_stk_top_node, ex_stk_node).unwrap();
    cfg.connect(ex_stk_node, init_node).unwrap();
    cfg.connect(init_node, entry).unwrap();
    cfg.set_entry(ex_stk_top_node);

    if functions
        .insert(
            name.clone(),
            Rc::new(Function::new(
                name.clone(),
                ret_ty,
                args
                    .into_iter()
                    .map(|(arg_name, ty)| (local_vman.local(name.as_ref(), arg_name.as_ref()), ty))
                    .collect(),
                cfg,
                local_vman.vstate,
            )),
        )
        .is_some()
    {
        panic!("[AST_FUNCTION_DECL] function name is already defined")
    }
}

/// Parses a function basic block, builds the control flow graph,
/// and returns the block label, as well as the entry node.
///
/// Note that the CFG still needs to be connected by invoking
/// `ast_connect_block()`.
fn ast_block(
    block: ast::Block,
    cfg: &mut Cfg,
    vman: &mut ValueManager,
    lman: &LabelManager,
    cur_func: StringRef,
) -> (StringRef, CfgNodeId) {
    let entry = cfg.noop_node();
    let mut cur = entry;

    // The IR left out "%" for block labels
    let label = "%".to_string() + &block.label;
    info!("[AST_BLOCK] visiting {}:{}", cur_func, label);

    // According to the LLVM IR Reference Manual,
    // "At runtime, the ‘phi’ instruction logically takes on the value specified by the
    // "pair corresponding to the predecessor basic block that executed just prior to the
    // "current block."
    // (https://llvm.org/docs/LangRef.html#phi-instruction)
    //
    // This specifically means that at this scenario:
    // block:
    //   %0 = phi i32 [ 0, %prev1 ], [ 1, %prev2 ]
    //   %1 = phi i32 [ 0, %prev1 ], [ %0, %prev2 ]
    // when the predecessor is %prev2, the value of %1 should be the OLDER value of %0, not
    // the value obtained from the newest ‘phi’ instruction.
    // To implementent such semantics, all ‘phi’ instructions are handled first.

    let mut insts = block.insts.into_iter().peekable();
    let mut phis = Vec::new();
    while let Some(ast::Inst::Phi(_)) = insts.peek() {
        let Some(ast::Inst::Phi(inst)) = insts.next() else {
            unreachable!()
        };

        let ty = ast_type_to_type(&inst.ty, None);
        let prev_block_exp = {
            let int_ty = Type::mk_int();
            Exp::var(
                vman.local(cur_func.as_ref(), ValueDesc::PREV_LABEL),
                int_ty,
            )
        };
        // Use a temporary name first
        let temp = format!("{}$new", inst.assign);
        let assign = Exp::var(
            vman.local(cur_func.as_ref(), temp.as_str()),
            ty.clone(),
        );
        phis.push((inst.assign.clone(), ty.clone()));
        vman.insert(inst.assign, ty.clone());

        // `phi` must have at least one value
        assert!(inst.values.len() > 0);
        let exit_node = cfg.noop_node();
        let mut prev = None;
        let mut dedup = Vec::new();
        for (value, label) in inst.values {
            let label = lman.get(&label);
            if dedup.contains(&label) {
                continue;
            }
            dedup.push(label);

            let label_exp = Exp::int_literal(label, None).unwrap();
            let cond_exp =
                Exp::compare(op::CompareOp::Eq, prev_block_exp.clone(), label_exp).unwrap();
            let assume_node = cfg.assume_node(cond_exp).unwrap();
            let value_exp =
                ast_value_to_exp(&value, vman, Some(cur_func.clone()), Some(ty.clone()));
            let let_node = cfg.let_node(assign.clone(), value_exp).unwrap();

            if prev.is_none() {
                cfg.connect(cur, assume_node).unwrap();
                cfg.connect(assume_node, let_node).unwrap();
                cfg.connect(let_node, exit_node).unwrap();
                _ = prev.insert(cur);
            } else {
                cur = cfg.noop_node();
                cfg.connect(prev.unwrap(), cur).unwrap();
                cfg.connect(cur, assume_node).unwrap();
                cfg.connect(assume_node, let_node).unwrap();
                cfg.connect(let_node, exit_node).unwrap();
                _ = prev.insert(cur);
            }
        }
        cur = exit_node;
    }

    // Assign all phi values together
    for (assign, ty) in phis {
        let lexp = Exp::var(vman.local(cur_func.as_ref(), assign.as_ref()), ty.clone());
        let rexp = Exp::var(
            vman.local(cur_func.as_ref(), StringRef::from(format!("{}$new", assign)).as_ref()),
            ty.clone(),
        );
        let let_node = cfg.let_node(lexp, rexp).unwrap();
        cfg.connect(cur, let_node).unwrap();
        cur = let_node;
    }

    // Handle the remaining insts
    for inst in insts {
        match inst {
            ast::Inst::Alloca(inst) => {
                let ast_alloca_ty = &inst.ty;
                let alloca_ty = ast_type_to_type(ast_alloca_ty, None);
                let exp = Exp::alloca(alloca_ty, cur_func.clone(), inst.assign.clone());
                let ty = exp.ty();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, exp).unwrap();
                vman.insert(inst.assign, ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Ret(inst) => {
                let ret_ty = ast_type_to_type(&inst.ty, None);
                let ret_exp = if let Some(ast_value) = &inst.retval {
                    ast_value_to_exp(ast_value, vman, Some(cur_func.clone()), Some(ret_ty))
                } else {
                    Exp::none()
                };

                let ety = ret_exp.ty();
                let cur_func_ty = vman.get_global(&cur_func).unwrap().clone();
                let ret_ty = type_as_kind!(cur_func_ty, Type::Lambda).ret_ty.clone();
                if !type_eq!(ety, ret_ty) {
                    panic!("[AST_BLOCK] returned value {ret_exp} has type {ety}, expected {ret_ty}")
                }

                let ret_bind = Exp::var(
                    vman.local(cur_func.as_ref(), ValueDesc::RET_VAL),
                    ret_ty.clone(),
                );
                let bind_node = cfg.let_node(ret_bind, ret_exp).unwrap();
                let ret_node = cfg.return_node(false);

                cfg.connect(cur, bind_node).unwrap();
                cfg.connect(bind_node, ret_node).unwrap();
                cur = ret_node;
            }
            ast::Inst::Call(inst) => {
                let funct = ast_value_to_exp(&inst.fid, vman, Some(cur_func.clone()), None);

                let ret_ty = ast_type_to_type(&inst.ty, None);
                let args = inst
                    .args
                    .iter()
                    .map(|arg| {
                        let aty = ast_type_to_type(&arg.ty, None);
                        ast_value_to_exp(&arg.value, vman, Some(cur_func.clone()), Some(aty))
                    })
                    .collect();

                let assign = if let Some(assign) = &inst.assign {
                    vman.insert(assign.clone(), ret_ty.clone());
                    Exp::var(vman.local(cur_func.as_ref(), assign.as_ref()), ret_ty)
                } else {
                    Exp::var(vman.temporary(), ret_ty)
                };

                let ex_flg = Exp::var(
                    vman.local(cur_func.as_ref(), ValueDesc::EX_FLG),
                    Type::mk_bool(),
                );

                let func_call_node = cfg.func_call_node(
                    assign,
                    funct,
                    args,
                )
                .unwrap();

                let ok_node = cfg.assume_node(Exp::not(ex_flg.clone()).unwrap()).unwrap();
                let ex_node = cfg.assume_node(ex_flg).unwrap();
                // ..we are throwing immediately, and the `ThrowVal` is bound already
                let throw_node = cfg.return_node(true);

                cfg.connect(cur, func_call_node).unwrap();
                cfg.connect(func_call_node, ok_node).unwrap();
                cfg.connect(func_call_node, ex_node).unwrap();
                cfg.connect(ex_node, throw_node).unwrap();
                
                cur = ok_node;
            }
            ast::Inst::Icmp(inst) => {
                let ty = ast_type_to_type(&inst.ty, None);
                let lhs =
                    ast_value_to_exp(&inst.lhs, vman, Some(cur_func.clone()), Some(ty.clone()));
                let rhs =
                    ast_value_to_exp(&inst.rhs, vman, Some(cur_func.clone()), Some(ty.clone()));
                let op = inst.op.into();

                // can be vectorized..
                let exp = if type_is_kind!(ty, Type::Array) {
                    let len = type_as_kind!(ty, Type::Array).len;
                    Exp::vector(
                        Type::mk_array(len, Type::mk_bool()),
                        (0..len)
                            .map(|i| {
                                Exp::compare(
                                    op,
                                    Exp::extract_value(
                                        lhs.clone(),
                                        vec![Exp::int_literal(i as i64, None).unwrap()],
                                    )
                                    .unwrap(),
                                    Exp::extract_value(
                                        rhs.clone(),
                                        vec![Exp::int_literal(i as i64, None).unwrap()],
                                    )
                                    .unwrap(),
                                )
                                .unwrap()
                            })
                            .collect(),
                    )
                    .unwrap()
                } else {
                    Exp::compare(op, lhs, rhs).unwrap()
                };

                let assign = Exp::var(vman.local(cur_func.as_ref(), inst.assign.as_ref()), exp.ty());
                vman.insert(inst.assign.clone(), exp.ty());
                let node = cfg.let_node(assign, exp).unwrap();

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Cast(inst) => {
                let old_ty = ast_type_to_type(&inst.old_ty, None);
                let new_ty = ast_type_to_type(&inst.new_ty, None);
                let value = ast_value_to_exp(
                    &inst.value,
                    vman,
                    Some(cur_func.clone()),
                    Some(old_ty.clone()),
                );

                let exp = match inst.op {
                    ast::CastInstOp::Zext | ast::CastInstOp::Sext | ast::CastInstOp::Trunc => {
                        // can be vectorized..
                        let op = match inst.op {
                            ast::CastInstOp::Zext => op::ExtOp::Zext,
                            ast::CastInstOp::Sext => op::ExtOp::Sext,
                            ast::CastInstOp::Trunc => op::ExtOp::Trunc,
                            _ => unreachable!(),
                        };
                        if type_is_kind!(old_ty, Type::Array) && type_is_kind!(new_ty, Type::Array)
                        {
                            let len = type_as_kind!(new_ty, Type::Array).len;
                            let new_elem_ty = type_as_kind!(new_ty, Type::Array).elem_ty.clone();
                            Exp::vector(
                                new_ty.clone(),
                                (0..len)
                                    .map(|i| {
                                        Exp::ext(
                                            op,
                                            new_elem_ty.clone(),
                                            Exp::extract_value(
                                                value.clone(),
                                                vec![Exp::int_literal(i as i64, None).unwrap()],
                                            )
                                            .unwrap(),
                                        )
                                        .unwrap()
                                    })
                                    .collect(),
                            )
                        } else {
                            Exp::ext(op, new_ty.clone(), value)
                        }
                    }

                    ast::CastInstOp::Bitcast
                        if type_is_kind!(old_ty, Type::Array)
                            && type_is_kind!(new_ty, Type::BitVec) =>
                    {
                        let n = type_as_kind!(old_ty, Type::Array).len as u32;
                        let width = type_as_kind!(new_ty, Type::BitVec).width;
                        let w = width / n;
                        Ok((0..n)
                            .map(|i| {
                                let elem = Exp::extract_value(
                                    value.clone(),
                                    vec![Exp::int_literal(i as i64, None).unwrap()],
                                )
                                .unwrap();
                                let elem = Exp::ext(op::ExtOp::Zext, new_ty.clone(), elem).unwrap();
                                Exp::arith(
                                    op::ArithOp::Shl,
                                    elem,
                                    Exp::int_literal((w * i) as i64, Some(width)).unwrap(),
                                )
                                .unwrap()
                            })
                            .reduce(|lhs, rhs| Exp::arith(op::ArithOp::Or, lhs, rhs).unwrap())
                            .unwrap())
                    }

                    ast::CastInstOp::Bitcast
                        if type_is_kind!(old_ty, Type::BitVec)
                            && type_is_kind!(new_ty, Type::Array) =>
                    {
                        let n = type_as_kind!(new_ty, Type::Array).len as u32;
                        let width = type_as_kind!(old_ty, Type::BitVec).width;
                        let w = width / n;
                        Exp::vector(
                            new_ty.clone(),
                            (0..n)
                                .map(|i| {
                                    let elem = Exp::arith(
                                        op::ArithOp::Lshr,
                                        value.clone(),
                                        Exp::int_literal((w * i) as i64, Some(width)).unwrap(),
                                    )
                                    .unwrap();
                                    Exp::ext(op::ExtOp::Trunc, Type::mk_bitvec(w), elem).unwrap()
                                })
                                .collect(),
                        )
                    }

                    ast::CastInstOp::Bitcast
                    | ast::CastInstOp::PtrToInt
                    | ast::CastInstOp::IntToPtr => Exp::bitcast(new_ty.clone(), value),
                }
                .unwrap();
                let assign = Exp::var(vman.local(cur_func.as_ref(), inst.assign.as_ref()), exp.ty());
                vman.insert(inst.assign.clone(), exp.ty());
                let node = cfg.let_node(assign, exp).unwrap();

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Binary(inst) => {
                let ty = ast_type_to_type(&inst.ty, None);
                let lhs =
                    ast_value_to_exp(&inst.lhs, vman, Some(cur_func.clone()), Some(ty.clone()));
                let rhs =
                    ast_value_to_exp(&inst.rhs, vman, Some(cur_func.clone()), Some(ty.clone()));
                let op = inst.op.into();

                // can be vectorized..
                let exp = if type_is_kind!(ty, Type::Array) {
                    let len = type_as_kind!(ty, Type::Array).len;
                    Exp::vector(
                        ty.clone(),
                        (0..len)
                            .map(|i| {
                                Exp::arith(
                                    op,
                                    Exp::extract_value(
                                        lhs.clone(),
                                        vec![Exp::int_literal(i as i64, None).unwrap()],
                                    )
                                    .unwrap(),
                                    Exp::extract_value(
                                        rhs.clone(),
                                        vec![Exp::int_literal(i as i64, None).unwrap()],
                                    )
                                    .unwrap(),
                                )
                                .unwrap()
                            })
                            .collect(),
                    )
                    .unwrap()
                } else {
                    Exp::arith(op, lhs, rhs).unwrap()
                };

                let assign = Exp::var(vman.local(cur_func.as_ref(), inst.assign.as_ref()), exp.ty());
                vman.insert(inst.assign.clone(), exp.ty());
                let node = cfg.let_node(assign, exp).unwrap();

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::AtomicBinary(inst) => {
                /* Semantics: read, modify, write, and return original */

                let ty = ast_type_to_type(&inst.ty, None);
                let ptr_ty = ast_type_to_type(&inst.ptr_ty, None);
                let ptr = ast_value_to_exp(&inst.ptr, vman, Some(cur_func.clone()), Some(ptr_ty));
                let lhs = Exp::load(ty.clone(), ptr.clone()).unwrap();

                let rhs =
                    ast_value_to_exp(&inst.value, vman, Some(cur_func.clone()), Some(ty.clone()));

                let exp = match inst.op {
                    ast::AtomicRmwOp::Xchg => rhs.clone(),
                    ast::AtomicRmwOp::Add => {
                        Exp::arith(op::ArithOp::Add, lhs.clone(), rhs.clone()).unwrap()
                    }
                    ast::AtomicRmwOp::Sub => {
                        Exp::arith(op::ArithOp::Sub, lhs.clone(), rhs.clone()).unwrap()
                    }
                    ast::AtomicRmwOp::And => {
                        Exp::arith(op::ArithOp::And, lhs.clone(), rhs.clone()).unwrap()
                    }
                    ast::AtomicRmwOp::Or => {
                        Exp::arith(op::ArithOp::Or, lhs.clone(), rhs.clone()).unwrap()
                    }
                    ast::AtomicRmwOp::Xor => {
                        Exp::arith(op::ArithOp::Xor, lhs.clone(), rhs.clone()).unwrap()
                    }
                    _ => todo!(),
                };
                let store = Exp::store(ptr, exp).unwrap();

                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let tmp = Exp::var(vman.temporary(), Type::mk_unit());
                let store = cfg.let_node(tmp, store).unwrap();
                let node = cfg.let_node(assign, lhs).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, store).unwrap();
                cfg.connect(store, node).unwrap();
                cur = node;
            }
            ast::Inst::CmpXchg(inst) => {
                let value_ty = ast_type_to_type(&inst.ty, None);
                let pointer = ast_value_to_exp(
                    &inst.pointer,
                    vman,
                    Some(cur_func.clone()),
                    Some(Type::mk_pointer()),
                );
                let cmp = ast_value_to_exp(
                    &inst.cmp,
                    vman,
                    Some(cur_func.clone()),
                    Some(value_ty.clone()),
                );
                let new = ast_value_to_exp(
                    &inst.new,
                    vman,
                    Some(cur_func.clone()),
                    Some(value_ty.clone()),
                );

                let old = Exp::var(
                    vman.local(
                        cur_func.as_ref(),
                        format!("{}.old", inst.assign).as_str(),
                    ),
                    value_ty.clone(),
                );
                let load = Exp::load(value_ty.clone(), pointer.clone()).unwrap();
                let cmp = Exp::compare(op::CompareOp::Eq, old.clone(), cmp.clone()).unwrap();
                let store = Exp::store(pointer, new).unwrap();
                let ty = Type::mk_tuple([value_ty, Type::mk_bool()]);
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );

                let load_node = cfg.let_node(old.clone(), load).unwrap();
                let ok_node = cfg.assume_node(cmp.clone()).unwrap();
                let ok_store_node = cfg.let_node(
                    Exp::var(vman.temporary(), Type::mk_unit()), 
                    store
                ).unwrap();

                let ok_assign_node = cfg.let_node(
                    assign.clone(),
                    Exp::tuple(vec![old.clone(), Exp::true_exp()], false),
                )
                .unwrap();

                let err_node = cfg.assume_node(Exp::not(cmp).unwrap()).unwrap();
                let err_assign_node = cfg.let_node(
                    assign.clone(),
                    Exp::tuple(vec![old.clone(), Exp::false_exp()], false),
                )
                .unwrap();

                let exit_node = cfg.noop_node();

                cfg.connect(cur, load_node).unwrap();
                cfg.connect(load_node, ok_node).unwrap();
                cfg.connect(load_node, err_node).unwrap();
                cfg.connect(ok_node, ok_store_node).unwrap();
                cfg.connect(ok_store_node, ok_assign_node).unwrap();
                cfg.connect(err_node, err_assign_node).unwrap();
                cfg.connect(ok_assign_node, exit_node).unwrap();
                cfg.connect(err_assign_node, exit_node).unwrap();
                vman.insert(inst.assign.clone(), ty);
                cur = exit_node;
            }
            ast::Inst::ShuffleVector(inst) => {
                let v1ty = ast_type_to_type(&inst.v1ty, None);
                let v2ty = ast_type_to_type(&inst.v2ty, None);
                let mty = ast_type_to_type(&inst.mty, None);
                let v1 = ast_value_to_exp(&inst.v1, vman, Some(cur_func.clone()), Some(v1ty));
                let v2 = ast_value_to_exp(&inst.v2, vman, Some(cur_func.clone()), Some(v2ty));
                let mask = ast_value_to_exp(&inst.mask, vman, Some(cur_func.clone()), Some(mty));

                // <n x ty> <n x ty> => <m x ty>
                assert!(type_eq!(v1.ty(), v2.ty()));
                assert!(type_is_kind!(v1.ty(), Type::Array));
                assert!(type_is_kind!(mask.ty(), Type::Array));
                let ety = type_as_kind!(v1.ty(), Type::Array).elem_ty.clone();
                let n = type_as_kind!(v1.ty(), Type::Array).len;
                let m = type_as_kind!(mask.ty(), Type::Array).len;
                // the mask is guaranteed to be constant
                let mask = match mask.as_ref() {
                    Exp::Vector(v) => v
                        .elems
                        .iter()
                        .map(|e| match e.as_ref() {
                            Exp::IntLiteral(v) => v.value as usize,
                            Exp::Havoc(_) => usize::MAX,
                            _ => unreachable!(),
                        })
                        .collect::<Vec<_>>(),
                    Exp::Havoc(_) => vec![usize::MAX; m],
                    _ => unreachable!(),
                };

                // use a bunch of `ExtractValue`s to do the job
                let elems = mask
                    .into_iter()
                    .map(|i| {
                        if i >= 2 * n {
                            Exp::havoc(ety.clone())
                        } else {
                            let v = if i < n { v1.clone() } else { v2.clone() };
                            let idx = Exp::int_literal((i % n) as i64, None).unwrap();
                            Exp::extract_value(v, vec![idx]).unwrap()
                        }
                    })
                    .collect();
                let shuffled = Exp::vector(Type::mk_array(m, ety), elems).unwrap();

                let ty = shuffled.ty();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, shuffled).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Gep(inst) => {
                let exp = ast_gep(vman, &inst.value, Some(cur_func.clone()), None);
                let ty = exp.ty();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, exp).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Load(inst) => {
                let ptr_ty = ast_type_to_type(&inst.ptr_ty, None);
                let ptr = ast_value_to_exp(&inst.ptr, vman, Some(cur_func.clone()), Some(ptr_ty));
                let ty = ast_type_to_type(&inst.ty, None);
                let exp = Exp::load(ty.clone(), ptr).unwrap();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, exp).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Store(inst) => {
                let ptr_ty = ast_type_to_type(&inst.ptr_ty, None);
                let ptr = ast_value_to_exp(&inst.ptr, vman, Some(cur_func.clone()), Some(ptr_ty));
                let vty = ast_type_to_type(&inst.ty, None);
                let value = ast_value_to_exp(&inst.value, vman, Some(cur_func.clone()), Some(vty));
                let exp = Exp::store(ptr, value).unwrap();
                let tmp = {
                    let unit = Type::mk_unit();
                    Exp::var(vman.temporary(), unit)
                };
                let node = cfg.let_node(tmp, exp).unwrap();

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Branch(inst) => {
                // Conditional branching
                let label = lman.get(&label);
                let label_exp = Exp::int_literal(label, None).unwrap();
                let node = cfg.let_node(
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::PREV_LABEL), label_exp.ty()),
                    label_exp,
                ).unwrap();
                cfg.connect(cur, node).unwrap();
                cur = node;

                let bool_ty = Type::mk_bool();
                let cond_exp =
                    ast_value_to_exp(&inst.cond, vman, Some(cur_func.clone()), Some(bool_ty));
                let true_node = cfg.assume_node(cond_exp.clone()).unwrap();
                let true_label_node = cfg.label_node(inst.if_label);
                let false_node = cfg.assume_node(Exp::not(cond_exp).unwrap()).unwrap();
                let false_label_node = cfg.label_node(inst.else_label);

                cfg.connect(cur, true_node).unwrap();
                cfg.connect(cur, false_node).unwrap();
                cfg.connect(true_node, true_label_node).unwrap();
                cfg.connect(false_node, false_label_node).unwrap();
                break; // `br` terminates a block
            }
            ast::Inst::Jump(inst) => {
                // Unconditional jump
                let label = lman.get(&label);
                let label_exp = Exp::int_literal(label, None).unwrap();
                let node = cfg.let_node(
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::PREV_LABEL), label_exp.ty()),
                    label_exp
                ).unwrap();
                let label_node = cfg.label_node(inst.target);

                cfg.connect(cur, node).unwrap();
                cfg.connect(node, label_node).unwrap();
                break; // `jump` terminates a block
            }
            ast::Inst::Switch(inst) => {
                // Chained conditional branches
                let label = lman.get(&label);
                let label_exp = Exp::int_literal(label, None).unwrap();
                let node = cfg.let_node(
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::PREV_LABEL), label_exp.ty()),
                    label_exp
                ).unwrap();
                let def_label_node = cfg.label_node(inst.def_label);

                let ty = ast_type_to_type(&inst.ty, None);
                let value_exp =
                    ast_value_to_exp(&inst.value, vman, Some(cur_func.clone()), Some(ty.clone()));
                // if == => label; if != => ...
                let last_node = inst
                    .branches
                    .iter()
                    .fold(node.clone(), |node, (case, label)| {
                        let case_exp =
                            ast_value_to_exp(case, vman, Some(cur_func.clone()), Some(ty.clone()));
                        let cond_exp =
                            Exp::compare(op::CompareOp::Eq, value_exp.clone(), case_exp.clone())
                                .unwrap();
                        let true_node = cfg.assume_node(cond_exp).unwrap();
                        let true_label_node = cfg.label_node(label.clone());
                        let false_node = cfg.assume_node(
                            Exp::compare(op::CompareOp::Neq, value_exp.clone(), case_exp).unwrap(),
                        )
                        .unwrap();

                        cfg.connect(node, true_node).unwrap();
                        cfg.connect(node, false_node).unwrap();
                        cfg.connect(true_node, true_label_node).unwrap();

                        false_node
                    });

                cfg.connect(cur, node).unwrap();
                cfg.connect(last_node, def_label_node).unwrap();
                break; // `switch` terminates a block
            }
            ast::Inst::Phi(_) => unreachable!("phi should only be at the start of a block"),
            ast::Inst::Unreachable => {
                let panic_node = cfg.panic_node(None);
                cfg.connect(cur, panic_node).unwrap();
                break; // `unreachable` terminates a block
            }
            ast::Inst::ExtractValue(inst) => {
                let agg_ty = ast_type_to_type(&inst.ty, None);
                let agg = ast_value_to_exp(
                    &inst.agg,
                    vman,
                    Some(cur_func.clone()),
                    Some(agg_ty.clone()),
                );
                let int_ty = Type::mk_int();
                let indices = inst
                    .indices
                    .iter()
                    .map(|index| {
                        ast_value_to_exp(index, vman, Some(cur_func.clone()), Some(int_ty.clone()))
                    })
                    .collect();

                let exp = Exp::extract_value(agg, indices).unwrap();
                let ty = exp.ty();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, exp).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Select(inst) => {
                let bool_ty = Type::mk_bool();
                let cond_exp =
                    ast_value_to_exp(&inst.cond, vman, Some(cur_func.clone()), Some(bool_ty));
                let ty = ast_type_to_type(&inst.ty, None);
                let lexp = ast_value_to_exp(
                    &inst.if_value,
                    vman,
                    Some(cur_func.clone()),
                    Some(ty.clone()),
                );
                let rexp = ast_value_to_exp(
                    &inst.else_value,
                    vman,
                    Some(cur_func.clone()),
                    Some(ty.clone()),
                );
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                vman.insert(inst.assign.clone(), ty);

                let true_let_node = cfg.let_node(assign.clone(), lexp).unwrap();
                let true_node = cfg.assume_node(cond_exp.clone()).unwrap();
                let false_let_node = cfg.let_node(assign.clone(), rexp).unwrap();
                let false_node = cfg.assume_node(Exp::not(cond_exp).unwrap()).unwrap();
                let exit_node = cfg.noop_node();

                cfg.connect(cur, true_node).unwrap();
                cfg.connect(cur, false_node).unwrap();
                cfg.connect(true_node, true_let_node).unwrap();
                cfg.connect(false_node, false_let_node).unwrap();
                cfg.connect(true_let_node, exit_node).unwrap();
                cfg.connect(false_let_node, exit_node).unwrap();

                cur = exit_node;
            }
            ast::Inst::InsertValue(inst) => {
                let agg_ty = ast_type_to_type(&inst.ty, None);
                let agg = ast_value_to_exp(
                    &inst.agg,
                    vman,
                    Some(cur_func.clone()),
                    Some(agg_ty.clone()),
                );
                let int_ty = Type::mk_int();
                let indices = inst
                    .indices
                    .iter()
                    .map(|index| {
                        ast_value_to_exp(index, vman, Some(cur_func.clone()), Some(int_ty.clone()))
                    })
                    .collect();
                let vty = ast_type_to_type(&inst.vty, None);
                let value_exp =
                    ast_value_to_exp(&inst.value, vman, Some(cur_func.clone()), Some(vty));

                let exp = Exp::insert_value(agg, value_exp, indices).unwrap();
                let ty = exp.ty();
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, exp).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Freeze(inst) => {
                let ty = ast_type_to_type(&inst.ty, None);
                let value =
                    ast_value_to_exp(&inst.value, vman, Some(cur_func.clone()), Some(ty.clone()));
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(assign, value).unwrap();
                vman.insert(inst.assign.clone(), ty);

                cfg.connect(cur, node).unwrap();
                cur = node;
            }

            ast::Inst::Invoke(inst) => {
                let label = lman.get(&label);
                let label_exp = Exp::int_literal(label, None).unwrap();
                let node = cfg.let_node(
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::PREV_LABEL), label_exp.ty()),
                    label_exp
                ).unwrap();
                cfg.connect(cur, node).unwrap();
                cur = node;

                let funct = ast_value_to_exp(&inst.fid, vman, Some(cur_func.clone()), None);

                let ret_ty = ast_type_to_type(&inst.ty, None);
                let args = inst
                    .args
                    .iter()
                    .map(|arg| {
                        let aty = ast_type_to_type(&arg.ty, None);
                        ast_value_to_exp(&arg.value, vman, Some(cur_func.clone()), Some(aty))
                    })
                    .collect();

                let assign = if let Some(assign) = &inst.assign {
                    vman.insert(assign.clone(), ret_ty.clone());
                    Exp::var(vman.local(cur_func.as_ref(), assign.as_ref()), ret_ty)
                } else {
                    Exp::var(vman.temporary(), ret_ty)
                };

                let ex_flg = Exp::var(
                    vman.local(cur_func.as_ref(), ValueDesc::EX_FLG),
                    Type::mk_bool(),
                );

                let func_call_node = cfg.func_call_node(
                    assign,
                    funct,
                    args,
                )
                .unwrap();

                let ok_node = cfg.assume_node(Exp::not(ex_flg.clone()).unwrap()).unwrap();
                let ex_node = cfg.assume_node(ex_flg).unwrap();
                let ok_label_node = cfg.label_node(inst.exception_labels.0);
                let ex_label_node = cfg.label_node(inst.exception_labels.1);

                cfg.connect(cur, func_call_node).unwrap();
                cfg.connect(func_call_node, ok_node).unwrap();
                cfg.connect(func_call_node, ex_node).unwrap();
                cfg.connect(ok_node, ok_label_node).unwrap();
                cfg.connect(ex_node, ex_label_node).unwrap();

                break; // `invoke` terminates a block
            }
            ast::Inst::LandingPad(inst) => {
                let ty = ast_type_to_type(&inst.ty, None);
                let assign = Exp::var(
                    vman.local(cur_func.as_ref(), inst.assign.as_ref()),
                    ty.clone(),
                );
                let node = cfg.let_node(
                    assign, 
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::THROW_VAL), ty.clone())
                ).unwrap();
                vman.insert(inst.assign, ty);
                cfg.connect(cur, node).unwrap();
                cur = node;
            }
            ast::Inst::Resume(inst) => {
                let throw_ty = ast_type_to_type(&inst.ty, None);
                let throw_exp = ast_value_to_exp(
                    &inst.value,
                    vman,
                    Some(cur_func.clone()),
                    Some(throw_ty.clone()),
                );

                let assign_node = cfg.let_node(
                    Exp::var(vman.local(cur_func.as_ref(), ValueDesc::THROW_VAL), throw_ty.clone()), throw_exp
                ).unwrap();
                let throw_node = cfg.return_node(true);

                cfg.connect(cur, assign_node).unwrap();
                cfg.connect(assign_node, throw_node).unwrap();
                break; // `resume` terminates a block
            }
            ast::Inst::Ignored => { /* No-op */ }
        }
    }
    (StringRef::from(label), entry)
}

/// Connects the blocks in `blocks`, using `CfgNode::Label` nodes
/// and string labels as connect points.
///
/// The connected blocks then form a valid CFG.
fn ast_connect_block(blocks: &HashMap<StringRef, CfgNodeId>, cfg: &mut Cfg) {
    let mut connect_points = Vec::new();
    for block in blocks.values() {
        // BFS to find all `CfgNode::Label` nodes, since
        // block CFG is typically "deep and narrow".
        let mut q = VecDeque::new();
        let mut visited = HashSet::new();
        q.push_back(block.clone());
        while let Some(id) = q.pop_front() {
            if visited.contains(&id) {
                continue;
            }
            visited.insert(id);

            let node = cfg.at(id);

            if matches!(node, CfgNode::Label(_)) {
                connect_points.push(id);
            }
            for nxt in node.succ() {
                q.push_back(*nxt);
            }
        }
    }
    for from in connect_points {
        let node = cfg.at(from);
        let CfgNode::Label(LabelNode { label, .. }) = node else {
            panic!("[AST_CONNECT_BLOCK] connect point should be a CfgNode::Label node")
        };

        let to = blocks
            .get(label)
            .unwrap_or_else(|| panic!("[AST_CONNECT_BLOCK] label {label} is not defined"))
            .clone();

        // Connect
        cfg.connect(from, to).unwrap();
    }
}

#[derive(Debug)]
struct LabelManager {
    default_label: StringRef,
    label_map: HashMap<StringRef, i64>,
}

impl LabelManager {
    pub fn with_blocks(blocks: &[ast::Block]) -> Self {
        let mut label_map = HashMap::new();
        for (id, block) in blocks.iter().enumerate() {
            let label = StringRef::from(format!("%{}", block.label));
            assert!(
                !label_map.contains_key(&label),
                "[LabelManager::with_blocks] duplicate label {}",
                label
            );
            label_map.insert(label, id as i64);
        }
        LabelManager {
            default_label: StringRef::from(format!("%{}", ast::ENTRY_LABEL)),
            label_map,
        }
    }

    /// Get the label ID for `label`.
    /// If `label` is not registered, the ID of the entry block is returned. This
    /// is because LLVM sometimes omit block ID for the entry block.
    pub fn get(&self, label: &str) -> i64 {
        if let Some(label) = self.label_map.get(label) {
            *label
        } else {
            *self.label_map.get(&self.default_label).unwrap()
        }
    }
}

#[cfg(test)]
impl std::process::Termination for See {
    fn report(self) -> std::process::ExitCode {
        std::process::ExitCode::from(0)
    }
}

/// Make a `See` from the given IR file and config file
pub fn parse(ir: &str, config: Option<&str>) -> See {
    let prog = llvm_frontend::ast::parse(ir);
    let builder = ast_fe_to_me(prog);
    if let Some(config) = config {
        builder.config(Config::toml(config)).ok()
    } else {
        builder.ok()
    }
}

#[cfg(test)]
pub mod tests {
    use super::*;
    use llvm_frontend::ast::parse;

    #[test]
    pub fn llvm_glue_simple() -> See {
        let prog = parse("test/llvm/simple.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_store() -> See {
        let prog = parse("test/llvm/store.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_panic() -> See {
        let prog = parse("test/llvm/panic.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_recurse() -> See {
        let prog = parse("test/llvm/recurse.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_funcp() -> See {
        let prog = parse("test/llvm/funcp.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_intrinsic() -> See {
        let prog = parse("test/llvm/intrinsic.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_loop() -> See {
        let prog = parse("test/llvm/loop.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_data() -> See {
        let prog = parse("test/llvm/data.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_leak() -> See {
        let prog = parse("test/llvm/leak.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.leak.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_leak_ptr() -> See {
        let prog = parse("test/llvm/leak_ptr.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.leak_ptr.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_question() -> See {
        let prog = parse("test/llvm/question.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_pointers() -> See {
        let prog = parse("test/llvm/pointers.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_heap() -> See {
        let prog = parse("test/llvm/heap.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.heap.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_boolean() -> See {
        let prog = parse("test/llvm/boolean.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_switch() -> See {
        let prog = parse("test/llvm/switch.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_exception() -> See {
        let prog = parse("test/llvm/exception.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.exception.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real1() -> See {
        let prog = parse("test/llvm/tree.O1.opt.oz.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real2() -> See {
        let prog = parse("test/llvm/lookup.O1.opt.oz.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real3() -> See {
        let prog = parse("test/llvm/dns.O1.opt.oz.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real4() -> See {
        let prog = parse("test/llvm/query.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real5() -> See {
        let prog = parse("test/llvm/rdata.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_real6() -> See {
        let prog = parse("test/llvm/dnsname.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/llvm/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_coredns() -> See {
        let prog = parse("test/coredns/lookup.O1.opt.oz.verify.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/coredns/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_bind() -> See {
        let prog = parse("test/bind/bind.opt.oz.verify.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/bind/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_pdns() -> See {
        let prog = parse("test/pdns/pdns.opt.oz.verify.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/pdns/config.toml"))
            .ok()
    }

    #[test]
    pub fn llvm_glue_hickory_dns() -> See {
        let prog = parse("test/hickory-dns/hickory-dns.oz.verify.ll");
        ast_fe_to_me(prog)
            .config(Config::toml("test/hickory-dns/config.toml"))
            .ok()
    }
}
