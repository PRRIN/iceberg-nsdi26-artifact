//! This module declares expressions in the middleend.
//!
//! `Value`s from the LLVM frontend (and other frontends
//! alike) map into `Exp`s, which the symbolic execution
//! engine operates on. Later, `Exp`s map into Z3 variables
//! in the backend for the solver to solve.

use crate::middleend::*;
use crate::panic::*;
use crate::util::StringRef;
use itertools::Itertools;
use std::fmt;
use std::ops::Shl;
use std::rc::Rc;

pub mod exp_data;
pub mod op;
pub mod ordering;
pub use exp_data::exp_as_data;
pub use exp_data::exp_is_kind;
pub use ordering::*;

/// `Exp` encodes expressions.
///
/// `Exp` is always associated with a `Type`, which is accessible
/// with the `ty()` method. Regarding the `Type` members of the
/// following variants, stick to this naming convention: `ty` refers
/// to the type of the current variant; `xxx_ty` refers to the type of
/// other `Exp`s concerning the current variant.
///
/// For example, `alloca_ty` in `Alloca` would be `i64` in an `alloca i64`,
/// whose `ty()` returns `ptr`. `ty` in `Load`, on the other hand, would
/// be `i64` in a `load i64, ptr, %ptr`, even as `ty()` of `%ptr` returns
/// `ptr`.
///
/// ## Note
/// `Exp` MUST be created with associated methods, which performs
/// proper validity checks.
pub enum Exp {
    Alloca(exp_data::AllocaData),
    Arith(exp_data::ArithData),
    BitCast(exp_data::BitCastData),
    Boolean(exp_data::BooleanData),
    Compare(exp_data::CompareData),
    Concat(exp_data::ConcatData),
    EnumLiteral(exp_data::EnumLiteralData),
    Ext(exp_data::ExtData),
    ExtractValue(exp_data::ExtractValueData),
    /// `Ident` represents an "identifier".
    ///
    /// It is used to handle special values that cannot be easily integrated
    /// into the normal execution process, such as representing function entities
    /// at call sites, or abstract data structures that are only manipulated with
    /// builtins.
    ///
    /// Note that an `Exp::Ident` can have an arbitrary `Type`, and its type don't
    /// stand for anything.
    Ident(exp_data::IdentData),
    /// `GetPtr`s implement half of the functionality of LLVM `getelementptr`
    /// instructions, that is calculating offset of the n-th object.
    ///
    /// For example, `GetPtr({i32, i32}*, %ptr, 1)` will point to 8 (8 bytes in
    /// `{i32, i32}`) times 1 (index is 1) bytes after `%ptr`, that is `%ptr + 8`.
    ///
    /// `GetPtr` does not care what the base type of `ty` is. To get the offset
    /// of a sub-field, use `GetElemPtr`.
    GetPtr(exp_data::GetPtrData),
    /// `GetElemPtr`s implement the other half of the functionality of LLVM
    /// `getelementptr` instructions, that is calculating offset of the n-th
    /// element/field.
    ///
    /// For example, `GetElemPtr({i32, i32}*, %ptr, 1)` will point to the second
    /// (index 1) field of the aggregate `{i32, i32}` at `%ptr`, that is `%ptr + 4`,
    /// and the resulting type is `i32*`. Note that `GetElemPtr` requires `ptr_ty`
    /// to be a `Type::Pointer` of `Type::Array`/`Type::List`/`Type::Tuple`/`Type::Struct`.
    ///
    /// `GetElemPtr` never goes beyond the boundary of one object. To get the offset
    /// of further objects, use `GetPtr`.
    ///
    /// `GetElemPtr` and `GetPtr` together emulates LLVM `getelementptr`
    /// behavior, while avoiding the many confusing cases with the latter.
    /// Indeed, `GetPtr` and `GetElemPtr` do not support a indice array, so
    /// one `getelementptr` may map into multiple `GetPtr`/`GetElemPtr`s, but
    /// this overhead is modest.
    GetElemPtr(exp_data::GetElemPtrData),
    /// `Havoc` encodes expressions that can take arbitrary *undefined* values,
    /// It corresponds to values produced via UBs, loading from uninitialized
    /// memory, etc.
    ///
    /// As the name implies, `Havoc`s are propagated if they take part in further
    /// computation, producing more `Havoc`s. Certain operations, like `Exp::load`,
    /// will panic on a `Havoc` load position.
    Havoc(exp_data::HavocData),
    /// `Index` encodes sub-script expressions over a sequence,
    /// which is found in SPEC.
    Index(exp_data::IndexData),
    InsertValue(exp_data::InsertValueData),
    /// `IntLiteral`s encode both `Int` (unbounded) and `BitVec` (with width) types.
    IntLiteral(exp_data::IntLiteralData),
    Load(exp_data::LoadData),
    /// `None` encodes a `Type::Unit` value.
    None(exp_data::NoneData),
    /// `Not` encodes logical not.
    Not(exp_data::NotData),
    /// `Null` encodes null pointers.
    Null(exp_data::NullData),
    /// `PointerLiteral` encodes named memory positions.
    /// Refer to comments about the memory model design for more insights.
    PointerLiteral(exp_data::PointerLiteralData),
    /// `Range` encodes sub-list expressions over a sequence,
    /// which is found in SPEC.
    Range(exp_data::RangeData),
    Store(exp_data::StoreData),
    /// `Struct` encodes both `Type::Tuple` and `Type::Struct`.
    /// The former can be seen as the latter with implicit field names
    /// (`_0` for the first, `_1` for the second, etc.).
    Tuple(exp_data::TupleData),
    /// `Symbolic` encodes expressions that can take arbitrary values.
    /// Unlike `Havoc`s, values of `Symbolic`s are reliable. Backend solvers
    /// may constrain their ranges deterministically.
    ///
    /// A `Symbolic` represents a state: either the value of a certain memory position
    /// (managed by `MemoryState`), or the value of a specifically named variable (for
    /// passing function arguments, managed by `ValueState`). This relationship is
    /// captured with a `SymbolicDesc`.
    Symbolic(exp_data::SymbolicData),
    /// `SymbolicPtr` encodes the special middle ground between a fully `Symbolic` pointer
    /// (knowing only its type) and a fully specified `PointerLiteral` (knowing its underlying
    /// memory descriptor).
    /// To be exact: a symbolic pointer represents a set of possible pointer values, where the
    /// pointee region is symbolic, but the node ID within said region is concrete (see `memory_state`
    /// for explanations of "region"s and node IDs), making it "half-symbolic" in a sense.
    ///
    /// Consequently, a `SymbolicPtr` has properties of both worlds: it has an associated
    /// `SymbolicDesc`, and it can be load/store/getptr/getelemptr-ed directly. Comparing
    /// `SymbolicPointer`s to `PointerLiteral`s or `Null`s, however, will require further
    /// specialization of the `SymbolicPtr`s.
    SymbolicPtr(exp_data::SymbolicPtrData),
    /// `Var`s are named references of values. For example, in this
    /// line of LLVM IR:
    /// ```llvm
    /// %1 = load i64, ptr, %ptr
    /// ```
    /// `%1` and `%ptr` are both named values, i.e., `Var`s.
    ///
    /// `Var`s can also be used in an "environment variable" style.
    /// The SE engine may want to store the previous basic block
    /// ID in a `Var` named `PREV_BLOCK`; the automated summary
    /// may also use `Var`s to encode input-effect pairs.
    Var(exp_data::VarData),
    /// `Vector`s are sequences of `Exp`s, which can be either
    /// `Type::Array` (fixed length) or `Type::List` (variable length).
    Vector(exp_data::VectorData),
}

