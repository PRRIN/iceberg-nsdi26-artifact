//! This module declares the AST for the (supported) LLVM IR.
use crate::StringRef;

pub type Ident = StringRef;
pub type Int = i64;
pub type UInt = u64;

/// An LLVM IR program.
#[derive(Debug)]
pub struct Prog {
    pub decls: Vec<Decl>,
    pub layout: String,
}

/// A declaration.
#[derive(Debug)]
pub enum Decl {
    FuncDef(FuncDef),
    FuncDecl(FuncDecl),
    TypeDecl(TypeDecl),
    VarDecl(VarDecl),
}

/// A function definition.
#[derive(Debug)]
pub struct FuncDef {
    pub ty: Type,
    pub id: Ident,
    pub params: Vec<FuncParam>,
    pub body: Vec<Block>,
}

/// A function declaration.
#[derive(Debug)]
pub struct FuncDecl {
    pub ty: Type,
    pub id: Ident,
    pub params: Vec<Type>,
}

/// Function parameter attributes
#[derive(Debug)]
pub enum ParamAttr {
    Nest,
    NoCapture,
    NoAlias,
    ReadNone,
    ReadOnly,
    WriteOnly,
    ZeroExt,
    SignExt,
    NonNull,
    NoUndef,
    SRet(Option<Type>),
    Align(Int),
    Dereferenceable(Int),
    DereferenceableOrNull(Int),
    ByVal(Option<Type>),
    Returned,
    Immarg,
}

/// Math-related flags.
#[derive(Debug)]
pub enum MathFlag {
    Nsw,
    Nuw,
    Exact,
}

/// A function parameter.
#[derive(Debug)]
pub struct FuncParam {
    pub ty: Type,
    pub attrs: Vec<ParamAttr>,
    pub id: Option<Ident>,
}

/// A function argument.
/// This is the "value" when calling a function,
/// while `FuncParam` refers to the named parameters
/// in a function declaration.
#[derive(Debug)]
pub struct FuncArg {
    pub ty: Type,
    pub attrs: Vec<ParamAttr>,
    pub value: Value,
}

/// A type declaration.
#[derive(Debug)]
pub struct TypeDecl {
    pub id: Ident,
    pub ty: Type,
}

/// A LLVM type.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Type {
    Void,
    Int(usize),
    FuncPtr(Box<Type>, Vec<Type>),
    ExplicitPtr(Box<Type>),
    Ptr, // opaque pointer, since LLVM 15
    Array(Box<Type>, usize),
    Vector(Box<Type>, usize),
    Struct(Vec<Type>, bool),
    Named(Ident),
    Opaque, // Opaque struct; barely a place holder
    VaArgs,
}

/// A (global) variable declaration.
#[derive(Debug)]
pub struct VarDecl {
    pub id: Ident,
    pub decl_ty: VarDeclType,
    pub ty: Type,
    pub init: Option<Value>,
}

/// Declaration type for `VarDecl`.
#[derive(Debug)]
pub enum VarDeclType {
    Global,
    Constant,
}

pub const ENTRY_LABEL: &str = "entry";

/// A labeled basic block.
#[derive(Debug)]
pub struct Block {
    pub label: Ident,
    pub insts: Vec<Inst>,
}

/// An LLVM IR instruction.
#[derive(Debug)]
pub enum Inst {
    Ret(RetInst),
    Call(CallInst),
    Icmp(IcmpInst),
    Cast(CastInst),
    Binary(BinaryInst),
    AtomicBinary(AtomicBinaryInst),
    CmpXchg(CmpXchgInst),
    Gep(GepInst),
    Load(LoadInst),
    Store(StoreInst),
    Branch(BranchInst),
    Jump(JumpInst), // Unconditional branch
    Switch(SwitchInst),
    Phi(PhiInst),
    Unreachable,
    Alloca(AllocaInst),
    ExtractValue(ExtractValueInst),
    Select(SelectInst),
    InsertValue(InsertValueInst),
    Freeze(FreezeInst),
    Invoke(InvokeInst),
    LandingPad(LandingPadInst),
    Resume(ResumeInst),
    ShuffleVector(ShuffleVectorInst),
    Ignored,
}

/// A `ret` instruction.
#[derive(Debug)]
pub struct RetInst {
    pub ty: Type,
    pub retval: Option<Value>,
}

