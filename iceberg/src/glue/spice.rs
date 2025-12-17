//! This module implements functionalities that glues the
//! SpIce frontend and the middleend.
//!
//! Regarding name conflictions between `Type`s and other names in
//! the frontend and the middleend: the principle is **middleend**
//! first.

use crate::middleend::*;
use crate::util::{Nonce, StringRef, Timed};
use log::debug;
use spice_frontend::ast;
use std::collections::HashMap;
use std::fmt;
use std::rc::Rc;

// TODO: The error handling in SpIce frontend demands a total rework;
// what we are looking for instead:
//
// *    Add token position in the raw file so that we can pretty-print
//      the diagnosis.
// *    Either use `Panicable` or bail out right at error sites; otherwise
//      figuring out error causes is a nightmare.
// *    For god's sake, we don't need all these different types of errors,
//      since we're not doing recovery anyway.

pub enum Error {
    /// Redefinition of an identifier.
    IdentRedef(String),
    /// Missing definition of an indentifier.
    IdentUndef(String),
    /// Missing definition of a type.
    TypeUndef(String),
    /// Mismatched type (expr, expected, found).
    TypeMismatch(String, String, String),
    /// Misinferred type (expected, inferred).
    TypeMisinferred(String, String),
    /// Cannot infer a type when needed.
    TypeInferFailure,
    /// Mismatched function argument count (expected, found).
    FuncArgMismatch(usize, usize),
    /// Invalid struct field name.
    InvalidStructField(String),
    /// Missing struct field name.
    MissingStructField(String),
    /// Invalid enum variant name.
    InvalidEnumVariant(String, String),
    /// Generic error; for development only
    Generic(String),
}

impl fmt::Display for Error {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        match self {
            Error::IdentRedef(id) => write!(f, "Redefinition of identifier {id}"),
            Error::IdentUndef(id) => write!(f, "Undefined identifier {id}"),
            Error::TypeUndef(id) => write!(f, "Undefined type {id}"),
            Error::TypeMismatch(expr, expected, found) => {
                write!(
                    f,
                    "Mismatched types for {expr};\nExpected {expected}, found {found}"
                )
            }
            Error::TypeMisinferred(expected, inferred) => write!(
                f,
                "Mismatched types; expected {expected}, found {inferred} (inferred)"
            ),
            Error::TypeInferFailure => write!(f, "Cannot infer the type"),
            Error::FuncArgMismatch(expected, ref found) => write!(
                f,
                "Mismatched function argument count; expected {}, found {}",
                *expected, *found
            ),
            Error::InvalidStructField(field) => {
                write!(f, "struct does not have a field named {field}")
            }
            Error::MissingStructField(struct_name) => {
                write!(f, "missing field from struct {struct_name}")
            }
            Error::InvalidEnumVariant(enum_name, variant) => write!(
                f,
                "enum {enum_name} does not have a variant named {variant}"
            ),
            Error::Generic(msg) => write!(f, "{msg}"),
        }
    }
}

impl From<&ast::ArithOp> for op::ArithOp {
    fn from(value: &ast::ArithOp) -> Self {
        match value {
            ast::ArithOp::Add => op::ArithOp::Add,
            ast::ArithOp::Sub => op::ArithOp::Sub,
            ast::ArithOp::And => op::ArithOp::And,
            ast::ArithOp::Or => op::ArithOp::Or,
            ast::ArithOp::Xor => op::ArithOp::Xor,
            ast::ArithOp::Shl => op::ArithOp::Shl,
            ast::ArithOp::Lshr => op::ArithOp::Lshr,
            ast::ArithOp::Ashr => op::ArithOp::Ashr,
        }
    }
}

impl From<&ast::BoolOp> for op::BoolOp {
    fn from(value: &ast::BoolOp) -> Self {
        match value {
            ast::BoolOp::And => op::BoolOp::And,
            ast::BoolOp::Or => op::BoolOp::Or,
        }
    }
}

impl From<&ast::CompareOp> for op::CompareOp {
    fn from(value: &ast::CompareOp) -> Self {
        match value {
            ast::CompareOp::Eq => op::CompareOp::Eq,
            ast::CompareOp::Neq => op::CompareOp::Neq,
            ast::CompareOp::Ugt => op::CompareOp::Ugt,
            ast::CompareOp::Uge => op::CompareOp::Uge,
            ast::CompareOp::Ult => op::CompareOp::Ult,
            ast::CompareOp::Ule => op::CompareOp::Ule,
            ast::CompareOp::Sgt => op::CompareOp::Sgt,
            ast::CompareOp::Sge => op::CompareOp::Sge,
            ast::CompareOp::Slt => op::CompareOp::Slt,
            ast::CompareOp::Sle => op::CompareOp::Sle,
        }
    }
}

impl From<&ast::ExtOp> for op::ExtOp {
    fn from(value: &ast::ExtOp) -> Self {
        match value {
            ast::ExtOp::Sext => op::ExtOp::Sext,
            ast::ExtOp::Zext => op::ExtOp::Zext,
            ast::ExtOp::Trunc => op::ExtOp::Trunc,
        }
    }
}

/// A symbol table that manages all name-related resolutions in the
/// SpIce language.
struct SymbolTable<'see> {
    /// Symbol bindings indexed by name.
    symbols: HashMap<StringRef, Vec<Timed<Rc<Exp>>>>,

    /// Function entities
    functions: HashMap<StringRef, Rc<Function>>,

    /// A map of (<struct type, field name> -> field index).
    struct_fields: HashMap<(HashPtrType, StringRef), usize>,

    /// Generic related states.
    gtable: GenericTable,

    /// Scopes for solving name versions
    scopes: Vec<StringRef>,

    /// Nonce counter.
    nonce: Nonce,

    // ..wraps the middleend `ValueState`
    vstate: &'see mut ValueState,
}

/// Collection of generic-related states.
#[derive(Default)]
struct GenericTable {
    /// Generic function definitions.
    functions: HashMap<StringRef, Rc<spice_frontend::ast::FuncDef>>,

    /// A stack of generic type mapping for solving generic types.
    types: Vec<HashMap<StringRef, Rc<Type>>>,

    /// All functions instantiated from generic definitions.
    ///
    /// The instantiated functions are unique by the function name and instantiated
    /// function type. The mapped value is the mangled function name.
    instantiations: HashMap<(StringRef, HashPtrType), StringRef>,
}

impl<'see> SymbolTable<'see> {
    pub fn new(vstate: &'see mut ValueState) -> Self {
        SymbolTable {
            symbols: HashMap::new(),
            functions: HashMap::new(),
            struct_fields: HashMap::new(),
            gtable: GenericTable::default(),
            scopes: Vec::new(),
            nonce: Nonce::new(),
            vstate,
        }
    }

