//! Generic errors during the symbolic execution.
//!
//! Apart from the `SeError::Panic` variant, other errors are all semantic-level,
//! recoverable errors.

use crate::middleend::*;
use crate::panic::*;
use std::fmt;
use std::rc::Rc;

pub enum SeError {
    /// Leaking a reference to local stack variables.
    #[cfg(feature = "err_stack_pointer_leak")]
    StackLeak { stack_desc: Rc<RegionDesc> },

    /// Null pointer access.
    PtrNull { ptr: Rc<Exp> },
    /// Mutating through a readonly pointer.
    PtrReadOnly { desc: MemoryDesc, exp: Rc<Exp> },
    /// Integer divide by zero.
    DivideByZero { exp: Rc<Exp> },
    /// Memory access out of bound.
    OutOfBound { region: Rc<RegionDesc>, ofs: u32 },
    /// Contradiction when trying to specialize a symbolic.
    ImpossibleSpecialize,
    /// Using a heap region after freeing it.
    UseAfterFree { region: Rc<RegionDesc> },
    /// Freeing a non-heap region.
    BadFree { region: Rc<RegionDesc> },

    /// Iceberg internal panic.
    Panic(PanicSite),
}

impl<T> Into<Result<T, SeError>> for PanicSite {
    fn into(self) -> Result<T, SeError> {
        Err(SeError::Panic(self))
    }
}

impl Into<SeError> for PanicSite {
    fn into(self) -> SeError {
        SeError::Panic(self)
    }
}

impl SeError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            SeError::PtrNull { ptr } => {
                write!(f, "null pointer access of {ptr}")
            }
            SeError::PtrReadOnly { desc, exp } => {
                write!(f, "{desc} is read-only when storing {exp}")
            }
            SeError::DivideByZero { exp } => write!(f, "dividing by zero when executing {exp}"),
            #[cfg(feature = "err_stack_pointer_leak")]
            SeError::StackLeak { stack_desc } => write!(f, "leaking local stack {stack_desc}"),
            SeError::OutOfBound { region, ofs } => {
                write!(f, "pointer out of bound with {region} and offset {ofs}")
            }
            SeError::ImpossibleSpecialize => {
                write!(
                    f,
                    "specializing is impossible because of previous constraints"
                )
            }
            SeError::UseAfterFree { region } => write!(f, "using freed region {region}"),
            SeError::BadFree { region } => write!(f, "freeing non-heap region {region}"),

            SeError::Panic(panic) => write!(f, "{:?}", panic),
        }
    }
}

impl fmt::Debug for SeError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl fmt::Display for SeError {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f)
    }
}

impl<T> Panic<T> for Result<T, SeError> {
    fn get(self, info: &impl PanicInfo) -> T {
        self.unwrap_or_else(|err| match err {
            SeError::Panic(panic) => panic.panic(info),
            _ => make_panic!("{:?}", err).panic(info),
        })
    }
}