/// A `call` instruction.
#[derive(Debug)]
pub struct CallInst {
    pub assign: Option<Ident>,
    pub ty: Type,
    pub fid: Value,
    pub args: Vec<FuncArg>,
}

/// A type casting instruction.
/// This includes `zext`, `sext`, `trunc` and `bitcast`.
#[derive(Debug)]
pub struct CastInst {
    pub assign: Ident,
    pub op: CastInstOp,
    pub old_ty: Type,
    pub value: Value,
    pub new_ty: Type,
}

#[derive(Debug, Clone, Copy)]
pub enum CastInstOp {
    Zext,
    Sext,
    Trunc,
    Bitcast,
    PtrToInt,
    IntToPtr,
}

impl<'a> From<&'a str> for CastInstOp {
    fn from(value: &'a str) -> Self {
        match value {
            "zext" => CastInstOp::Zext,
            "sext" => CastInstOp::Sext,
            "trunc" => CastInstOp::Trunc,
            "bitcast" => CastInstOp::Bitcast,
            "ptrtoint" => CastInstOp::PtrToInt,
            "inttoptr" => CastInstOp::IntToPtr,
            _ => unreachable!(),
        }
    }
}

/// A comparison instruction.
/// This includes all variants of `icmp`.
#[derive(Debug)]
pub struct IcmpInst {
    pub assign: Ident,
    pub op: IcmpInstOp,
    pub ty: Type,
    pub lhs: Value,
    pub rhs: Value,
}

#[derive(Debug, Clone, Copy)]
pub enum IcmpInstOp {
    Eq,
    Ne,
    Ugt,
    Uge,
    Ult,
    Ule,
    Sgt,
    Sge,
    Slt,
    Sle,
}

impl<'a> From<&'a str> for IcmpInstOp {
    fn from(value: &'a str) -> Self {
        match value {
            "eq" => IcmpInstOp::Eq,
            "ne" => IcmpInstOp::Ne,
            "ugt" => IcmpInstOp::Ugt,
            "uge" => IcmpInstOp::Uge,
            "ult" => IcmpInstOp::Ult,
            "ule" => IcmpInstOp::Ule,
            "sgt" => IcmpInstOp::Sgt,
            "sge" => IcmpInstOp::Sge,
            "slt" => IcmpInstOp::Slt,
            "sle" => IcmpInstOp::Sle,
            _ => unreachable!(),
        }
    }
}

/// A binary instruction.
///
/// Note: `icmp` instructions have their own `IcmpInst`.
/// While `icmp` is principally a binary operation, the result
/// type is different from an arithmetic operation like `add`.
/// Thus, we handle them separately.
#[derive(Debug)]
pub struct BinaryInst {
    pub assign: Ident,
    pub op: BinaryInstOp,
    pub ty: Type,
    pub lhs: Value,
    pub rhs: Value,
    pub math_flags: Vec<MathFlag>,
}

#[derive(Debug, Clone, Copy)]
pub enum BinaryInstOp {
    Add,
    Sub,
    And,
    Or,
    Xor,
    Lshr,
    Ashr,
    Shl,
    Mul,
    Sdiv,
    Udiv,
    Srem,
    Urem,
}

impl<'a> From<&'a str> for BinaryInstOp {
    fn from(value: &'a str) -> Self {
        match value {
            "add" => BinaryInstOp::Add,
            "sub" => BinaryInstOp::Sub,
            "and" => BinaryInstOp::And,
            "or" => BinaryInstOp::Or,
            "xor" => BinaryInstOp::Xor,
            "lshr" => BinaryInstOp::Lshr,
            "ashr" => BinaryInstOp::Ashr,
            "shl" => BinaryInstOp::Shl,
            "mul" => BinaryInstOp::Mul,
            "sdiv" => BinaryInstOp::Sdiv,
            "udiv" => BinaryInstOp::Udiv,
            "srem" => BinaryInstOp::Srem,
            "urem" => BinaryInstOp::Urem,
            _ => unreachable!(),
        }
    }
}

#[derive(Debug, Clone, Copy)]
pub enum AtomicRmwOp {
    Xchg,
    Add,
    Sub,
    And,
    Nand,
    Or,
    Xor,
    Max,
    Min,
    Umax,
    Umin,
}