    // --- relayed to `ValueState` ---
    pub fn local(&mut self, scope: &str, name: &str) -> ValueDesc {
        self.vstate.local(scope, name) 
    }

    /// Bind `value` to `name`; returns an error if `name` is already bound
    /// within the current scope.
    ///
    /// If `global` is true, this is a global binding.
    /// The `name` must only be bound nonce, and does not conform to the current scope.
    pub fn bind(&mut self, name: StringRef, value: Rc<Exp>, global: bool) -> Result<(), Error> {
        let ts: usize = if global { 0 } else { self.scopes.len() };
        let obj = Timed::new(value, ts);

        if let Some(defs) = self.symbols.get_mut(&name) {
            match defs.last() {
                Some(def) if def.timestamp() >= ts => {
                    return Err(Error::IdentRedef(name.as_ref().into()))
                }
                _ => defs.push(obj),
            }
        } else {
            self.symbols.insert(name, vec![obj]);
        }
        Ok(())
    }

    /// Get the value bound on `name`.
    ///
    /// In the case that the name is unbound and no hint is given, returns an error.
    /// In the case of a bound value but a different `hint`, also returns an error.
    pub fn get(&mut self, name: &str, hint: Option<Rc<Type>>) -> Result<Rc<Exp>, Error> {
        let binding = self
            .symbols
            .get(name)
            .and_then(|defs| defs.last().map(Timed::get));

        match (binding, hint) {
            (Some(exp), None) => Ok(exp.clone()),
            (Some(exp), Some(hint)) => {
                if !type_eq!(exp.ty(), hint) {
                    Err(Error::TypeMismatch(
                        name.into(),
                        hint.to_string(),
                        exp.ty().to_string(),
                    ))
                } else {
                    Ok(exp.clone())
                }
            }
            // (None, Some(_)) => todo!(),
            (None, _) => Err(Error::IdentUndef(name.into())),
        }
    }

    /// Starts a new scope.
    pub fn push_scope(&mut self, scope: StringRef) {
        self.scopes.push(scope);
    }

    /// Pops the latest scope.
    pub fn pop_scope(&mut self) {
        assert!(!self.scopes.is_empty());
        _ = self.scopes.pop();

        for defs in self.symbols.values_mut() {
            while let Some(obj) = defs.last() {
                if obj.timestamp() > self.scopes.len() {
                    defs.pop();
                } else {
                    break;
                }
            }
        }
    }

    /// Get the current scope.
    pub fn scope(&self) -> Option<StringRef> {
        self.scopes.last().cloned()
    }

    pub fn nonce(&mut self) -> usize {
        self.nonce.get() as usize
    }

    /// Register a struct type and its fields to the symbol table.
    pub fn register_struct_field(&mut self, struct_ty: Rc<Type>, fields: Vec<StringRef>) {
        let ty = HashPtrType::from(struct_ty.clone());
        for (i, field) in fields.into_iter().enumerate() {
            let key = (ty.clone(), field);
            if self.struct_fields.contains_key(&key) {
                continue; // XXX: cannot have multiple names for the same tuple?
            }
            self.struct_fields.insert(key, i);
        }
    }

    /// Resolve a struct type and field name to its index in the type definition.
    pub fn resolve_struct_field(
        &self,
        struct_ty: Rc<Type>,
        field: StringRef,
    ) -> Result<usize, Error> {
        self.struct_fields
            .get(&(HashPtrType::from(struct_ty.clone()), field.clone()))
            .cloned()
            .ok_or_else(|| Error::InvalidStructField(field.to_string()))
    }

    /// Resolve a generic type by its identifier.
    pub fn resolve_generic_type(&self, gid: &str) -> Result<Rc<Type>, Error> {
        self.gtable
            .types
            .last()
            .ok_or_else(|| {
                Error::Generic(format!("generic type {gid} outside of a generic function"))
            })?
            .get(gid)
            .ok_or_else(|| Error::Generic(format!("unbound generic type {gid}")))
            .cloned()
    }
}

/// Merges the frontend SpIce AST into the given middleend `AST`.
///
/// Performs rigorous type checks to ensure well-formedness of
/// the built `Ast`.
fn ast_fe_to_me(
    ast: ast::Prog,
    me: &mut SeeBuilder<crate::middleend::se::Parsed>,
) -> Result<(), Error> {
    let mut st = SymbolTable::new(me.vstate_mut());
    // let global_inits = &mut me.global_inits;

    // First collect types
    let all_decls = HashMap::from_iter(ast.decls.iter().filter_map(|decl| match decl {
        ast::Decl::TypeDecl(type_decl) => match type_decl {
            ast::TypeDecl::EnumDecl(decl) => Some((decl.tid.clone(), type_decl)),
            ast::TypeDecl::StructDecl(decl) => Some((decl.tid.clone(), type_decl)),
        },
        _ => None,
    }));
    for decl in ast.decls.iter() {
        match decl {
            ast::Decl::TypeDecl(type_decl) => {
                ast_type_decl_to_type(type_decl, &mut st, Some(&all_decls))?;
            }
            _ => {}
        }
    }

    // Then collect all non-generic function signatures
    for decl in ast.decls.iter() {
        match decl {
            ast::Decl::FuncDef(func_def) => {
                if func_def.glist.is_none() {
                    let ret_ty = match &func_def.ret_ty {
                        Some(ty) => ast_type_to_type(&ty, &mut st, None)?,
                        None => Type::mk_unit(),
                    };

                    let arg_ty = func_def
                        .args
                        .iter()
                        .map(|(_, ty)| ast_type_to_type(ty, &mut st, None))
                        .collect::<Result<Vec<_>, Error>>()?;

                    let func_ty = Type::mk_lambda(ret_ty, arg_ty, false);
                    debug!(
                        "[AST_FE_TO_ME] Function {} is bound to signature {func_ty}",
                        func_def.fid
                    );

                    // Non-generic functions are registered as global `Exp::Var`s
                    let func_var = Exp::ident(func_ty, func_def.fid.clone());
                    st.bind(func_def.fid.clone(), func_var, true)?;
                }
            }
            ast::Decl::ExternFuncDecl(func_decl) => {
                let ret_ty = match &func_decl.ret_ty {
                    Some(ty) => ast_type_to_type(&ty, &mut st, None)?,
                    None => Type::mk_unit(),
                };

                let arg_ty = func_decl
                    .args
                    .iter()
                    .map(|ty| ast_type_to_type(ty, &mut st, None))
                    .collect::<Result<Vec<_>, Error>>()?;

                let func_ty = Type::mk_lambda(ret_ty, arg_ty, false);
                debug!(
                    "[AST_FE_TO_ME] Function {} is bound to signature {func_ty}",
                    func_decl.fid
                );
                let func_var = Exp::ident(func_ty.clone(), func_decl.linkage.clone());
                st.bind(func_decl.fid.clone(), func_var, true)?;

                // // Extern functions are linked to the right name
                // global_inits.push((
                //     func_decl.fid.clone(),
                //     Initializer::ByValue(Exp::ident(func_ty, func_decl.linkage.clone())),
                // ));
            }
            _ => {}
        }
    }

    // Separate generic and normal function definitions
    let func_defs = ast
        .decls
        .into_iter()
        .filter_map(|decl| {
            if let ast::Decl::FuncDef(func_def) = decl {
                if func_def.glist.is_some() {
                    st.gtable
                        .functions
                        .insert(func_def.fid.clone(), Rc::new(func_def));
                    None
                } else {
                    Some(func_def)
                }
            } else {
                None
            }
        })
        .collect::<Vec<_>>();

    // Finally build functions
    for func_def in func_defs {
        let function = ast_function_def(&func_def, func_def.fid.clone(), &mut st)?;
        st.functions
            .insert(func_def.fid, Rc::new(function));
    }

    assert!(st.scope().is_none());
    let functions = st.functions.into_iter();
    me.ast().functions.extend(functions);
    Ok(())
}

