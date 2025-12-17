//! Operators for certain `Exp`s.

use std::fmt;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ArithOp {
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

impl fmt::Display for ArithOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            ArithOp::Add => write!(f, "+"),
            ArithOp::Sub => write!(f, "-"),
            ArithOp::And => write!(f, "&"),
            ArithOp::Or => write!(f, "|"),
            ArithOp::Xor => write!(f, "^"),
            ArithOp::Lshr => write!(f, ">>l"),
            ArithOp::Ashr => write!(f, ">>a"),
            ArithOp::Shl => write!(f, "<<"),
            ArithOp::Mul => write!(f, "*"),
            ArithOp::Sdiv => write!(f, "/"),
            ArithOp::Udiv => write!(f, "/u"),
            ArithOp::Srem => write!(f, "%"),
            ArithOp::Urem => write!(f, "%u"),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum BoolOp {
    And,
    Or,
}

impl fmt::Display for BoolOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            BoolOp::And => write!(f, "&&"),
            BoolOp::Or => write!(f, "||"),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CompareOp {
    Ult,
    Ugt,
    Eq,
    Neq,
    Ule,
    Uge,
    Sge,
    Sgt,
    Sle,
    Slt,
}

impl fmt::Display for CompareOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            CompareOp::Eq => write!(f, "=="),
            CompareOp::Neq => write!(f, "!="),
            CompareOp::Ult => write!(f, "<u"),
            CompareOp::Ule => write!(f, "<=u"),
            CompareOp::Ugt => write!(f, ">u"),
            CompareOp::Uge => write!(f, ">=u"),
            CompareOp::Slt => write!(f, "<"),
            CompareOp::Sle => write!(f, "<="),
            CompareOp::Sgt => write!(f, ">"),
            CompareOp::Sge => write!(f, ">="),
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum ExtOp {
    Sext,
    Trunc,
    Zext,
}

impl fmt::Display for ExtOp {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            ExtOp::Sext => write!(f, "as"),
            ExtOp::Trunc => write!(f, "as"),
            ExtOp::Zext => write!(f, "as"),
        }
    }
}