impl<'a> From<&'a str> for AtomicRmwOp {
    fn from(value: &'a str) -> Self {
        match value {
            "xchg" => AtomicRmwOp::Xchg,
            "add" => AtomicRmwOp::Add,
            "sub" => AtomicRmwOp::Sub,
            "and" => AtomicRmwOp::And,
            "nand" => AtomicRmwOp::Nand,
            "or" => AtomicRmwOp::Or,
            "xor" => AtomicRmwOp::Xor,
            "max" => AtomicRmwOp::Max,
            "min" => AtomicRmwOp::Min,
            "umax" => AtomicRmwOp::Umax,
            "umin" => AtomicRmwOp::Umin,
            _ => unreachable!(),
        }
    }
}

/// A `getelementptr` instruction.
#[derive(Debug)]
pub struct GepInst {
    pub assign: Ident,
    pub value: Gep,
}

/// A `load` instruction.
#[derive(Debug)]
pub struct LoadInst {
    pub assign: Ident,
    pub ty: Type,
    pub ptr_ty: Type,
    pub ptr: Value,
}

/// A `store` instruction.
#[derive(Debug)]
pub struct StoreInst {
    pub ty: Type,
    pub value: Value,
    pub ptr_ty: Type,
    pub ptr: Value,
}

/// A `br` instruction (conditional).
#[derive(Debug)]
pub struct BranchInst {
    pub cond: Value,
    pub if_label: Ident,
    pub else_label: Ident,
}

/// A `br` instruction (unconditional).
#[derive(Debug)]
pub struct JumpInst {
    pub target: Ident,
}

/// A `switch` instruction.
#[derive(Debug)]
pub struct SwitchInst {
    pub ty: Type,
    pub value: Value,
    pub def_label: Ident,
    pub branches: Vec<(Value, Ident)>,
}

/// A `phi` instruction.
#[derive(Debug)]
pub struct PhiInst {
    pub assign: Ident,
    pub ty: Type,
    pub values: Vec<(Value, Ident)>,
}

/// An `alloca` instruction.
#[derive(Debug)]
pub struct AllocaInst {
    pub assign: Ident,
    pub ty: Type,
}

/// An `extractvalue` instruction.
#[derive(Debug)]
pub struct ExtractValueInst {
    pub assign: Ident,
    pub ty: Type,
    pub agg: Value,
    pub indices: Vec<Value>,
}

/// A `free` instruction.
#[derive(Debug)]
pub struct FreezeInst {
    pub assign: Ident,
    pub ty: Type,
    pub value: Value,
}

/// An `insertvalue` instruction.
#[derive(Debug)]
pub struct InsertValueInst {
    pub assign: Ident,
    pub ty: Type,
    pub agg: Value,
    pub vty: Type,
    pub value: Value,
    pub indices: Vec<Value>,
}

/// A `select` instruction.
#[derive(Debug)]
pub struct SelectInst {
    pub assign: Ident,
    pub cond: Value,
    pub ty: Type,
    pub if_value: Value,
    pub else_value: Value,
}

/// An `invoke` instruction.
#[derive(Debug)]
pub struct InvokeInst {
    pub assign: Option<Ident>,
    pub ty: Type,
    pub fid: Value,
    pub args: Vec<FuncArg>,
    pub exception_labels: (Ident, Ident), // Exception: normal label, exception label
}

/// A `landingpad` instruction.
#[derive(Debug)]
pub struct LandingPadInst {
    pub assign: Ident,
    pub ty: Type,
    // TODO: other fields
}

/// A `resume` instruction.
#[derive(Debug)]
pub struct ResumeInst {
    pub ty: Type,
    pub value: Value,
}

/// An atomic binary instruction (`atomicrmw`).
#[derive(Debug)]
pub struct AtomicBinaryInst {
    pub assign: Ident,
    pub op: AtomicRmwOp,
    pub ptr_ty: Type,
    pub ptr: Value,
    pub ty: Type,
    pub value: Value,
}

/// A `cmpxchg` instruction.
#[derive(Debug)]
pub struct CmpXchgInst {
    pub assign: Ident,
    pub pointer: Value,
    pub ty: Type,
    pub cmp: Value,
    pub new: Value,
}

/// A `shufflevector` instruction.
#[derive(Debug)]
pub struct ShuffleVectorInst {
    pub assign: Ident,
    pub v1ty: Type,
    pub v1: Value,
    pub v2ty: Type,
    pub v2: Value,
    pub mty: Type,
    pub mask: Value,
}