/// Parses frontend `type_decl`, and records it as a to-be alias.
fn ast_type_decl_to_type(
    type_decl: &ast::TypeDecl,
    st: &mut SymbolTable,
    all_decls: Option<&HashMap<StringRef, &ast::TypeDecl>>,
) -> Result<Rc<Type>, Error> {
    let (ty, name, linkage) = match type_decl {
        ast::TypeDecl::EnumDecl(enum_decl) => {
            let enum_ty = Type::mk_enum(enum_decl.tid.clone(), enum_decl.discriminants.clone());
            let name = enum_decl.tid.clone();
            (Some(enum_ty), name, None)
        }
        ast::TypeDecl::StructDecl(struct_decl) => {
            let name = struct_decl.tid.clone();
            let tuple_ty = if let Some(decl_fields) = &struct_decl.fields {
                let mut field_names = Vec::with_capacity(decl_fields.len());
                let mut fields = Vec::with_capacity(decl_fields.len());
                for (fname, ty) in decl_fields.iter() {
                    field_names.push(fname.clone());
                    fields.push(ast_type_to_type(ty, st, all_decls)?);
                }
                let ty = if struct_decl.packed {
                    Type::mk_tuple_packed(fields)
                } else {
                    Type::mk_tuple(fields)
                };
                st.register_struct_field(ty.clone(), field_names);
                Some(ty)
            } else {
                None
            };
            (tuple_ty, name, struct_decl.linkage.clone())
        }
    };

    let bound = Type::resolve(name.as_ref()).is_ok();
    if let Some(linkage) = linkage {
        // If the type is linked to an existing type, add an alias
        let linked = Type::resolve(&linkage)
            .unwrap_or_else(|_| panic!("linked type {linkage} should be bound"));
        if let Some(ty) = ty {
            assert!(
                type_eq!(ty, linked),
                "linked type {linkage} is {linked}, not {ty}"
            );
            if !bound {
                Type::bind(name, linked.clone()).unwrap();
            }
        } else {
            if !bound {
                Type::bind(name, linked.clone()).unwrap();
            }
        }
        Ok(linked)
    } else {
        // ..otherwise, use the SpIce definition
        let Some(ty) = ty else {
            unreachable!() // neither linked nor defined!
        };
        if !bound {
            Type::bind(name, ty.clone()).unwrap();
        }
        Ok(ty)
    }
}

/// Resolve a frontend type declaration as a `Type`.
fn ast_type_to_type(
    ast_ty: &ast::Type,
    st: &mut SymbolTable,
    all_decls: Option<&HashMap<Rc<str>, &ast::TypeDecl>>,
) -> Result<Rc<Type>, Error> {
    match ast_ty {
        ast::Type::Unit => Ok(Type::mk_unit()),
        ast::Type::Named(name) => Type::resolve(name).or_else(|_| {
            if let Some(all_decls) = all_decls {
                let decl = all_decls
                    .get(name)
                    .ok_or_else(|| Error::TypeUndef(name.to_string()))?;
                let ty = ast_type_decl_to_type(decl, st, Some(all_decls))?;
                Ok(ty)
            } else {
                Err(Error::TypeUndef(name.to_string()))
            }
        }),
        ast::Type::List(elem_ast_ty) => {
            let elem_ty = ast_type_to_type(elem_ast_ty, st, all_decls)?;
            Ok(Type::mk_list(elem_ty))
        }
        ast::Type::Array(elem_ast_ty, len) => {
            let elem_ty = ast_type_to_type(elem_ast_ty, st, all_decls)?;
            Ok(Type::mk_array(*len, elem_ty))
        }
        ast::Type::Int => Ok(Type::mk_int()),
        ast::Type::Bool => Ok(Type::mk_bool()),
        ast::Type::BV(width) => Ok(Type::mk_bitvec(*width as u32)),
        ast::Type::Lambda(args, ret) => {
            let ret_ty = ast_type_to_type(ret, st, all_decls)?;
            let arg_ty = args
                .iter()
                .map(|ty| ast_type_to_type(ty, st, all_decls))
                .collect::<Result<Vec<_>, Error>>()?;
            Ok(Type::mk_lambda(ret_ty, arg_ty, false))
        }
        ast::Type::Pointer => Ok(Type::mk_pointer()),
        ast::Type::Generic(gid) => st.resolve_generic_type(gid),
    }
}

/// Instantiate a call of a generic function with the given generic type arguments,
/// returning the (mangled) name of the instantiated function.
fn ast_instantiate(
    func_name: StringRef,
    generics: Vec<Rc<Type>>,
    st: &mut SymbolTable,
) -> Result<StringRef, Error> {
    let func_def = st
        .gtable
        .functions
        .get(&func_name) // ..awkward ownership
        .cloned()
        .ok_or_else(|| Error::Generic(format!("unknown generic function {func_name}")))?;
    let gmap = HashMap::from_iter(
        func_def
            .glist
            .as_ref()
            .unwrap()
            .iter()
            .cloned()
            .zip(generics.into_iter()),
    );
    st.gtable.types.push(gmap);

    let mangled = __ast_instantiate(func_def.as_ref(), st);

    st.gtable.types.pop();
    mangled
}