/// Helper macro to de-alias an `i1` IntLiteral to bool values.
macro_rules! exp_as_bool {
    ($exp: expr) => {
        match &*$exp {
            Exp::IntLiteral(data) if data.width == Some(1) => {
                if data.value == -1 {
                    Some(true)
                } else {
                    Some(false)
                }
            }
            _ => None,
        }
    };
}

/// Helper macro to determine if an `Exp` is an atom (i.e., `exec()` will never
/// change its value).
macro_rules! exp_is_atom {
    ($exp: expr) => {
        match &*$exp {
            Exp::Ident(_)
            | Exp::EnumLiteral(_)
            | Exp::Havoc(_)
            | Exp::IntLiteral(_)
            | Exp::None(_)
            | Exp::Null(_)
            | Exp::PointerLiteral(_) => true,
            _ => false,
        }
    };
}

pub(crate) use exp_as_bool;
pub(crate) use exp_is_atom;

impl fmt::Debug for Exp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl fmt::Display for Exp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl Exp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            Exp::Alloca(data) => write!(f, "alloc({})", data.alloca_ty),
            Exp::Arith(data) => write!(f, "({} {} {})", data.lhs, data.op, data.rhs),
            Exp::BitCast(data) => write!(f, "(bitcast {} to {})", data.value, data.new_ty),
            Exp::Boolean(data) => write!(f, "({} {} {})", data.lhs, data.op, data.rhs),
            Exp::Compare(data) => write!(f, "({} {} {})", data.lhs, data.op, data.rhs),
            Exp::Concat(data) => write!(f, "({} ++ {})", data.lhs, data.rhs),
            Exp::EnumLiteral(data) => {
                let discriminant = type_as_kind!(data.ty, Type::Enum)
                    .discriminants
                    .get(data.discriminant)
                    .unwrap();
                write!(f, "{}::{}", data.ty, discriminant)
            }
            Exp::Ext(data) => write!(f, "({} {} {})", data.value, data.op, data.new_ty),
            Exp::ExtractValue(data) => {
                let indices = data.indices.iter().map(ToString::to_string).join(" ");
                write!(f, "(extract {} {})", data.agg, indices)
            }
            Exp::Ident(data) => write!(f, "ident({})", data.ident),
            Exp::GetElemPtr(data) => {
                write!(
                    f,
                    "(getelemptr{} {} {})",
                    if data.inbounds { " inbounds" } else { "" },
                    data.ptr,
                    data.index,
                )
            }
            Exp::GetPtr(data) => {
                write!(
                    f,
                    "(getptr{} {} {})",
                    if data.inbounds { " inbounds" } else { "" },
                    data.ptr,
                    data.index,
                )
            }
            Exp::Havoc(_) => write!(f, "havoc"),
            Exp::Index(data) => write!(f, "{}[{}]", data.vector, data.index),
            Exp::InsertValue(data) => {
                let indices = data.indices.iter().map(ToString::to_string).join(" ");
                write!(f, "(insert {} into {} {})", data.value, data.agg, indices,)
            }
            Exp::IntLiteral(data) => match data.width {
                None => write!(f, "{}", data.value),
                Some(w) if w > 1 => write!(f, "{}w{w}", data.value),
                Some(_) => {
                    if data.value == 0 {
                        write!(f, "false")
                    } else {
                        write!(f, "true")
                    }
                }
            },
            Exp::Load(data) => write!(f, "load({})", data.ptr),
            Exp::None(_) => write!(f, "none"),
            Exp::Not(data) => write!(f, "!{}", data.value),
            Exp::Null(_) => write!(f, "null"),
            Exp::PointerLiteral(data) => write!(f, "&{}", data.desc),
            Exp::Range(data) => match (data.start.as_ref(), data.end.as_ref()) {
                (Some(start), Some(end)) => write!(f, "{}[{}..{}]", data.vector, start, end),
                (None, Some(end)) => write!(f, "{}[..{}]", data.vector, end),
                (Some(start), None) => write!(f, "{}[{}..]", data.vector, start),
                (None, None) => write!(f, "{}[..]", data.vector),
            },
            Exp::Store(data) => write!(f, "store({} -> {})", data.value, data.ptr),
            Exp::Tuple(data) => {
                let fields = data.fields.iter().map(ToString::to_string).join(", ");
                write!(f, "{{ {fields} }}")
            }
            Exp::Symbolic(data) => write!(f, "<{}>", data.desc),
            Exp::SymbolicPtr(data) => {
                write!(f, "&{}~{}::{}", data.region, data.layout.size, data.offset)
            }
            Exp::Var(data) => write!(f, "{}", data.desc),
            Exp::Vector(data) => {
                let elems = data.elems.iter().map(ToString::to_string).join(", ");
                write!(f, "[ {elems} ]")
            }
        }
    }
}