/// An LLVM IR value.
#[derive(Debug, Clone)]
pub enum Value {
    Undef,
    Null,
    Poison,
    ZeroInit,
    LocalIdent(Ident),
    GlobalIdent(Ident),
    Int(Int),                  // `true` and `false` is expressed as 1 and 0
    Gep(Box<Gep>),             // `getelementptr` style pointer
    Bitcast(Box<Bitcast>),     // `bitcast`-ed value
    Binary(Box<Binary>),       // constantly evaluated binary operation
    Aggregate(Box<Aggregate>), // `aggregate` value; this includes Arrays, Vectors, and Structs
}

/// A `getelementptr` value.
#[derive(Debug, Clone)]
pub struct Gep {
    pub btype: Type,
    pub ptr_ty: Type,
    pub ptr: Value,
    pub indices: Vec<(Type, Value)>,
    pub inbounds: bool,
}

/// A `bitcast` value.
#[derive(Debug, Clone)]
pub struct Bitcast {
    pub old_ty: Type,
    pub value: Value,
    pub new_ty: Type,
}

/// A binary operation value.
#[derive(Debug, Clone)]
pub struct Binary {
    pub op: BinaryInstOp,
    pub ty: Type,
    pub lhs: Value,
    pub rhs: Value,
}

/// An `aggregate` value.
#[derive(Debug, Clone)]
pub struct Aggregate {
    pub is_array: bool,
    pub packed: bool,
    pub elems: Vec<(Type, Value)>,
}

#[cfg(test)]
impl std::process::Termination for Prog {
    fn report(self) -> std::process::ExitCode {
        std::process::ExitCode::from(0)
    }
}

use crate::get_test_file;
use lalrpop_util::lalrpop_mod;
use std::fs;

lalrpop_mod!(llvm, "/llvm.rs");

fn init_log() {
    let _ = env_logger::builder()
        .format_timestamp(None)
        .is_test(true)
        .try_init();
}

pub fn parse(path: &str) -> Prog {
    init_log();
    let path = get_test_file(path);
    let ir = fs::read_to_string(path).expect("[llvm-test] failed to read");
    let parser = llvm::ProgParser::new();

    parser.parse(&ir).expect("[llvm-test] failed to parse")
}

#[cfg(any(test, feature = "test"))]
pub mod tests {
    #[allow(unused)]
    use super::{parse, Prog};

    #[test]
    pub fn llvm_parse_simple() -> Prog {
        parse("../test/llvm/simple.ll")
    }

    #[test]
    pub fn llvm_parse_store() -> Prog {
        parse("../test/llvm/store.ll")
    }

    #[test]
    pub fn llvm_parse_panic() -> Prog {
        parse("../test/llvm/panic.ll")
    }

    #[test]
    pub fn llvm_parse_recurse() -> Prog {
        parse("../test/llvm/recurse.ll")
    }

    #[test]
    pub fn llvm_parse_funcp() -> Prog {
        parse("../test/llvm/funcp.ll")
    }

    #[test]
    pub fn llvm_parse_intrinsic() -> Prog {
        parse("../test/llvm/intrinsic.ll")
    }

    #[test]
    pub fn llvm_parse_loop() -> Prog {
        parse("../test/llvm/loop.ll")
    }

    pub fn llvm_parse_data() -> Prog {
        parse("../test/llvm/data.ll")
    }

    #[test]
    pub fn llvm_parse_real1() -> Prog {
        parse("../test/llvm/tree.O1.opt.oz.ll")
    }

    #[test]
    pub fn llvm_parse_real2() -> Prog {
        parse("../test/llvm/lookup.O1.opt.oz.ll")
    }

    #[test]
    pub fn llvm_parse_real3() -> Prog {
        parse("../test/llvm/dns.O1.opt.oz.ll")
    }

    #[test]
    pub fn llvm_parse_real4() -> Prog {
        parse("../test/llvm/query.ll")
    }

    #[test]
    pub fn llvm_parse_real5() -> Prog {
        parse("../test/llvm/rdata.ll")
    }

    #[test]
    pub fn llvm_parse_real6() -> Prog {
        parse("../test/llvm/packethandler.ll")
    }

    #[test]
    pub fn llvm_parse_real7() -> Prog {
        parse("../test/llvm/dnsname.ll")
    }
}
