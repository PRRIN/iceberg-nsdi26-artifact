//! Implements `Effect`s in a summary, that a function can produce.

use by_address::ByAddress;

use super::*;
use crate::middleend::{se::*, *};

/// Effects that a function can produce.
///
/// A summary is consisted of a tree of `Effect`s. In a sense, `Effect`s resemble
/// `CfgNode`s; merely that summaries are the expanded version (from graph to tree).
#[derive(Debug, Clone)]
pub(super) enum Effect {
    /// Asserting a path condition.
    Assume(Rc<Exp>),

    /// Partially specializing on the assumption that the symbolic value
    /// with the given descriptor takes the given `specializer`.
    ///
    /// The ideal case where all dependent states of a function are modeled
    /// as symbolic values is often not only expensive, but prohibitive.
    /// Concretizing a dependent state causes the summary to be partially
    /// specialized on an extra assumption.
    Specialize(Rc<SymbolicDesc>, Rc<Exp>),

    /// Panicking the program with a custom message.
    Panic(String),

    /// Performing side effects at function return.
    Ret(Box<[SideEffect]>),

    /// The root of all effects; exists for structural reasons only.
    Root,
}

/// Side effects that get applied at the return node of a summary.
#[derive(Debug, Clone)]
pub(in crate::middleend::se) enum SideEffect {
    /// Bind a return value.
    Return(Rc<Exp>),

    /// Bind a throw value.
    Throw(Rc<Exp>),

    /// Allocate a new heap region with the given `Type` and zero-init flag, assigning the actual
    /// region to the given symbolic region.
    Malloc(Rc<Type>, bool, u32),

    /// Free the heap region behind the symbolic region.
    Free(u32),

    /// Storing `exp` to the target memory descriptor.
    Store(MemoryDesc, Rc<Exp>),

    /// Storing `exp` to the target symbolic memory descriptor.
    StoreSymbolic(u32, u32, Rc<Exp>),
}

impl PartialEq for SideEffect {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (SideEffect::Free(a), SideEffect::Free(b)) => a.eq(b).into(),
            (SideEffect::Malloc(aty, aconst, adesc), SideEffect::Malloc(bty, bconst, bdesc)) => {
                *aconst == *bconst && type_eq!(*aty, *bty) && adesc == bdesc
            }
            (SideEffect::Store(adesc, aexp), SideEffect::Store(bdesc, bexp)) => {
                adesc == bdesc && aexp.eq(bexp).into()
            }
            (
                SideEffect::StoreSymbolic(areg, anode, aexp),
                SideEffect::StoreSymbolic(breg, bnode, bexp),
            ) => areg == breg && *anode == *bnode && aexp.eq(bexp).into(),
            (SideEffect::Return(a), SideEffect::Return(b)) => a.eq(b).into(),
            _ => false,
        }
    }
}

impl Eq for SideEffect {}

impl std::hash::Hash for SideEffect {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        match self {
            SideEffect::Return(exp) => {
                0.hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
            SideEffect::Malloc(ty, zero_init, srid) => {
                1.hash(state);
                HashPtrType::from(ty.clone()).hash(state);
                (*zero_init).hash(state);
                srid.hash(state);
            }
            SideEffect::Free(srid) => {
                2.hash(state);
                srid.hash(state);
            }
            SideEffect::Store(desc, exp) => {
                3.hash(state);
                desc.hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
            SideEffect::StoreSymbolic(sym, ofs, exp) => {
                4.hash(state);
                sym.hash(state);
                ofs.hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
            SideEffect::Throw(exp) => {
                6.hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
        }
    }
}

impl PartialEq for Effect {
    fn eq(&self, other: &Self) -> bool {
        match (self, other) {
            (Effect::Assume(a), Effect::Assume(b)) => a.eq(b).into(),
            (Effect::Specialize(adesc, aexp), Effect::Specialize(bdesc, bexp)) => {
                adesc == bdesc && aexp.eq(bexp).into()
            }
            (Effect::Panic(_), Effect::Panic(_)) => true, // the panic message is not really important
            (Effect::Root, Effect::Root) => true,
            (Effect::Ret(asides), Effect::Ret(bsides)) => asides.into_iter().eq(bsides.into_iter()),
            _ => false,
        }
    }
}

impl Eq for Effect {}

impl std::hash::Hash for Effect {
    fn hash<H: std::hash::Hasher>(&self, state: &mut H) {
        match self {
            Effect::Assume(exp) => {
                0.hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
            Effect::Specialize(desc, exp) => {
                1.hash(state);
                ByAddress(desc.clone()).hash(state);
                std::mem::discriminant(exp.as_ref()).hash(state);
            }
            Effect::Panic(_) => 2.hash(state),
            Effect::Root => 3.hash(state),
            Effect::Ret(sides) => {
                4.hash(state);
                for side in sides.iter() {
                    side.hash(state);
                }
            }
        }
    }
}

impl Effect {
    pub(super) fn fmt(&self, f: &mut fmt::Formatter<'_>, verbose: bool) -> fmt::Result {
        match self {
            Effect::Assume(cond) => write!(f, "[Assume| {cond} ]"),
            Effect::Panic(msg) => write!(f, "[Panic| {msg} ]"),
            Effect::Specialize(desc, value) => write!(f, "[Specialize| {desc} is {value} ]"),
            Effect::Ret(side_effects) => {
                if verbose {
                    write!(f, "[Ret")?;
                    for (idx, side_effect) in side_effects.iter().enumerate() {
                        let endl = if idx < side_effects.len() - 1 {
                            "\n"
                        } else {
                            " ]"
                        };
                        write!(f, "| {side_effect}{endl}")?;
                    }
                } else {
                    write!(f, "[Ret| ..{} ]", side_effects.last().unwrap())?;
                }

                Ok(())
            }
            Effect::Root => write!(f, "[Root]"),
        }
    }
}

impl fmt::Display for Effect {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        self.fmt(f, true)
    }
}

impl fmt::Display for SideEffect {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match self {
            SideEffect::Return(value) => write!(f, "return {value};"),
            SideEffect::Throw(value) => write!(f, "throw {value};"),
            SideEffect::Store(target, value) => write!(f, "{value} -> {target};"),
            SideEffect::StoreSymbolic(sym, ofs, value) => {
                write!(f, "{value} -> [{sym}]::{ofs};")
            }
            SideEffect::Malloc(ty, zero_init, symbolic) => {
                write!(
                    f,
                    "[{symbolic}] := malloc {ty}, {};",
                    if *zero_init { "zero" } else { "havoc" }
                )
            }
            SideEffect::Free(region) => write!(f, "free [{region}]"),
        }
    }
}