fn __ast_instantiate(func_def: &ast::FuncDef, st: &mut SymbolTable) -> Result<StringRef, Error> {
    // With the `gmap` installed, resolve the function's signature,
    // see if it is instantiated already
    let ret_ty = if let Some(ast_ty) = func_def.ret_ty.as_ref() {
        ast_type_to_type(ast_ty, st, None)?
    } else {
        Type::mk_unit()
    };
    let arg_ty = func_def
        .args
        .iter()
        .map(|(_, ty)| ast_type_to_type(ty, st, None))
        .collect::<Result<Vec<_>, Error>>()?;
    let func_ty = Type::mk_lambda(ret_ty, arg_ty, false);
    let key = (func_def.fid.clone(), HashPtrType::from(func_ty.clone()));
    let mangled = if let Some(mangled) = st.gtable.instantiations.get(&key) {
        return Ok(mangled.clone());
    } else {
        let mangled = StringRef::from(format!("{}${}", func_def.fid, func_ty));
        st.gtable.instantiations.insert(key, mangled.clone());
        let func_var = Exp::ident(func_ty, mangled.clone());
        st.bind(mangled.clone(), func_var, true)?;
        mangled
    };

    // Instantiate the generic function
    let function = ast_function_def(&func_def, mangled.clone(), st)?;
    assert!(st
        .functions
        .insert(mangled.clone(), Rc::new(function))
        .is_none());

    Ok(mangled)
}

/// Parses a frontend function definition and builds a `Function`.
fn ast_function_def(
    func_def: &ast::FuncDef,
    func_name: StringRef,
    st: &mut SymbolTable,
) -> Result<Function, Error> {
    st.push_scope(func_name.clone());

    debug!("[AST_FUNCTION_DEF] Visiting function {func_name}");

    // function return type
    let ret_ty = match &func_def.ret_ty {
        Some(ty) => ast_type_to_type(&ty, st, None)?,
        None => Type::mk_unit(),
    };

    // function arguments
    let args = func_def
        .args
        .iter()
        .map(|(arg, ty)| {
            let arg_ty = ast_type_to_type(&ty, st, None).or_else(|e| {
                st.pop_scope();
                Err(e)
            })?;
            // Bind function arguments
            let arg_desc = st.local(func_name.as_ref(), arg.as_ref());
            let arg_var = Exp::var(arg_desc.clone(), arg_ty.clone());
            st.bind(arg.clone(), arg_var, false).or_else(|e| {
                st.pop_scope();
                Err(e)
            })?;

            Ok((arg_desc, arg_ty))
        })
        .collect::<Result<Vec<_>, Error>>()?;

    // function body (as an `Exp`)
    let mut cfg = Cfg::new();
    let entry = cfg.noop_node();
    let mut current = entry;
    cfg.set_entry(entry);
    let exp = ast_expr_to_exp(
        &mut cfg,
        &mut current,
        &func_def.body,
        st,
        Some(ret_ty.clone()),
    )
    .or_else(|e| {
        st.pop_scope();
        Err(e)
    })?;
    st.pop_scope();

    let vdesc = st.local(func_name.as_ref(), ValueDesc::RET_VAL);
    let let_node = cfg.let_node(
        Exp::var(vdesc.clone(), exp.ty()), 
        exp,
    ).unwrap();
    let ret_node = cfg.return_node(false);

    cfg.connect(current, let_node).unwrap();
    cfg.connect(let_node, ret_node).unwrap();
    debug!("[AST_FUNCTION_DEF] Exiting function {func_name}");
    Ok(Function::new(func_name,
        ret_ty,
        args,
        cfg,
        st.vstate,
    ))
}