impl Typed for Exp {
    fn ty(&self) -> Rc<Type> {
        match self {
            Exp::Alloca(_) => Type::mk_pointer(),
            Exp::Arith(data) => data.lhs.ty(),
            Exp::BitCast(data) => data.new_ty.clone(),
            Exp::Boolean(_) => Type::mk_bool(),
            Exp::Compare(_) => Type::mk_bool(),
            Exp::Concat(data) => data.lhs.ty(),
            Exp::EnumLiteral(data) => data.ty.clone(),
            Exp::Ext(data) => data.new_ty.clone(),
            Exp::ExtractValue(data) => data.ty.clone(),
            Exp::Ident(data) => data.ty.clone(),
            Exp::GetPtr(_) => Type::mk_pointer(),
            Exp::GetElemPtr(_) => Type::mk_pointer(),
            Exp::Havoc(data) => data.ty.clone(),
            Exp::Index(data) => data.ty.clone(),
            Exp::InsertValue(data) => data.agg.ty(),
            Exp::IntLiteral(data) => match data.width {
                None => Type::mk_int(),
                Some(width) => Type::mk_bitvec(width),
            },
            Exp::Load(data) => data.ty.clone(),
            Exp::None(_) => Type::mk_unit(),
            Exp::Not(_) => Type::mk_bool(),
            Exp::Null(_) => Type::mk_pointer(),
            Exp::PointerLiteral(_) => Type::mk_pointer(),
            Exp::Range(data) => data.vector.ty(),
            Exp::Store(_) => Type::mk_unit(),
            Exp::Tuple(data) => data.ty.clone(),
            Exp::Symbolic(data) => data.ty.clone(),
            Exp::SymbolicPtr(_) => Type::mk_pointer(),
            Exp::Var(data) => data.ty.clone(),
            Exp::Vector(data) => data.ty.clone(),
        }
    }
}

impl Exp {
    /// Create an `Exp::Alloca`.
    pub fn alloca(alloca_ty: Rc<Type>, func_name: StringRef, alloc_name: StringRef) -> Rc<Exp> {
        Rc::new(Exp::Alloca(exp_data::AllocaData {
            alloca_ty,
            func_name,
            alloc_name,
        }))
    }

    /// Create an `Exp::Arith`.
    /// ### Failures
    /// Construction may fail if
    /// * `lhs` and `rhs` have different `Type`s
    /// * `lhs` is not `Type::Int` or `Type::BitVec`
    /// * `op` is not supported on operand types
    pub fn arith(op: op::ArithOp, lhs: Rc<Exp>, rhs: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let lty = lhs.ty();
        let rty = rhs.ty();

        if !type_eq!(lty, rty) {
            throw_panic!("mismatch of type {lty} of lhs {lhs} and {rty} of {rhs}");
        }

        match (&*lty, op) {
            (
                Type::Int(_),
                op::ArithOp::Add
                | op::ArithOp::Mul
                | op::ArithOp::Sdiv
                | op::ArithOp::Srem
                | op::ArithOp::Sub,
            ) => {}
            (Type::BitVec(_), _) => {}
            _ => throw_panic!("operator {op} is not valid on {lhs} of type {lty}"),
        }

        Ok(Rc::new(Exp::Arith(exp_data::ArithData { op, lhs, rhs })))
    }

    /// Create an `Exp::Bitcast`.
    /// ### Failures
    /// Construction may fail if
    /// * `value` is not `Type::Pointer` or `Type::BitVec(64)`
    /// * `new_ty` is not `Type::Pointer`, `Type::BitVec(64)` or `Type::Lambda`
    pub fn bitcast(new_ty: Rc<Type>, value: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let vty = value.ty();
        let int_ty = Type::mk_bitvec(TYPE_POINTER_WIDTH);

        if !type_is_kind!(vty, Type::Pointer) && !type_eq!(vty, int_ty) {
            throw_panic!("old type {vty} is neither a pointer nor {int_ty}");
        }

        if !type_is_kind!(new_ty, Type::Pointer)
            && !type_is_kind!(new_ty, Type::Lambda)
            && !type_eq!(new_ty, int_ty)
        {
            throw_panic!("new type {new_ty} is not a pointer, {int_ty} or lambda, value={value}");
        }

        if type_eq!(vty, new_ty) {
            // Useless bitcasts are not even created
            return Ok(value);
        }

        if let Exp::BitCast(vdata) = value.as_ref() {
            // Chain of bitcasts are simplified at creation
            if type_eq!(vdata.value.ty(), new_ty) {
                Ok(vdata.value.clone())
            } else {
                Ok(Rc::new(Exp::BitCast(exp_data::BitCastData {
                    new_ty,
                    value: vdata.value.clone(),
                })))
            }
        } else {
            Ok(Rc::new(Exp::BitCast(exp_data::BitCastData {
                new_ty,
                value,
            })))
        }
    }

