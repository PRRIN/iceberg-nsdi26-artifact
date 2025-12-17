//! Wraping for the backend SMT solver.

pub mod z3solver;

use crate::middleend::*;
use crate::panic::Panicable;
use std::rc::Rc;
pub use z3solver::{Expr, Solver};

/// Unified enum for the result of the `check()` method.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum CheckResult {
    /// The query is unsatisfiable.
    Unsat,
    /// The query was interrupted, timed out or otherwise failed.
    Unknown,
    /// The query is satisfiable.
    Sat,
}

impl Into<bool> for CheckResult {
    fn into(self) -> bool {
        if let CheckResult::Unsat = self {
            false
        } else {
            true
        }
    }
}

/// A solver for the use of the middleend symbolic execution engine.
///
/// Note: to avoid dynamic dispatch, these methods are not actually called.
/// This trait exist only to make sure all solver implementations conform
/// to one interface.
pub trait SolverImpl {
    /// Marks a push point for the solver.
    fn push(&mut self);

    /// Reverts to the last `push`.
    fn pop(&mut self);

    /// Adds `cond` as an assertion into the solver.
    ///
    /// # Panics
    /// `cond` is expected to have a boolean type (namely,
    /// `type_is_bool!(cond.ty())` is true). Panics otherwise.
    fn assert(&mut self, cond: Rc<Exp>, mstate: &MemoryState) -> Panicable<()>;

    /// Adds "`this` equals `that`" as an assertion into the solver.
    ///
    /// # Panics
    /// `this` and `that` should have the same `Type`; further, the type
    /// should only be `BitVec`, `Int`, `Enum` or `Pointer`. Panic otherwise.
    fn assert_eq(&mut self, this: Rc<Exp>, that: Rc<Exp>, mstate: &MemoryState) -> Panicable<()>;

    /// Checks the satisfiability of current assertions,
    /// returning the result.
    fn check(&self) -> CheckResult;

    /// Checks if the state represented by `desc` is free.
    ///
    /// A state is considered free if it is not involved in any path constraints
    /// so far.
    fn is_free(&self, desc: Rc<SymbolicDesc>) -> bool;
}
