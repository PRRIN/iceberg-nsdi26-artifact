//! This module declares ASTs for the SPEC language.
use crate::StringRef;

pub type Ident = StringRef;
pub type Int = i64;
pub type UInt = u64;

/// A bitvector with fixed width.
#[derive(Debug)]
pub struct BitVector {
    pub value: Int,
    pub width: usize,
}

/// A SPEC program.
#[derive(Debug)]
pub struct Prog {
    pub decls: Vec<Decl>,
}

/// A declaration
#[derive(Debug)]
pub enum Decl {
    TypeDecl(TypeDecl),
    FuncDef(FuncDef),
    ExternFuncDecl(ExternFuncDecl),
}

/// A type declaration, binding a type to a name.
#[derive(Debug)]
pub enum TypeDecl {
    EnumDecl(EnumDecl),
    StructDecl(StructDecl),
}

/// An enum type declaration.
#[derive(Debug)]
pub struct EnumDecl {
    pub tid: Ident,
    pub discriminants: Vec<Ident>,
}

/// A struct type declaration.
#[derive(Debug)]
pub struct StructDecl {
    pub linkage: Option<Ident>,
    pub tid: Ident,
    pub fields: Option<Vec<(Ident, Type)>>,
    pub packed: bool, 
}

/// A type annotation.
#[derive(Debug)]
pub enum Type {
    Unit,
    Named(Ident),
    List(Box<Type>),
    Int,
    Bool,
    BV(usize),
    Lambda(Vec<Box<Type>>, Box<Type>),
    Pointer,
    Array(Box<Type>, usize),
    Generic(StringRef),
}

/// A function definition.
#[derive(Debug)]
pub struct FuncDef {
    pub ret_ty: Option<Type>,
    pub fid: Ident,
    pub args: Vec<(Ident, Type)>,
    pub glist: Option<Vec<StringRef>>, // generic list
    pub body: Box<Expr>,
}

/// An extern function declaration.
#[derive(Debug)]
pub struct ExternFuncDecl {
    pub linkage: Ident,
    pub ret_ty: Option<Type>,
    pub fid: Ident,
    pub args: Vec<Type>,
}

/// Arithmetic operators.
#[derive(Debug)]
pub enum ArithOp {
    Add,
    Sub,
    And,
    Or,
    Xor,
    Shl,
    Lshr,
    Ashr,
}

/// Boolean operators.
#[derive(Debug)]
pub enum BoolOp {
    And,
    Or,
}

/// Comparison operators.
#[derive(Debug)]
pub enum CompareOp {
    Eq,
    Neq,
    Ult,
    Ugt,
    Ule,
    Uge,
    Slt,
    Sgt,
    Sle,
    Sge,
}

/// Extension operators.
#[derive(Debug)]
pub enum ExtOp {
    Zext,
    Sext,
    Trunc,
}

/// Unary operators.
#[derive(Debug)]
pub enum UnaryOp {
    Neg,
    Not,
}

/// An expression.
#[derive(Debug)]
pub enum Expr {
    True,
    False,
    Havoc,
    List(Vec<Box<Expr>>),
    None,
    Null,
    Ext(ExtOp, Box<Expr>, Type),
    Arith(ArithOp, Box<Expr>, Box<Expr>),
    Unary(UnaryOp, Box<Expr>),
    Bool(BoolOp, Box<Expr>, Box<Expr>),
    Compare(CompareOp, Box<Expr>, Box<Expr>),
    Cast(Box<Expr>, Type),
    Var(Ident),
    BVLiteral(BitVector),
    IntLiteral(Int),
    IdentLiteral(Ident),
    EnumLiteral(Ident, Ident),
    Ite(Box<Expr>, Box<Expr>, Box<Expr>),
    Call(Ident, Option<Vec<Type>>, Vec<Box<Expr>>),
    Range(Box<Expr>, Option<Box<Expr>>, Option<Box<Expr>>),
    Index(Box<Expr>, Box<Expr>),
    Concat(Box<Expr>, Box<Expr>),
    Field(Box<Expr>, Ident),
    Let(Ident, Option<Type>, Box<Expr>, Box<Expr>),
    Struct(Ident, Vec<(Ident, Box<Expr>)>),
    Lambda(Vec<(Ident, Option<Type>)>, Box<Expr>),
    /* typed pointer operations */
    PtrDeref(Box<Expr>, Type),
    PtrField(Box<Expr>, Type, Ident),
    PtrIndex(Box<Expr>, Type, Box<Expr>),
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

lalrpop_mod!(spice, "/spice.rs");

fn init_log() {
    let _ = env_logger::builder()
        .format_timestamp(None) 
        .is_test(true)
        .try_init();
}

pub fn parse(path: &str) -> Prog {
    init_log();
    let path = get_test_file(path);
    let ir = fs::read_to_string(path).expect("[spice] failed to read");
    let parser = spice::ProgParser::new();

    parser.parse(&ir).expect("[spice] failed to parse")
}

#[cfg(any(test, feature = "test"))]
pub mod tests {
    #[allow(unused)]
    use super::{Prog, parse};

    #[test]
    pub fn spice_glue_lib() -> Prog {
        parse("../test/spec/lib.spec")
    }

    #[test]
    pub fn spice_parse_refmodel() -> Prog {
        parse("../test/spec/refmodel.spec")
    }

    #[test]
    pub fn spice_parse_new_refmodel() -> Prog {
        parse("../test/spec/refmodel-new.spec")
    }

    #[test]
    pub fn spice_parse_lambda() -> Prog {
        parse("../test/spec/lambda.spec")
    }
}