/// Parses a frontend `Expr` as a middeend `Exp`.
fn ast_expr_to_exp(
    cfg: &mut Cfg,
    node: &mut CfgNodeId,
    expr: &ast::Expr,
    st: &mut SymbolTable,
    type_hint: Option<Rc<Type>>,
) -> Result<Rc<Exp>, Error> {
    debug!(
        "[AST_EXPR_TO_EXP] Visiting expr {:?}, with hint {:?}",
        expr,
        type_hint.as_ref().map(|hint| format!("{hint}"))
    );

    let exp = match expr {
        ast::Expr::True => match type_hint {
            Some(hint) if !type_is_bool!(hint) => Err(Error::TypeMismatch(
                format!("{:?}", expr),
                hint.to_string(),
                "Bool".to_string(),
            )),
            _ => Ok(Exp::true_exp()),
        },
        ast::Expr::False => match type_hint {
            Some(hint) if !type_is_bool!(hint) => Err(Error::TypeMismatch(
                format!("{:?}", expr),
                hint.to_string(),
                "Bool".to_string(),
            )),
            _ => Ok(Exp::false_exp()),
        },
        ast::Expr::Havoc => match type_hint {
            Some(hint) => Ok(Exp::havoc(hint)),
            _ => Err(Error::TypeInferFailure),
        },
        ast::Expr::Null => match type_hint {
            Some(hint) => {
                if type_is_kind!(hint, Type::Pointer) {
                    Ok(Exp::null())
                } else {
                    Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "Ptr".to_string(),
                    ))
                }
            }
            _ => Ok(Exp::null()),
        },
        ast::Expr::None => match type_hint {
            Some(hint) => {
                if type_is_kind!(hint, Type::Unit) {
                    Ok(Exp::none())
                } else {
                    Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "Void".to_string(),
                    ))
                }
            }
            _ => Ok(Exp::none()),
        },
        ast::Expr::IdentLiteral(ident) => match type_hint {
            Some(hint) => Ok(Exp::ident(hint, ident.clone())),
            None => Err(Error::Generic(format!("ident must be type hinted"))),
        },
        ast::Expr::List(elems) => {
            // Get the hint for element
            let elem_hint = match type_hint {
                Some(hint) => {
                    if !type_is_kind!(hint, Type::List) {
                        return Err(Error::TypeMismatch(
                            format!("{:?}", expr),
                            hint.to_string(),
                            "List<_>".to_string(),
                        ));
                    }
                    Some(type_as_kind!(hint, Type::List).elem_ty.clone())
                }
                None => None,
            };

            let first = match (&elem_hint, elems.first()) {
                // Hinted empty list
                (Some(elem_ty), None) => {
                    let ty = Type::mk_list(elem_ty.clone());
                    return Ok(Exp::vector(ty, vec![]).unwrap());
                }
                // Non-hinted empty list
                (None, None) => return Err(Error::TypeInferFailure),
                // Hinted first
                (Some(elem_ty), Some(first)) => {
                    ast_expr_to_exp(cfg, node, first, st, Some(elem_ty.clone()))?
                }
                // Non-hinted first
                (None, Some(first)) => ast_expr_to_exp(cfg, node, first, st, None)?,
            };
            if elem_hint.is_some() {
                let hint = elem_hint.unwrap();
                assert!(type_eq!(first.ty(), hint));
            }

            // Hint the rest of elements using the type of the first one
            let rest = elems[1..]
                .iter()
                .map(|elem| ast_expr_to_exp(cfg, node, elem, st, Some(first.ty())))
                .collect::<Result<Vec<_>, Error>>()?;
            let mut elems = vec![first.clone()];
            elems.extend(rest.into_iter());

            let ty = Type::mk_list(first.ty());
            Ok(Exp::vector(ty, elems).unwrap())
        }
        ast::Expr::Ext(op, value, new_ty) => {
            let new_ty = ast_type_to_type(new_ty, st, None)?;
            if let Some(hint) = type_hint {
                if !type_eq!(hint, new_ty) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        new_ty.to_string(),
                    ));
                }
            }
            let value = ast_expr_to_exp(cfg, node, value, st, None)?;
            Ok(Exp::ext(op.into(), new_ty, value.clone()).unwrap())
        }
        ast::Expr::Arith(op, lhs, rhs) => {
            let (lhs, rhs) = match (
                &type_hint,
                ast_expr_to_exp(cfg, node, lhs, st, type_hint.clone()),
            ) {
                // We can try `rhs` first
                (None, Err(Error::TypeInferFailure)) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, None)?;
                    let lhs = ast_expr_to_exp(cfg, node, lhs, st, Some(rhs.ty()))?;
                    (lhs, rhs)
                }
                (_, Ok(lhs)) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, Some(lhs.ty()))?;
                    (lhs, rhs)
                }
                (_, Err(e)) => return Err(e),
            };

            if !type_is_kind!(lhs.ty(), Type::Int) && !type_is_kind!(lhs.ty(), Type::BitVec) {
                Err(Error::TypeMismatch(
                    lhs.to_string(),
                    "Int<_> or Int".to_string(),
                    lhs.ty().to_string(),
                ))
            } else {
                Ok(Exp::arith(op.into(), lhs, rhs).unwrap())
            }
        }
        ast::Expr::Bool(op, lhs, rhs) => {
            let scope = st.scope().unwrap();
            let bool_ty = Type::mk_bool();
            if let Some(hint) = &type_hint {
                if !type_eq!(*hint, Type::mk_bool()) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "Bool".to_string(),
                    ));
                }
            }
            let res = format!("Bool::{}", st.nonce());
            let res_exp = Exp::var(st.local(scope.as_ref(), res.as_str()), bool_ty.clone());

            let lhs = ast_expr_to_exp(cfg, node, lhs, st, Some(bool_ty.clone()))?;
            let mut true_node = cfg.assume_node(lhs.clone()).unwrap();
            let mut false_node = cfg.assume_node(Exp::not(lhs).unwrap()).unwrap();
            cfg.connect(*node, true_node).unwrap();
            cfg.connect(*node, false_node).unwrap();

            let (true_let_node, false_let_node) = match op {
                ast::BoolOp::And => {
                    let rhs =
                        ast_expr_to_exp(cfg, &mut true_node, rhs, st, Some(bool_ty.clone()))?;
                    let false_exp = Exp::false_exp();
                    let true_let_node = cfg.let_node(res_exp.clone(), rhs).unwrap();
                    let false_let_node = cfg.let_node(res_exp.clone(), false_exp).unwrap();
                    cfg.connect(true_node, true_let_node).unwrap();
                    cfg.connect(false_node, false_let_node).unwrap();
                    (true_let_node, false_let_node)
                }
                ast::BoolOp::Or => {
                    let true_exp = Exp::true_exp();
                    let rhs =
                        ast_expr_to_exp(cfg, &mut false_node, rhs, st, Some(bool_ty.clone()))?;

                    let true_let_node = cfg.let_node(res_exp.clone(), true_exp).unwrap();
                    let false_let_node = cfg.let_node(res_exp.clone(), rhs).unwrap();
                    cfg.connect(true_node, true_let_node).unwrap();
                    cfg.connect(false_node, false_let_node).unwrap(); 
                    (true_let_node, false_let_node)
                }
            };
            let end_node = cfg.noop_node();
            cfg.connect(true_let_node, end_node).unwrap();
            cfg.connect(false_let_node, end_node).unwrap();

            *node = end_node;
            Ok(res_exp)
        }
        ast::Expr::Cast(casted_expr, ast_ty) => {
            let ty = ast_type_to_type(ast_ty, st, None)?;
            let value = ast_expr_to_exp(cfg, node, casted_expr, st, None)?;
            if let Some(hint) = type_hint {
                if !type_eq!(hint, ty) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        ty.to_string(),
                    ));
                }
            }
            Ok(Exp::bitcast(ty, value).unwrap())
        }
        ast::Expr::Compare(op, lhs, rhs) => {
            if let Some(hint) = type_hint {
                if !type_is_bool!(hint) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "Bool".to_string(),
                    ));
                }
            }

            // It is impossible to hint a compare operand
            let (lhs, rhs) = match ast_expr_to_exp(cfg, node, lhs, st, None) {
                // We can try `rhs` first
                Err(Error::TypeInferFailure) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, None)?;
                    let lhs = ast_expr_to_exp(cfg, node, lhs, st, Some(rhs.ty()))?;
                    (lhs, rhs)
                }
                Ok(lhs) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, Some(lhs.ty()))?;
                    (lhs, rhs)
                }
                Err(e) => return Err(e),
            };

            Exp::compare(op.into(), lhs.clone(), rhs)
                .map_err(|err| Error::Generic(format!("{:?}", err)))
        }
        ast::Expr::Concat(lhs, rhs) => {
            if let Some(hint) = type_hint.as_ref() {
                if !type_is_kind!(*hint, Type::List) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "List<_>".to_string(),
                    ));
                }
            }

            let (lhs, rhs) = match (
                &type_hint,
                ast_expr_to_exp(cfg, node, lhs, st, type_hint.clone()),
            ) {
                // We can try `rhs` first
                (None, Err(Error::TypeInferFailure)) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, None)?;
                    let lhs = ast_expr_to_exp(cfg, node, lhs, st, Some(rhs.ty()))?;
                    (lhs, rhs)
                }
                (_, Ok(lhs)) => {
                    let rhs = ast_expr_to_exp(cfg, node, rhs, st, Some(lhs.ty()))?;
                    (lhs, rhs)
                }
                (_, Err(e)) => return Err(e),
            };
            Ok(Exp::concat(lhs, rhs).unwrap())
        }
        ast::Expr::Unary(op, value) => match op {
            ast::UnaryOp::Neg => {
                let value = ast_expr_to_exp(cfg, node, value, st, type_hint)?;
                let width = match &*value.ty() {
                    Type::Int(_) => None,
                    Type::BitVec(kind) => Some(kind.width),
                    _ => {
                        return Err(Error::TypeMismatch(
                            value.to_string(),
                            "Int<_> or Int".to_string(),
                            value.to_string(),
                        ));
                    }
                };
                let zero = Exp::int_literal(0, width).unwrap();
                Ok(Exp::arith(op::ArithOp::Sub, zero, value).unwrap())
            }
            ast::UnaryOp::Not => {
                if let Some(hint) = type_hint {
                    if !type_is_bool!(hint) {
                        return Err(Error::TypeMismatch(
                            format!("{:?}", expr),
                            hint.to_string(),
                            "Bool".to_string(),
                        ));
                    }
                }
                let hint = Type::mk_bool();
                let value = ast_expr_to_exp(cfg, node, value, st, Some(hint))?;
                Ok(Exp::not(value).unwrap())
            }
        },
        ast::Expr::Var(id) => {
            let exp = st.get(id, type_hint)?;
            Ok(exp)
        }
        ast::Expr::BVLiteral(bv) => {
            let bv = Exp::int_literal(bv.value, Some(bv.width as u32)).unwrap();
            Ok(bv)
        }
        ast::Expr::IntLiteral(int) => {
            let int = Exp::int_literal(*int, None).unwrap();
            Ok(int)
        }
        ast::Expr::EnumLiteral(tid, disc) => {
            let ty = Type::resolve(tid).map_err(|_| Error::IdentUndef(tid.as_ref().into()))?;
            if !type_is_kind!(ty, Type::Enum) {
                return Err(Error::TypeMismatch(
                    format!("{:?}", expr),
                    "Enum".to_string(),
                    ty.to_string(),
                ));
            }
            let discs = &type_as_kind!(ty, Type::Enum).discriminants;
            let index = discs
                .iter()
                .position(|d| d == disc)
                .ok_or(Error::InvalidEnumVariant(
                    tid.as_ref().into(),
                    disc.as_ref().into(),
                ))?;

            let enum_literal = Exp::enum_literal(ty, index).unwrap();
            Ok(enum_literal)
        }
        ast::Expr::Ite(cond, true_exp, false_exp) => {
            let scope = st.scope().unwrap();
            let hint = Type::mk_bool();
            let cond = ast_expr_to_exp(cfg, node, cond, st, Some(hint))?;

            let mut true_anode = cfg.assume_node(cond.clone()).unwrap();
            let mut false_anode = cfg.assume_node(Exp::not(cond.clone()).unwrap()).unwrap();
            let new_node = cfg.noop_node();

            cfg.connect(*node, true_anode).unwrap();
            cfg.connect(*node, false_anode).unwrap();
            let (true_exp, false_exp) = match (
                &type_hint,
                ast_expr_to_exp(cfg, &mut true_anode, true_exp, st, type_hint.clone()),
            ) {
                // We can try `false_exp` first
                (None, Err(Error::TypeInferFailure)) => {
                    let false_exp = ast_expr_to_exp(cfg, &mut false_anode, false_exp, st, None)?;
                    let true_exp = ast_expr_to_exp(
                        cfg,
                        &mut true_anode,
                        true_exp,
                        st,
                        Some(false_exp.ty()),
                    )?;
                    (true_exp, false_exp)
                }
                (_, Ok(true_exp)) => {
                    let false_exp = ast_expr_to_exp(
                        cfg,
                        &mut false_anode,
                        false_exp,
                        st,
                        Some(true_exp.ty()),
                    )?;
                    (true_exp, false_exp)
                }
                (_, Err(e)) => return Err(e),
            };

            let res = format!("Ite::{}", st.nonce());
            let res_exp = Exp::var(st.local(scope.as_ref(), res.as_str()), true_exp.ty());
            let true_node = cfg.let_node(res_exp.clone(), true_exp.clone()).unwrap();
            let false_node = cfg.let_node(res_exp.clone(), false_exp.clone()).unwrap();

            cfg.connect(true_anode, true_node).unwrap();
            cfg.connect(false_anode, false_node).unwrap();
            cfg.connect(true_node, new_node).unwrap();
            cfg.connect(false_node, new_node).unwrap();
            *node = new_node;

            Ok(res_exp)
        }
        ast::Expr::Call(fid, generics, args) => {
            let scope = st.scope().unwrap();
            let func_name = if let Some(generics) = generics {
                // Generic function call
                let generics = generics
                    .iter()
                    .map(|ast_ty| ast_type_to_type(ast_ty, st, None))
                    .collect::<Result<Vec<_>, _>>()?;
                ast_instantiate(fid.clone(), generics, st)?
            } else {
                fid.clone()
            };

            let (ret_ty, arg_ty, funct) = match st.get(&func_name, None) {
                Ok(funct) => {
                    let func_ty = funct.ty();
                    if !type_is_kind!(func_ty, Type::Lambda) {
                        return Err(Error::TypeMismatch(
                            funct.to_string(),
                            "Function".to_string(),
                            func_ty.to_string(),
                        ));
                    }
                    let arg_ty = type_as_kind!(func_ty, Type::Lambda)
                        .arg_ty
                        .iter()
                        .map(|ty| Some(ty.clone()))
                        .collect::<Vec<_>>();
                    let ret_ty = type_as_kind!(func_ty, Type::Lambda).ret_ty.clone();
                    (ret_ty, arg_ty, funct)
                }
                Err(Error::IdentUndef(id)) => {
                    // last resort: try builtins here
                    match func_name.as_ref() {
                        "store" => {
                            let ret_ty = Type::mk_unit();
                            let arg_ty = vec![Some(Type::mk_pointer()), None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.store".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "debug" => {
                            let ret_ty = Type::mk_unit();
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.debug".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "panic" => {
                            let ret_ty = Type::mk_bool();
                            let arg_ty = vec![Some(Type::mk_pointer())];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.panic".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "len" => {
                            let ret_ty = Type::mk_int();
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.len".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "specialize" => {
                            let ret_ty = Type::mk_bool();
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.specialize".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "values" => {
                            let ret_ty = type_hint.clone().unwrap_or_else(|| {
                                panic!("`values` must be called with a type hint")
                            });
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.values".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "ordered" => {
                            let ret_ty = type_hint.clone().ok_or_else(|| {
                                Error::Generic(format!("`ordered` must be called with a type hint"))
                            })?;
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.ordered".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "alloc" => {
                            let ret_ty = Type::mk_pointer();
                            let arg_ty = vec![None];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.alloc".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "free" => {
                            let ret_ty = Type::mk_unit();
                            let arg_ty = vec![Some(Type::mk_pointer())];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.free".into());
                            (ret_ty, arg_ty, funct)
                        }
                        "throw" => {
                            let ret_ty = Type::mk_unit();
                            let arg_ty = vec![None, Some(Type::mk_pointer())];
                            let unit_ty = Type::mk_unit();
                            let funct = Exp::ident(unit_ty, "@spice.throw".into());
                            (ret_ty, arg_ty, funct)
                        }
                        _ => return Err(Error::IdentUndef(id)),
                    }
                }
                Err(e) => return Err(e),
            };

            if arg_ty.len() != args.len() {
                return Err(Error::FuncArgMismatch(arg_ty.len(), args.len()));
            }
            let args = args
                .iter()
                .zip(arg_ty.into_iter())
                .map(|(arg, hint)| ast_expr_to_exp(cfg, node, arg, st, hint))
                .collect::<Result<Vec<_>, Error>>()?;

            if let Some(hint) = type_hint {
                if !type_eq!(hint, ret_ty) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        ret_ty.to_string(),
                    ));
                }
            }

            let nonce = st.nonce();
            let res_exp = Exp::var(
                st.local(scope.as_ref(), format!("Call::{}", nonce).as_str()),
                ret_ty,
            );

            let ex_flg = Exp::var(
                st.local(scope.as_ref(), ValueDesc::EX_FLG),
                Type::mk_bool(),
            );

            let func_call_node = cfg.func_call_node(
                res_exp.clone(),
                funct,
                args,
            )
            .unwrap();

            let ok_node = cfg.assume_node(Exp::not(ex_flg.clone()).unwrap()).unwrap();
            let ex_node = cfg.assume_node(ex_flg).unwrap();

            let throw_node = cfg.return_node(true);

            cfg.connect(*node, func_call_node).unwrap();
            cfg.connect(func_call_node, ok_node).unwrap();
            cfg.connect(func_call_node, ex_node).unwrap();
            cfg.connect(ex_node, throw_node).unwrap();
            *node = ok_node;

            Ok(res_exp)
        }
        ast::Expr::Range(list, start, end) => {
            // Hint must be List
            if let Some(hint) = &type_hint {
                if !type_is_kind!(*hint, Type::List) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        "List<_>".to_string(),
                    ));
                }
            }

            let list = ast_expr_to_exp(cfg, node, list, st, type_hint)?;
            let start = if let Some(start) = start.as_ref() {
                Some(ast_expr_to_exp(
                    cfg,
                    node,
                    start,
                    st,
                    Some(Type::mk_int()),
                )?)
            } else {
                None
            };
            let end = if let Some(end) = end.as_ref() {
                Some(ast_expr_to_exp(cfg, node, end, st, Some(Type::mk_int()))?)
            } else {
                None
            };
            Ok(Exp::range(list, start, end).unwrap())
        }
        ast::Expr::Index(base, index) => {
            let base = ast_expr_to_exp(cfg, node, base, st, None)?;
            let index = ast_expr_to_exp(cfg, node, index, st, None)?;
            if !type_is_kind!(index.ty(), Type::Int) && !type_is_kind!(index.ty(), Type::BitVec) {
                return Err(Error::TypeMismatch(
                    format!("{:?}", index),
                    "Int<_> or Int".to_string(),
                    index.ty().to_string(),
                ));
            }

            match base.ty().as_ref() {
                Type::List(_) => false,
                _ => {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", base),
                        "List<_>".to_string(),
                        base.ty().to_string(),
                    ));
                }
            };
            let exp = Exp::index(base, index).unwrap();
            if let Some(hint) = type_hint {
                if !type_eq!(hint, exp.ty()) {
                    return Err(Error::TypeMismatch(
                        exp.to_string(),
                        hint.to_string(),
                        exp.ty().to_string(),
                    ));
                }
            }
            Ok(exp)
        }
        ast::Expr::Field(base, field) => {
            let base = ast_expr_to_exp(cfg, node, base, st, None)?;

            match base.ty().as_ref() {
                Type::Tuple(_) => {}
                _ => {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", base),
                        "{ .. }".to_string(),
                        base.ty().to_string(),
                    ));
                }
            };

            let index = st.resolve_struct_field(base.ty(), field.clone())?;
            let indices = vec![Exp::int_literal(index as i64, None).unwrap()];
            let exp = Exp::extract_value(base, indices).unwrap();
            if let Some(hint) = type_hint {
                if !type_eq!(hint, exp.ty()) {
                    return Err(Error::TypeMismatch(
                        exp.to_string(),
                        hint.to_string(),
                        exp.ty().to_string(),
                    ));
                }
            }
            Ok(exp)
        }
        ast::Expr::Let(id, id_type_hint, id_expr, expr) => {
            // First analyze `id_expr` using hint
            let id_type_hint = if let Some(hint) = id_type_hint {
                Some(ast_type_to_type(hint, st, None)?)
            } else {
                None
            };
            let id_exp = ast_expr_to_exp(cfg, node, id_expr, st, id_type_hint)?;

            // A let binding makes a new scope
            let scope = st.scope().unwrap();
            st.push_scope(scope);

            // Now analyze body with the binding
            st.bind(id.clone(), id_exp.clone(), false).or_else(|e| {
                st.pop_scope();
                Err(e)
            })?;

            let exp = ast_expr_to_exp(cfg, node, expr, st, type_hint).or_else(|e| {
                st.pop_scope();
                Err(e)
            })?;

            st.pop_scope();
            Ok(exp)
        }
        ast::Expr::Struct(name, fields) => {
            let tuple_ty =
                Type::resolve(name).map_err(|_| Error::IdentUndef(name.as_ref().into()))?;
            if !type_is_kind!(tuple_ty, Type::Tuple) {
                return Err(Error::TypeMismatch(
                    format!("{:?}", expr),
                    "Struct { .. }".to_string(),
                    tuple_ty.to_string(),
                ));
            }
            let fields_ty = &type_as_kind!(tuple_ty, Type::Tuple).fields;
            let mut fields = fields
                .iter()
                .map(|(field, expr)| {
                    let idx = st.resolve_struct_field(tuple_ty.clone(), field.clone())?;
                    let fty = fields_ty.get(idx).unwrap().clone();
                    let fexp = ast_expr_to_exp(cfg, node, expr, st, Some(fty.clone()))?;
                    Ok((idx, fexp))
                })
                .collect::<Result<Vec<_>, _>>()?;

            fields.sort_by_key(|obj| obj.0);
            fields.dedup_by_key(|obj| obj.0);
            let fields: Vec<_> = fields.into_iter().map(|obj| obj.1).collect();
            if fields.len() != fields_ty.len() {
                return Err(Error::MissingStructField(name.as_ref().into()));
            }
            Ok(Exp::tuple(fields, false))
        }
        ast::Expr::Lambda(ast_args, expr) => {
            // Get the hints for this expression, as well as the arguments
            let ty =
                type_hint.ok_or_else(|| Error::Generic(format!("lambda must be type hinted")))?;
            if !type_is_kind!(ty, Type::Lambda) {
                return Err(Error::TypeMismatch(
                    format!("{:?}", expr),
                    ty.to_string(),
                    "Lambda".to_string(),
                ));
            }
            let ret_hint = type_as_kind!(ty, Type::Lambda).ret_ty.clone();
            let func_name = StringRef::from(format!("Lambda${}", st.nonce()));

            // XXX: since we only support fully type hinted `Lambda`s for now, the additional
            // type annotation on arguments is ignored...

            let args = ast_args
                .iter()
                .zip(type_as_kind!(ty, Type::Lambda).arg_ty.iter())
                .map(|((arg, _), ty)| {
                    let arg_desc = st.local(func_name.as_ref(), arg.as_ref());
                    (arg_desc, ty.clone())
                })
                .collect::<Vec<_>>();

            // Now we are ready to analyze the body
            st.push_scope(func_name.clone());
            for ((arg_desc, arg_hint), (arg, _)) in args.iter().zip(ast_args.iter()) {
                // Arguments are bound as `Exp::Var`
                st.bind(
                    arg.clone(),
                    Exp::var(arg_desc.clone(), arg_hint.clone()),
                    false,
                )
                .or_else(|e| {
                    st.pop_scope();
                    Err(e)
                })?;
            }

            let mut sub_cfg = Cfg::new();
            let mut try_node = sub_cfg.noop_node();
            sub_cfg.set_entry(try_node);

            let compute =
                ast_expr_to_exp(&mut sub_cfg, &mut try_node, expr, st, Some(ret_hint))
                    .or_else(|e| {
                        st.pop_scope();
                        Err(e)
                    })?;
            
            let exp = st.local(func_name.as_ref(), ValueDesc::RET_VAL);
            let let_node = sub_cfg.let_node(
                Exp::var(exp.clone(), compute.ty()), 
                compute.clone()
            ).unwrap();
            let ret_node = sub_cfg.return_node(false);
            sub_cfg.connect(try_node, let_node).unwrap();
            sub_cfg.connect(let_node, ret_node).unwrap();

            // ..body done
            st.pop_scope();

            let func = Function::new(
                func_name.clone(),
                compute.ty(),
                args,
                sub_cfg,
                st.vstate,
            );
            st.functions
                .insert(func_name.clone(), Rc::new(func));
            Ok(Exp::ident(ty, func_name))
        }
        ast::Expr::PtrDeref(expr, btype) => {
            let scope = st.scope().unwrap();
            let btype = ast_type_to_type(btype, st, None)?;
            if let Some(hint) = type_hint {
                if !type_eq!(btype, hint) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        btype.to_string(),
                    ));
                }
            }

            let rexp = {
                let hint = Type::mk_pointer();
                let exp = ast_expr_to_exp(cfg, node, expr, st, Some(hint))?;
                Exp::load(btype, exp).unwrap()
            };

            let lid = format!("Deref::{}", st.nonce());
            let lexp = Exp::var(st.local(scope.as_ref(), lid.as_str()), rexp.ty());
            let let_node = cfg.let_node(lexp.clone(), rexp).unwrap();
            cfg.connect(*node, let_node).unwrap();
            *node = let_node;
            Ok(lexp)
        }
        ast::Expr::PtrField(expr, btype, field) => {
            if let Some(hint) = type_hint {
                if !type_is_kind!(hint, Type::Pointer) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        Type::mk_pointer().to_string(),
                    ));
                }
            }
            let btype = ast_type_to_type(btype, st, None)?;
            let idx = st.resolve_struct_field(btype.clone(), field.clone())?;

            let hint = Type::mk_pointer();
            let ptr = ast_expr_to_exp(cfg, node, expr, st, Some(hint))?;
            let index = Exp::int_literal(idx as i64, None).unwrap();
            Ok(Exp::get_elem_ptr(btype, ptr, index, false).unwrap())
        }
        ast::Expr::PtrIndex(expr, btype, index) => {
            if let Some(hint) = type_hint {
                if !type_is_kind!(hint, Type::Pointer) {
                    return Err(Error::TypeMismatch(
                        format!("{:?}", expr),
                        hint.to_string(),
                        Type::mk_pointer().to_string(),
                    ));
                }
            }
            let btype = ast_type_to_type(btype, st, None)?;
            let index = ast_expr_to_exp(cfg, node, index, st, None)?;

            let hint = Type::mk_pointer();
            let ptr = ast_expr_to_exp(cfg, node, expr, st, Some(hint))?;
            Ok(Exp::get_ptr(btype, ptr, index, false).unwrap())
        }
    }?;

    Ok(exp)
}