    /// Create an `Exp::Boolean`.
    /// ### Failures
    /// Construction may fail if
    /// * `lhs` and `rhs` are not both `Type::Bitvec` with a width of one
    pub fn boolean(op: op::BoolOp, lhs: Rc<Exp>, rhs: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let lty = lhs.ty();
        let rty = rhs.ty();

        if !type_is_bool!(lty) {
            throw_panic!("type {lty} of lhs {lhs} is not Bool");
        }

        if !type_eq!(lty, rty) {
            throw_panic!("mismatch of type {lty} of lhs {lhs} and {rty} of {rhs}");
        }

        Ok(Rc::new(Exp::Boolean(exp_data::BooleanData {
            op,
            lhs,
            rhs,
        })))
    }

    /// Create an `Exp::Compare`.
    /// ### Failures
    /// Construction may fail if
    /// * `lhs` and `rhs` have different `Type`s
    /// * `op` is not supported on operands (only `Eq` and `Neq` for `Type::Enum`
    /// and `Type::Pointer`; only signed comparsion for `Type::Int`).
    pub fn compare(op: op::CompareOp, lhs: Rc<Exp>, rhs: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let lty = lhs.ty();
        let rty = rhs.ty();

        if !type_eq!(lty, rty) {
            throw_panic!("mismatch of type {lty} of lhs {lhs} and {rty} of {rhs}");
        }

        match (op, &*lty) {
            (
                op::CompareOp::Eq | op::CompareOp::Neq,
                Type::BitVec(_) | Type::Int(_) | Type::Pointer(_) | Type::Enum(_),
            ) => {}
            (
                op::CompareOp::Ule | op::CompareOp::Uge | op::CompareOp::Ult | op::CompareOp::Ugt,
                Type::BitVec(_) | Type::Pointer(_),
            ) => {}
            (
                op::CompareOp::Sle | op::CompareOp::Sge | op::CompareOp::Slt | op::CompareOp::Sgt,
                Type::BitVec(_) | Type::Int(_),
            ) => {}
            _ => {
                throw_panic!("operator {op} is not valid on {lhs} of type {lty}");
            }
        }

        Ok(Rc::new(Exp::Compare(exp_data::CompareData {
            op,
            lhs,
            rhs,
        })))
    }

    /// Create an `Exp::Concat`.
    /// ### Failures
    /// Construction may fail if
    /// * `lhs` and `rhs` have different `Type`s
    /// * `lhs` (and `rhs`) is not of type `Type::List`
    pub fn concat(lhs: Rc<Exp>, rhs: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let lty = lhs.ty();
        let rty = rhs.ty();
        if !type_eq!(lty, rty) {
            throw_panic!("mismatch of type {lty} of lhs {lhs} and {rty} of {rhs}");
        }
        if !type_is_kind!(lty, Type::List) {
            throw_panic!("value {lhs} has type {lty}, which is not List");
        }

        Ok(Rc::new(Exp::Concat(exp_data::ConcatData { lhs, rhs })))
    }

    /// Create an `Exp::EnumLiteral`.
    /// ### Failures
    /// Construction may fail if
    /// * `ty` is not `Type::Enum`
    /// * `discriminant` is valid.
    pub fn enum_literal(ty: Rc<Type>, discriminant: usize) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(ty, Type::Enum) {
            throw_panic!("type {ty} is not Enum");
        }

        let kind = type_as_kind!(ty, Type::Enum);
        if discriminant >= kind.discriminants.len() {
            throw_panic!("discriminant {discriminant} is not valid for {ty}");
        }

