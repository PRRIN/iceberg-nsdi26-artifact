//! Internal data for `Exp`s.

use crate::middleend::*;
use crate::util::StringRef;
use std::rc::Rc;

#[derive(Debug)]
pub struct AllocaData {
    pub alloca_ty: Rc<Type>,
    pub func_name: StringRef,
    pub alloc_name: StringRef,
}

#[derive(Debug)]
pub struct ArithData {
    pub lhs: Rc<Exp>,
    pub rhs: Rc<Exp>,
    pub op: op::ArithOp,
}

#[derive(Debug)]
pub struct BitCastData {
    pub new_ty: Rc<Type>,
    pub value: Rc<Exp>,
}

#[derive(Debug)]
pub struct BooleanData {
    pub lhs: Rc<Exp>,
    pub rhs: Rc<Exp>,
    pub op: op::BoolOp,
}

#[derive(Debug)]
pub struct CompareData {
    pub lhs: Rc<Exp>,
    pub rhs: Rc<Exp>,
    pub op: op::CompareOp,
}

#[derive(Debug)]
pub struct ConcatData {
    pub lhs: Rc<Exp>,
    pub rhs: Rc<Exp>,
}

#[derive(Debug)]
pub struct EnumLiteralData {
    pub ty: Rc<Type>,
    pub discriminant: usize,
    /// A globally unique ID; used in backend representation.
    pub id: i64,
}

#[derive(Debug)]
pub struct ExtData {
    pub new_ty: Rc<Type>,
    pub value: Rc<Exp>,
    pub op: op::ExtOp,
}

#[derive(Debug)]
pub struct ExtractValueData {
    pub ty: Rc<Type>,
    pub agg: Rc<Exp>,
    pub indices: Vec<Rc<Exp>>,
}

#[derive(Debug)]
pub struct IdentData {
    pub ty: Rc<Type>,
    pub ident: StringRef,
}

#[derive(Debug)]
pub struct GetPtrData {
    pub btype: Rc<Type>,
    pub ptr: Rc<Exp>,
    pub index: Rc<Exp>,
    pub inbounds: bool,
}

#[derive(Debug)]
pub struct GetElemPtrData {
    pub btype: Rc<Type>,
    pub ptr: Rc<Exp>,
    pub index: Rc<Exp>,
    pub inbounds: bool,
}

#[derive(Debug)]
pub struct HavocData {
    pub ty: Rc<Type>,
}

#[derive(Debug)]
pub struct IndexData {
    pub ty: Rc<Type>,
    pub vector: Rc<Exp>,
    pub index: Rc<Exp>,
}

#[derive(Debug)]
pub struct InsertValueData {
    pub agg: Rc<Exp>,
    pub value: Rc<Exp>,
    pub indices: Vec<Rc<Exp>>,
}

#[derive(Debug)]
pub struct IntLiteralData {
    pub value: i64,
    pub width: Option<u32>,
}

#[derive(Debug)]
pub struct LoadData {
    pub ty: Rc<Type>,
    pub ptr: Rc<Exp>,
}

#[derive(Debug)]
pub struct NoneData {}

#[derive(Debug)]
pub struct NotData {
    pub value: Rc<Exp>,
}

#[derive(Debug)]
pub struct NullData {}

#[derive(Debug)]
pub struct PointerLiteralData {
    pub desc: MemoryDesc,
}

#[derive(Debug)]
pub struct RangeData {
    pub vector: Rc<Exp>,
    pub start: Option<Rc<Exp>>,
    pub end: Option<Rc<Exp>>,
}

#[derive(Debug)]
pub struct StoreData {
    pub ptr: Rc<Exp>,
    pub value: Rc<Exp>,
}

#[derive(Debug)]
pub struct TupleData {
    pub ty: Rc<Type>,
    pub fields: Vec<Rc<Exp>>,
}

#[derive(Debug)]
pub struct SymbolicData {
    pub ty: Rc<Type>,
    pub desc: Rc<SymbolicDesc>,
}

#[derive(Debug)]
pub struct SymbolicPtrData {
    pub region: SymbolicRegionDesc,
    pub offset: u32,
    pub layout: Rc<MemoryLayout>,
}

#[derive(Debug)]
pub struct VarData {
    pub ty: Rc<Type>,
    pub desc: ValueDesc,
}

#[derive(Debug)]
pub struct VectorData {
    pub ty: Rc<Type>,
    pub elem_ty: Rc<Type>,
    pub elems: Vec<Rc<Exp>>,
}

/// Helper macro to determine if a type is the given kind.
#[macro_export]
macro_rules! exp_is_kind {
    ($exp: expr, $pat: path) => {
        match &*$exp {
            $pat(_) => true,
            _ => false,
        }
    };
}

/// Helper macro to determine if a type is the given kind.
#[macro_export]
macro_rules! exp_as_data {
    ($exp: expr, $pat: path) => {
        match &*$exp {
            $pat(data) => data,
            _ => panic!(
                "[exp_as_data] exp {} does not have kind {}",
                $exp,
                stringify!($pat),
            ),
        }
    };
}

pub use exp_as_data;
pub use exp_is_kind;