/// Merge the AST from the SpIce file into the building `see`.
pub fn ast_merge_spec(me: &mut SeeBuilder<crate::middleend::se::Parsed>, spec_file: &str) {
    let prog = spice_frontend::ast::parse(spec_file);
    ast_fe_to_me(prog, me).unwrap_or_else(|err| panic!("{err}"));
}

#[cfg(test)]
pub mod tests {
    use super::*;
    use spice_frontend::ast::parse;

    #[test]
    pub fn spice_glue_lib() -> See {
        let prog = parse("test/spec/lib.spec");
        // Use an empty Ast for testing
        let ast = Ast {
            functions: HashMap::new(),
            global_inits: Vec::new(),
            eta: HashMap::new(),
        };
        let mut me = SeeBuilder::new().parse(ast);
        match ast_fe_to_me(prog, &mut me) {
            Ok(_) => me.ok(),
            Err(e) => {
                eprintln!("{e}");
                panic!();
            }
        }
    }

    #[test]
    pub fn spice_glue_refmodel() -> See {
        let prog = parse("test/spec/refmodel.spec");
        // Use an empty Ast for testing
        let ast = Ast {
            functions: HashMap::new(),
            global_inits: Vec::new(),
            eta: HashMap::new(),
        };
        let mut me = SeeBuilder::new().parse(ast);
        match ast_fe_to_me(prog, &mut me) {
            Ok(_) => me.ok(),
            Err(e) => {
                eprintln!("{e}");
                panic!();
            }
        }
    }

    #[test]
    pub fn spice_glue_new_refmodel() -> See {
        let prog = parse("test/spec/refmodel-new.spec");
        // Use an empty Ast for testing
        let ast = Ast {
            functions: HashMap::new(),
            global_inits: Vec::new(),
            eta: HashMap::new(),
        };
        let mut me = SeeBuilder::new().parse(ast);
        match ast_fe_to_me(prog, &mut me) {
            Ok(_) => me.ok(),
            Err(e) => {
                eprintln!("{e}");
                panic!();
            }
        }
    }
}