        let id = kind.id + discriminant as i64;
        Ok(Rc::new(Exp::EnumLiteral(exp_data::EnumLiteralData {
            ty,
            discriminant,
            id,
        })))
    }

    /// Create an `Exp::Ext`.
    /// ### Failures
    /// Construction may fail if
    /// * `value`'s type and `new_ty` are not both `Type::BitVec`.
    /// * `op` disagrees with width of old and new bitvectors.
    pub fn ext(op: op::ExtOp, new_ty: Rc<Type>, value: Rc<Exp>) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(value.ty(), Type::BitVec) || !type_is_kind!(new_ty, Type::BitVec) {
            throw_panic!("{value} and {new_ty} are not both BitVec");
        }

        let old_width = type_as_kind!(value.ty(), Type::BitVec).width;
        let new_width = type_as_kind!(new_ty, Type::BitVec).width;

        match op {
            op::ExtOp::Sext | op::ExtOp::Zext => {
                if old_width > new_width {
                    throw_panic!(
                        "new width {new_width} is less than old width {old_width} when op is {op}"
                    );
                }
            }
            op::ExtOp::Trunc => {
                if old_width < new_width {
                    throw_panic!(
                        "new width {new_width} is more than old width {old_width} when op is {op}"
                    );
                }
            }
        }

        Ok(Rc::new(Exp::Ext(exp_data::ExtData { op, new_ty, value })))
    }

    /// Create an `Exp::ExtractValue`.
    /// ### Failures
    /// Construction may fail if
    /// * Unwrapping `agg` with `indices` fails.
    pub fn extract_value(agg: Rc<Exp>, indices: Vec<Rc<Exp>>) -> Panicable<Rc<Exp>> {
        let vty = agg.ty();
        // This takes care of proper type checking
        let ty = indices.iter().fold(Ok(vty), |agg_ty, index| {
            Type::sub_type(agg_ty?, index.clone())
        })?;

        Ok(Rc::new(Exp::ExtractValue(exp_data::ExtractValueData {
            ty,
            agg,
            indices,
        })))
    }

    /// Alias to `i1 0`.
    pub fn false_exp() -> Rc<Exp> {
        Exp::int_literal(0, Some(1)).unwrap()
    }

    /// Create an `Exp::Ident`.
    pub fn ident(ty: Rc<Type>, ident: StringRef) -> Rc<Exp> {
        Rc::new(Exp::Ident(exp_data::IdentData { ty, ident }))
    }

    /// Create an `Exp::GetPtr`.
    /// ### Failures
    /// Construction may fail if
    /// * `ptr` does not have `Type::Pointer`.
    /// * `index` is not `Type::Int` or `Type::BitVec`.
    pub fn get_ptr(
        btype: Rc<Type>,
        ptr: Rc<Exp>,
        index: Rc<Exp>,
        inbounds: bool,
    ) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(ptr.ty(), Type::Pointer) {
            throw_panic!("{ptr} is not a Pointer");
        }

        let index_ty = index.ty();
        if !type_is_kind!(index_ty, Type::BitVec) && !type_is_kind!(index_ty, Type::Int) {
            throw_panic!("type {index_ty} of index {index} is neither BitVec or Int");
        }

        Ok(Rc::new(Exp::GetPtr(exp_data::GetPtrData {
            btype,
            ptr,
            index,
            inbounds,
        })))
    }

    /// Create an `Exp::GetElemPtr`.
    /// ### Failures
    /// Construction may fail if
    /// * `ptr` does not have `Type::Pointer`.
    /// * `index` is not `Type::Int` or `Type::BitVec`.
    /// * `btype` is not an aggregate type.
    pub fn get_elem_ptr(
        btype: Rc<Type>,
        ptr: Rc<Exp>,
        index: Rc<Exp>,
        inbounds: bool,
    ) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(ptr.ty(), Type::Pointer) {
            throw_panic!("{ptr} is not a Pointer");
        }
        if !type_is_kind!(btype, Type::Array) && !type_is_kind!(btype, Type::Tuple) {
            throw_panic!("base type {btype} must be Array or Tuple");
        }

        let index_ty = index.ty();
        if !type_is_kind!(index_ty, Type::BitVec) && !type_is_kind!(index_ty, Type::Int) {
            throw_panic!("type {index_ty} of index {index} is neither BitVec or Int");
        }

        Ok(Rc::new(Exp::GetElemPtr(exp_data::GetElemPtrData {
            btype,
            ptr,
            index,
            inbounds,
        })))
    }

    /// Create an `Exp::Havoc`.
    pub fn havoc(ty: Rc<Type>) -> Rc<Exp> {
        Rc::new(Exp::Havoc(exp_data::HavocData { ty }))
    }

    /// Create an `Exp::Index`.
    /// ### Failures
    /// Construction may fail if
    /// * `vector` is not `Type::List`;
    /// * `index` is not `Type::Int`;
    pub fn index(vector: Rc<Exp>, index: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let vector_ty = vector.ty();
        if !type_is_kind!(vector_ty, Type::List) {
            throw_panic!("value {vector} has type {vector_ty}, which is not List");
        }

        let ty = Type::sub_type(vector_ty, index.clone())?;
        Ok(Rc::new(Exp::Index(exp_data::IndexData {
            ty,
            vector,
            index,
        })))
    }

    /// Create an `Exp::InsertValue`.
    /// ### Failures
    /// Construction may fail if
    /// * Unwrapping `agg` with `indices` fails.
    /// * Type of `value` mismatches the inserting position.
    pub fn insert_value(agg: Rc<Exp>, value: Rc<Exp>, indices: Vec<Rc<Exp>>) -> Panicable<Rc<Exp>> {
        let agg_ty = agg.ty();
        let vty = value.ty();
        let ty = indices.iter().fold(Ok(agg_ty.clone()), |agg_ty, index| {
            Type::sub_type(agg_ty?, index.clone())
        })?;
        if !type_eq!(vty, ty) {
            throw_panic!("inserted value {value} has type {vty}, not {ty}");
        }

        Ok(Rc::new(Exp::InsertValue(exp_data::InsertValueData {
            agg,
            value,
            indices,
        })))
    }

    /// Create an `Exp::IntLiteral`.
    /// ### Failures
    /// Construction may fail if
    /// * Width is 0.
    /// * Width is greater than 64.
    /// * `value` is out of bounds for `width`, as unsigned value.
    pub fn int_literal(value: i64, width: Option<u32>) -> Panicable<Rc<Exp>> {
        if let Some(width) = width {
            if width == 0 {
                throw_panic!("width must not be zero");
            }
            if width > 64 {
                throw_panic!("width must be no greater than 128");
            }
            if {
                let max = (1u64.shl(width as u32 - 1) - 1) as i64;
                let min = ((1u64.shl(width as u32 - 1)) as i64).wrapping_neg();
                value < min || value > max
            } {
                throw_panic!("value {value} is out of bound for width {width}");
            }

            Ok(Rc::new(Exp::IntLiteral(exp_data::IntLiteralData {
                value,
                width: Some(width),
            })))
        } else {
            Ok(Rc::new(Exp::IntLiteral(exp_data::IntLiteralData {
                value,
                width: None,
            })))
        }
    }

    /// Create an `Exp::Load`.
    /// ### Failures
    /// Construction may fail if
    /// * `ptr` is not `Type::Pointer`.
    pub fn load(ty: Rc<Type>, ptr: Rc<Exp>) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(ptr.ty(), Type::Pointer) {
            throw_panic!("{ptr} is not a pointer");
        }
        Ok(Rc::new(Exp::Load(exp_data::LoadData { ty, ptr })))
    }

    /// Create an `Exp::None`.
    pub fn none() -> Rc<Exp> {
        Rc::new(Exp::None(exp_data::NoneData {}))
    }

    /// Create an `Exp::Not`.
    /// ### Failures
    /// Construction may fail if
    /// * `value` is not a boolean type.
    pub fn not(value: Rc<Exp>) -> Panicable<Rc<Exp>> {
        let vty = value.ty();
        if !type_is_bool!(vty) {
            throw_panic!("{value} is of type {vty}, not Bool");
        }

        Ok(Rc::new(Exp::Not(exp_data::NotData { value })))
    }

    /// Create an `Exp::Null`.
    pub fn null() -> Rc<Exp> {
        Rc::new(Exp::Null(exp_data::NullData {}))
    }

    /// Create an `Exp::PointerLiteral`.
    pub fn pointer_literal(desc: MemoryDesc) -> Rc<Exp> {
        Rc::new(Exp::PointerLiteral(exp_data::PointerLiteralData { desc }))
    }

    /// Create an `Exp::Range`.
    /// ### Failures
    /// Construction may fail if
    /// * `vector` is not `Type::List`;
    /// * `start` and `end` are not `Type::Int`;
    pub fn range(
        vector: Rc<Exp>,
        start: Option<Rc<Exp>>,
        end: Option<Rc<Exp>>,
    ) -> Panicable<Rc<Exp>> {
        let vector_ty = vector.ty();
        if !type_is_kind!(vector_ty, Type::List) {
            throw_panic!("value {vector} has type {vector_ty}, which is not List");
        }

        let ty1 = start.as_ref().map(|exp| exp.ty());
        let ty2 = end.as_ref().map(|exp| exp.ty());
        if let (Some(ty1), Some(ty2)) = (ty1.as_ref(), ty2.as_ref()) {
            if !type_eq!(*ty1, *ty2) {
                throw_panic!(
                    "type {ty1} of start {} and {ty2} of end {} are different",
                    start.unwrap(),
                    end.unwrap()
                );
            }
        }
        if let Some(ty1) = ty1.as_ref() {
            if !type_is_kind!(*ty1, Type::Int) {
                throw_panic!("type {ty1} of start {} is not Int", start.unwrap());
            }
        }
        if let Some(ty2) = ty2.as_ref() {
            if !type_is_kind!(*ty2, Type::Int) {
                throw_panic!("type {ty2} of end {} is not Int", end.unwrap());
            }
        }

        Ok(Rc::new(Exp::Range(exp_data::RangeData {
            vector,
            start,
            end,
        })))
    }

    /// Create an `Exp::Store``
    /// ### Failures
    /// Construction may fail if
    /// * `ptr` is not `Type::Pointer`.
    pub fn store(ptr: Rc<Exp>, value: Rc<Exp>) -> Panicable<Rc<Exp>> {
        if !type_is_kind!(ptr.ty(), Type::Pointer) {
            throw_panic!("{ptr} is not a Pointer");
        }
        Ok(Rc::new(Exp::Store(exp_data::StoreData { ptr, value })))
    }

    /// Create an `Exp::Tuple`.
    pub fn tuple(fields: Vec<Rc<Exp>>, packed: bool) -> Rc<Exp> {
        let field_types: Vec<Rc<Type>> = fields.iter().map(|f| f.ty()).collect();
        let ty = if packed {
            Type::mk_tuple_packed(field_types)
        } else {
            Type::mk_tuple(field_types)
        };
        Rc::new(Exp::Tuple(exp_data::TupleData { ty, fields }))
    }

    /// Create an `Exp::Symbolic`.
    pub fn symbolic(ty: Rc<Type>, desc: Rc<SymbolicDesc>) -> Rc<Exp> {
        Rc::new(Exp::Symbolic(exp_data::SymbolicData { ty, desc }))
    }

    /// Create an `Exp::SymbolicPtr`.
    pub fn symbolic_ptr(
        region: SymbolicRegionDesc,
        layout: Rc<MemoryLayout>,
        offset: u32,
    ) -> Rc<Exp> {
        Rc::new(Exp::SymbolicPtr(exp_data::SymbolicPtrData {
            region,
            layout,
            offset,
        }))
    }

    /// Alias to `i1 -1`.
    pub fn true_exp() -> Rc<Exp> {
        Exp::int_literal(-1, Some(1)).unwrap()
    }

    /// Create an `Exp::Var`.
    pub fn var(desc: ValueDesc, ty: Rc<Type>) -> Rc<Exp> {
        Rc::new(Exp::Var(exp_data::VarData { desc, ty }))
    }

    /// Create an `Exp::Vector`.
    /// ### Failures
    /// Construction may fail if
    /// * `ty` is neither Array nor List
    /// * `elems` does not match the element type of `ty`.
    pub fn vector(ty: Rc<Type>, elems: Vec<Rc<Exp>>) -> Panicable<Rc<Exp>> {
        let elem_ty = match &*ty {
            Type::Array(kind) => {
                if elems.len() != kind.len {
                    throw_panic!(
                        "type {ty} has length {}, but {} elements are provided",
                        kind.len,
                        elems.len()
                    );
                }
                kind.elem_ty.clone()
            }
            Type::List(kind) => kind.elem_ty.clone(),
            _ => {
                throw_panic!("type {ty} is neither Array not List");
            }
        };

        for elem in elems.iter() {
            let ety = elem.ty();
            if !type_eq!(ety, elem_ty) {
                throw_panic!("element {elem} has type {ety}, expected {elem_ty}");
            }
        }

        Ok(Rc::new(Exp::Vector(exp_data::VectorData {
            ty,
            elem_ty,
            elems,
        })))
    }

    /// Index into the given aggregate `agg` with given indices `indices`,
    /// returning the field value.
    pub fn index_into(agg: Rc<Exp>, indices: &[usize]) -> Panicable<Rc<Exp>> {
        // Spread an aggregate
        match (indices.is_empty(), agg.as_ref()) {
            (false, Exp::Vector(data)) => {
                Exp::index_into(data.elems.get(indices[0]).unwrap().clone(), &indices[1..])
            }
            (false, Exp::Tuple(data)) => {
                Exp::index_into(data.fields.get(indices[0]).unwrap().clone(), &indices[1..])
            }
            (false, Exp::Havoc(data)) => match data.ty.as_ref() {
                Type::Array(kind) => {
                    let havoc = Exp::havoc(kind.elem_ty.clone());
                    Exp::index_into(havoc, &indices[1..])
                }
                Type::Tuple(kind) => {
                    let havoc = Exp::havoc(kind.fields.get(indices[0]).unwrap().clone());
                    Exp::index_into(havoc, &indices[1..])
                }
                _ => throw_panic!("cannot unwrap havoc with type {}", data.ty),
            },
            (false, _) => throw_panic!("cannot unwrap {agg}"),
            (true, _) => Ok(agg),
        }
    }

    /// Create an `Exp` of type `ty`, that is zero-valued.
    ///
    /// In the case that the zero value of a `Type` is undefined, `None` is returned.
    pub fn zero_val(ty: Rc<Type>) -> Panicable<Rc<Exp>> {
        Ok(match ty.as_ref() {
            Type::Array(kind) => {
                let elems = (0..kind.len)
                    .map(|_| Exp::zero_val(kind.elem_ty.clone()))
                    .collect::<Panicable<Vec<_>>>()?;
                Exp::vector(ty.clone(), elems).unwrap()
            }
            Type::Tuple(kind) => {
                let fields = kind
                    .fields
                    .iter()
                    .map(|ty| Exp::zero_val(ty.clone()))
                    .collect::<Panicable<Vec<_>>>()?;
                Exp::tuple(fields, kind.packed)
            }

            Type::List(_) => Exp::vector(ty.clone(), vec![]).unwrap(),
            Type::BitVec(kind) => Exp::int_literal(0, Some(kind.width)).unwrap(),
            Type::Int(_) => Exp::int_literal(0, None).unwrap(),
            Type::Pointer(_) => Exp::null(),
            Type::Unit(_) => Exp::none(),

            Type::Enum(_) | Type::Lambda(_) => {
                throw_panic!("zero value of {ty} is undefined")
            }
        })
    }

    /// Create an `Exp` of type `ty`, with `exps` as fields.
    ///
    /// The `exps` is expected to be completely flattened; namely, it should not
    /// contain array/tuple-typed values.
    /// It is also impossible to collect a `Type::List`, as the length is ambiguous.
    ///
    /// Scalar `Exp`s will be bitcasted, if their types mismatch with the expected
    /// types.
    pub fn collect(ty: Rc<Type>, exps: &mut impl Iterator<Item = Rc<Exp>>) -> Panicable<Rc<Exp>> {
        let exp = Exp::__collect(ty, exps)?;
        if exps.next().is_some() {
            throw_panic!("extra fields");
        }
        Ok(exp)
    }

    fn __collect(ty: Rc<Type>, exps: &mut impl Iterator<Item = Rc<Exp>>) -> Panicable<Rc<Exp>> {
        match ty.as_ref() {
            Type::Array(kind) => {
                let mut elems = Vec::with_capacity(kind.len);
                for _ in 0..kind.len {
                    elems.push(Exp::__collect(kind.elem_ty.clone(), exps)?);
                }
                Exp::vector(ty.clone(), elems)
            }
            Type::Tuple(kind) => {
                let mut fields = Vec::with_capacity(kind.fields.len());
                for fty in kind.fields.iter() {
                    fields.push(Exp::__collect(fty.clone(), exps)?);
                }
                Ok(Exp::tuple(fields, kind.packed))
            }
            Type::List(_) => throw_panic!("cannot collect type {ty}"),
            _ => {
                let Some(exp) = exps.next() else {
                    throw_panic!("not enough fields");
                };
                if !type_eq!(exp.ty(), ty) {
                    Exp::bitcast(ty, exp.clone())
                } else {
                    Ok(exp)
                }
            }
        }
    }

    /// Flatten `exp` into its fields.
    ///
    /// The returned fields are completely flattened, meaning that there will not
    /// be array/tuple types.
    /// It is also forbidden to flatten a `Type::List`.
    pub fn flatten(exp: Rc<Exp>) -> Panicable<Vec<Rc<Exp>>> {
        let mut stack = vec![exp];
        let mut flattened = Vec::new();
        while let Some(exp) = stack.pop() {
            let ty = exp.ty();
            match ty.as_ref() {
                Type::Array(kind) => match exp.as_ref() {
                    Exp::Vector(data) => {
                        for elem in data.elems.iter().rev() {
                            stack.push(elem.clone());
                        }
                    }
                    Exp::Havoc(_) => {
                        stack.extend(
                            std::iter::repeat(Exp::havoc(kind.elem_ty.clone())).take(kind.len),
                        );
                    }
                    _ => throw_panic!("cannot flatten {exp}"),
                },
                Type::Tuple(kind) => match exp.as_ref() {
                    Exp::Tuple(data) => {
                        for field in data.fields.iter().rev() {
                            stack.push(field.clone());
                        }
                    }
                    Exp::Havoc(_) => {
                        for fty in kind.fields.iter().rev() {
                            stack.push(Exp::havoc(fty.clone()));
                        }
                    }
                    _ => throw_panic!("cannot flatten {exp}"),
                },
                Type::List(_) => throw_panic!("cannot flatten type {ty}"),

                _ => flattened.push(exp),
            }
        }
        Ok(flattened)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Test that we can create basic `Exp`s (that do not refer to other
    /// `Exp`s).
    #[test]
    fn exp_create_basic() -> Panicable<()> {
        let ty = Type::mk_bitvec(32);
        let enum_ty = Type::mk_enum(
            "Color".into(),
            vec!["Red".into(), "Green".into(), "Blue".into()],
        );
        let pty = Type::mk_pointer();

        let alloc = Exp::alloca(ty.clone(), "Test".into(), "0".into());
        let enum_literal = Exp::enum_literal(enum_ty.clone(), 1)?;
        let false_exp = Exp::false_exp();
        let havoc = Exp::havoc(ty.clone());
        let int_literal = Exp::int_literal(0xdeadbeef_u32 as i32 as i64, Some(32))?;
        let none = Exp::none();
        let null = Exp::null();
        let true_exp = Exp::true_exp();

        assert!(type_eq!(alloc.ty(), pty));
        assert!(type_eq!(enum_literal.ty(), enum_ty));
        assert!(type_eq!(false_exp.ty(), Type::mk_bool()));
        assert!(type_eq!(havoc.ty(), ty));
        assert!(type_eq!(int_literal.ty(), ty));
        assert!(type_eq!(none.ty(), Type::mk_unit()));
        assert!(type_eq!(null.ty(), pty));
        assert!(type_eq!(true_exp.ty(), Type::mk_bool()));
        Ok(())
    }

    /// Test that we can create composite `Exp`s (that refer to other `Exp`s).
    /// Some speicial `Exp`s are tested separately.
    #[test]
    fn exp_create_composite() -> Panicable<()> {
        /* Components */
        let ty = Type::mk_bitvec(32);
        let ptr_ty = Type::mk_pointer();
        let bool_ty = Type::mk_bool();
        let array_ty = Type::mk_array(1, ty.clone());
        let agg_ty = Type::mk_tuple(vec![ty.clone()]);

        let int_exp = Exp::int_literal(0, Some(32))?;
        let bool_exp = Exp::false_exp();
        let ptr_exp = Exp::null();
        let size_ty = Type::mk_bitvec(TYPE_POINTER_WIDTH);

        /* Tests */
        let exp = Exp::arith(op::ArithOp::Add, int_exp.clone(), int_exp.clone())?;
        assert!(type_eq!(exp.ty(), ty));

        let exp = Exp::bitcast(size_ty.clone(), ptr_exp.clone())?;
        assert!(type_eq!(exp.ty(), size_ty));

        let exp = Exp::boolean(op::BoolOp::And, bool_exp.clone(), bool_exp.clone())?;
        assert!(type_eq!(exp.ty(), bool_ty));

        let exp = Exp::compare(op::CompareOp::Eq, int_exp.clone(), int_exp.clone())?;
        assert!(type_eq!(exp.ty(), bool_ty));

        let exp = Exp::ext(op::ExtOp::Sext, ty.clone(), int_exp.clone())?;
        assert!(type_eq!(exp.ty(), ty));

        let exp = Exp::get_ptr(bool_ty.clone(), ptr_exp.clone(), int_exp.clone(), false)?;
        assert!(type_eq!(exp.ty(), ptr_ty));

        let exp = Exp::get_elem_ptr(array_ty.clone(), ptr_exp.clone(), int_exp.clone(), false)?;
        assert!(type_eq!(exp.ty(), ptr_ty));

        let exp = Exp::load(ty.clone(), ptr_exp.clone())?;
        assert!(type_eq!(exp.ty(), ty));

        let exp = Exp::not(bool_exp.clone())?;
        assert!(type_eq!(exp.ty(), bool_ty));

        let exp = Exp::store(ptr_exp.clone(), int_exp.clone())?;
        assert!(type_eq!(exp.ty(), Type::mk_unit()));

        let exp = Exp::tuple(vec![int_exp.clone()], false);
        assert!(type_eq!(exp.ty(), agg_ty));

        let exp = Exp::vector(array_ty.clone(), vec![int_exp.clone()])?;
        assert!(type_eq!(exp.ty(), array_ty));
        Ok(())
    }

    /// Test that we can create `Exp::ExtractValue` and `Exp::InsertValue`.
    #[test]
    fn exp_create_insert_and_extract_value() -> Panicable<()> {
        /* Components */
        let ty = Type::mk_bitvec(32);
        let int_exp = Exp::int_literal(0, Some(32))?;
        let tuple = Exp::tuple(vec![int_exp.clone()], false);
        let tuple = Exp::tuple(vec![tuple.clone()], false); // {{ i32 }}
        let indices = vec![int_exp.clone(), int_exp.clone()];

        /* Tests */
        let insert_exp = Exp::insert_value(tuple.clone(), int_exp.clone(), indices.clone())?;
        let extract_exp = Exp::extract_value(insert_exp, indices.clone())?;
        assert!(type_eq!(extract_exp.ty(), ty));
        Ok(())
    }

    /// Test that we can create `Exp::Index` and `Exp::Range`.
    #[test]
    fn exp_create_index_and_range() -> Panicable<()> {
        /* Components */
        let ty = Type::mk_int();
        let list_ty = Type::mk_list(ty.clone());
        let int_exp = Exp::int_literal(0, None)?;
        let list_exp = Exp::vector(list_ty, vec![])?;

        /* Tests */
        let range_exp = Exp::range(list_exp, Some(int_exp.clone()), Some(int_exp.clone()))?;
        let index_exp = Exp::index(range_exp, int_exp.clone())?;
        assert!(type_eq!(index_exp.ty(), ty));
        Ok(())
    }
}
