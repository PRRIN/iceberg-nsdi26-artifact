//! This module implements the "execution" of `Exp`s.
//!
//! Semantically, every `Exp`, no matter how nested it is,
//! will boil down to one result `Exp`, and perhaps produces
//! some side-effect. This module allows for computing just that.
//!
//! Still there are two subtleties:
//!
//! (1) The effect on external states: something like
//! an `Exp::Arith` only performs *stateless* arithmetics, and
//! can be **evaluated** without a `MemoryState`; yet, one of
//! its operands may be an `Exp::Load`, which must be **executed**
//! with a `MemoryState`, perhaps changing it externally.
//!
//! (2) `Exp`s that consist of `Exp::Symbolic`s are by definition
//! not possible to be executed completely (i.e. into an `Exp` that
//! satisfies `exp_is_atom!()`), which may in turn block the execution
//! of other `Exp`s. A prime example would be an `Exp::ExtractValue`
//! with an `Exp::Symbolic` as the index.
//!
//! As such, while only one single implementation for "execution" is
//! provided here, it can be further weakened to "evaluation", or strengthened
//! to use "specified" values, as is needed. This is controlled with
//! `ExecMode::Exec`, `ExecMode::Eval` and `Exec::Spec`.
//!
//! * The `Eval` mode only evaluates `Exp`s that relies on no states. It may be
//! useful for static analysis.
//! * The `Exec` mode attempts to execute all `Exp`s, modifying states and
//! producing effects, and aims to be as complete as possible. The exception
//! is `Exp::Symbolic`, which may not be specialized. See `se::summary` for
//! information on specializing.
//! * The `Spec` mode may, in addition to any `Exec` behavior, generate
//! `Effect::Specialize`, when unwrapping an `Exp::Symbolic`. It guarantees
//! complete riddance of symbolic components (but not necessarily full
//! reduction of an `Exp`).
//!
//! Finally, always use `See::eval()`, `See::exec()` and `See::exec_spec()` outside
//! of this module, which hides the overly verbose interface.

// TODO: Implement an `ExecContext" to better pass around needed resouces,
// express modes, and allow for template substitutions.

use super::*;
use crate::{
    middleend::*,
    panic::{throw_panic, throw_type_mismatch},
};
use std::collections::VecDeque;
use std::rc::Rc;

pub(super) enum ExecMode<'a> {
    Eval,
    Exec(&'a mut See),
    Spec(&'a mut See),
}

impl<'a> std::fmt::Display for ExecMode<'a> {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            ExecMode::Eval => write!(f, "Eval"),
            ExecMode::Exec(_) => write!(f, "Exec"),
            ExecMode::Spec(_) => write!(f, "Spec"),
        }
    }
}

macro_rules! mode_to_spec {
    ($mode: expr) => {
        match $mode {
            ExecMode::Eval => ExecMode::Eval,
            ExecMode::Exec(see) | ExecMode::Spec(see) => ExecMode::Spec(*see),
        }
    };
}

macro_rules! mode_to_exec {
    ($mode: expr) => {
        match $mode {
            ExecMode::Eval => ExecMode::Eval,
            ExecMode::Exec(see) | ExecMode::Spec(see) => ExecMode::Exec(*see),
        }
    };
}

macro_rules! see {
    ($mode: expr) => {
        match $mode {
            ExecMode::Eval => None,
            ExecMode::Exec(see) | ExecMode::Spec(see) => Some(see),
        }
    };
}

macro_rules! produce_panic_if {
    ($sman: expr, $traces: expr, $cond: expr, $err: expr) => {
        if $cond {
            $sman.panic($err.to_string(), $traces);
            Err($err)
        } else {
            Ok(())
        }
    };
}

/// Convert `$ptr` (an `Exp` of type `Type::Pointer`) to a memory descriptor.
///
/// If `$ptr` is `Exp::Null`, `Exp::Havoc`, or `Exp::Ident` `$err_ret` is executed;
/// if it is neither those nor `Exp::PointerLiteral`/`Exp::SymbolicPtr`, `$default`
/// is executed.
macro_rules! ptr_to_desc {
    ($see: expr, $ptr: expr, $err_ret: expr, $default_ret: expr) => {
        match &*$ptr {
            Exp::PointerLiteral(vdata) => vdata.desc.clone(),
            Exp::SymbolicPtr(vdata) => {
                let actual = SymbolicRegionDesc::concretize(
                    &mut $see.sman,
                    vdata.region.scope(),
                    vdata.region.symbolic(),
                )
                .get(&$see.traces);
                MemoryDesc::from_raw_parts(actual, vdata.offset)
            }
            Exp::Null(_) | Exp::Havoc(_) | Exp::Ident(_) => $err_ret,
            _ => $default_ret,
        }
    };
}

pub(crate) use ptr_to_desc;

type ExecResult = Result<Rc<Exp>, SeError>;

/// Execute an `Exp`, with or without state, returning the
/// resulting `Exp`, modifying states and producing `Effect`s
/// as is appropriate.
#[inline]
pub(super) fn exec(exp: Rc<Exp>, mode: &mut ExecMode) -> ExecResult {
    match &*exp {
        // These are atom `Exp`s which cannot be further evaluated
        Exp::Ident(_)
        | Exp::EnumLiteral(_)
        | Exp::Havoc(_)
        | Exp::IntLiteral(_)
        | Exp::None(_)
        | Exp::Null(_)
        | Exp::PointerLiteral(_) => Ok(exp.clone()),

        // These rely on states to be executed
        Exp::Alloca(data) => exec_alloca(mode, data, &exp),
        Exp::Load(data) => exec_load(mode, data, &exp),
        Exp::Store(data) => exec_store(mode, data, &exp),
        Exp::Var(data) => exec_var(mode, data, &exp),
        Exp::GetPtr(data) => exec_get_ptr(mode, data, &exp),
        Exp::GetElemPtr(data) => exec_get_elem_ptr(mode, data, &exp),
        Exp::Symbolic(data) => exec_symbolic(mode, data, &exp),
        Exp::SymbolicPtr(data) => exec_symbolic_ptr(mode, data, &exp),

        Exp::Arith(data) => exec_arith(mode, data, &exp),
        Exp::BitCast(data) => exec_bitcast(mode, data, &exp),
        Exp::Boolean(data) => exec_boolean(mode, data, &exp),
        Exp::Compare(data) => {
            #[cfg(feature = "strat_casp")]
            {
                if type_is_kind!(data.lhs.ty(), Type::Pointer) {
                    exec_compare(&mut mode_to_spec!(mode), data, &exp)
                } else {
                    exec_compare(mode, data, &exp)
                }
            }
            #[cfg(not(feature = "strat_casp"))]
            {
                exec_compare(mode, data, &exp)
            }
        }
        Exp::Concat(data) => exec_concat(mode, data, &exp),
        Exp::Ext(data) => exec_ext(mode, data, &exp),
        Exp::ExtractValue(data) => exec_extract_value(mode, data, &exp),
        Exp::Index(data) => exec_index(mode, data, &exp),
        Exp::InsertValue(data) => exec_insert_value(mode, data, &exp),
        Exp::Not(data) => exec_not(mode, data, &exp),
        Exp::Range(data) => exec_range(mode, data, &exp),
        Exp::Tuple(data) => exec_struct(mode, data, &exp),
        Exp::Vector(data) => exec_vector(mode, data, &exp),
    }
}

macro_rules! strip_bitcast {
    ($exp: expr) => {
        match &*$exp {
            Exp::BitCast(data) => data.value.clone(),
            _ => $exp.clone(),
        }
    };
}

/// **`Effect`s produced**:
/// * `Panic` when a divisor of zero is encountered.
fn exec_arith(mode: &mut ExecMode, data: &exp_data::ArithData, exp: &Rc<Exp>) -> ExecResult {
    let lhs = exec(data.lhs.clone(), mode)?;
    let rhs = exec(data.rhs.clone(), mode)?;
    let mut striped_lhs = strip_bitcast!(lhs);
    let mut striped_rhs = strip_bitcast!(rhs);

    if type_is_kind!(striped_lhs.ty(), Type::Pointer) {
        // Pointer arithmetics are not possible with fully symbolic pointers;
        // always `Specialize` if we can
        // TODO: alternatively, implement a `basp` strategy (Bitcasts Always Specialize Pointers).
        if let Some(see) = see!(mode) {
            striped_lhs = exec(striped_lhs, &mut ExecMode::Spec(see))?;
            striped_rhs = exec(striped_rhs, &mut ExecMode::Spec(see))?;
        }
    }

    Ok(match (striped_lhs.as_ref(), striped_rhs.as_ref()) {
        (Exp::IntLiteral(ldata), Exp::IntLiteral(rdata)) => {
            let width = ldata.width;
            let mut value = match data.op {
                op::ArithOp::Add => i64::wrapping_add(ldata.value, rdata.value),
                op::ArithOp::Sub => i64::wrapping_sub(ldata.value, rdata.value),
                op::ArithOp::And => ldata.value & rdata.value,
                op::ArithOp::Or => ldata.value | rdata.value,
                op::ArithOp::Xor => ldata.value ^ rdata.value,
                op::ArithOp::Lshr => {
                    let mask = (1u64 << (width.unwrap() - 1))
                        .wrapping_shl(1)
                        .wrapping_sub(1);
                    u64::wrapping_shr(ldata.value as u64 & mask, rdata.value as u32) as i64
                }
                op::ArithOp::Ashr => i64::wrapping_shr(ldata.value, rdata.value as u32),
                op::ArithOp::Shl => i64::wrapping_shl(ldata.value, rdata.value as u32),
                op::ArithOp::Mul => i64::wrapping_mul(ldata.value, rdata.value),
                op::ArithOp::Sdiv | op::ArithOp::Udiv | op::ArithOp::Srem | op::ArithOp::Urem
                    if rdata.value == 0 =>
                {
                    let err = SeError::DivideByZero { exp: exp.clone() };
                    if let Some(See { sman, traces, .. }) = see!(mode) {
                        sman.panic(err.to_string(), traces);
                    }
                    return Err(err);
                }
                op::ArithOp::Sdiv => i64::wrapping_div(ldata.value, rdata.value),
                op::ArithOp::Udiv => {
                    u64::wrapping_div(ldata.value as u64, rdata.value as u64) as i64
                }
                op::ArithOp::Srem => i64::wrapping_rem(ldata.value, rdata.value),
                op::ArithOp::Urem => {
                    u64::wrapping_rem(ldata.value as u64, rdata.value as u64) as i64
                }
            };
            if let Some(w) = width {
                // Wrap
                value = ((value as u64) & (1u64 << (w - 1)).wrapping_shl(1).wrapping_sub(1)) as i64;
                // Sign-extension
                value = (((value as u64) << (64 - w)) as i64) >> (64 - w);
            }
            Exp::int_literal(value, width).or_else(|panic| panic.into())?
        }

        // Pointer subtraction
        (Exp::PointerLiteral(ldata), Exp::PointerLiteral(rdata))
            if data.op == op::ArithOp::Sub && ldata.desc.region_id() == rdata.desc.region_id() =>
        {
            let mut value =
                i64::wrapping_sub(ldata.desc.offset() as i64, rdata.desc.offset() as i64);
            let width = match lhs.ty().as_ref() {
                Type::BitVec(BitVecKind { width, .. }) => Some(*width),
                Type::Int(_) => None,
                _ => unreachable!(),
            };

            if let Some(w) = width {
                // Wrap
                value = ((value as u64) & (1u64 << (w - 1)).wrapping_shl(1).wrapping_sub(1)) as i64;
                // Sign-extension
                value = (((value as u64) << (64 - w)) as i64) >> (64 - w);
            }
            Exp::int_literal(value, width).or_else(|panic| panic.into())?
        }

        (Exp::SymbolicPtr(ldata), Exp::SymbolicPtr(rdata))
            if data.op == op::ArithOp::Sub && ldata.region == rdata.region =>
        {
            let mut value = i64::wrapping_sub(ldata.offset as i64, rdata.offset as i64);
            let width = match lhs.ty().as_ref() {
                Type::BitVec(BitVecKind { width, .. }) => Some(*width),
                Type::Int(_) => None,
                _ => unreachable!(),
            };

            if let Some(w) = width {
                // Wrap
                value = ((value as u64) & (1u64 << (w - 1)).wrapping_shl(1).wrapping_sub(1)) as i64;
                // Sign-extension
                value = (((value as u64) << (64 - w)) as i64) >> (64 - w);
            }
            Exp::int_literal(value, width).or_else(|panic| panic.into())?
        }

        // Havoc propagation
        (Exp::Havoc(_), _) => lhs.clone(),
        (_, Exp::Havoc(_)) => rhs.clone(),
        (Exp::Ident(_), _) | (_, Exp::Ident(_)) => Exp::havoc(lhs.ty()),

        _ => {
            if Rc::ptr_eq(&lhs, &data.lhs) && Rc::ptr_eq(&rhs, &data.rhs) {
                exp.clone()
            } else {
                Exp::arith(data.op, lhs, rhs).or_else(|panic| panic.into())?
            }
        }
    })
}

/// **`Effect`s produced**: none.
fn exec_bitcast(mode: &mut ExecMode, data: &exp_data::BitCastData, exp: &Rc<Exp>) -> ExecResult {
    let value = exec(data.value.clone(), mode)?;

    // Special cases
    match (&*value.ty(), &*data.new_ty, &*value) {
        // Havoc propagation
        (_, _, Exp::Havoc(_)) => return Ok(Exp::havoc(data.new_ty.clone())),
        // It is ok to cast an `Exp::Ident`
        (_, _, Exp::Ident(vdata)) => {
            return Ok(Exp::ident(data.new_ty.clone(), vdata.ident.clone()))
        }

        (Type::Pointer(_), Type::BitVec(BitVecKind { width, .. }), Exp::Null(_)) => {
            // Casting Exp::Null into int
            return Ok(Exp::int_literal(0, Some(*width)).or_else(|panic| panic.into())?);
        }
        (
            Type::BitVec(_),
            Type::Pointer(_),
            Exp::IntLiteral(exp_data::IntLiteralData { value, .. }),
        ) if *value == 0 => {
            // Casting 0 into pointer
            return Ok(Exp::null());
        }
        (Type::Pointer(_), Type::BitVec(_), _) | (Type::BitVec(_), Type::Pointer(_), _)
            if !exp_is_kind!(value, Exp::BitCast) =>
        {
            // Otherwise, casting into/out of Pointer type will not be instantiated now...
            return Ok(if Rc::ptr_eq(&value, &data.value) {
                exp.clone()
            } else {
                Exp::bitcast(data.new_ty.clone(), value).or_else(|panic| panic.into())?
            });
        }
        _ => {}
    }

    Ok(match &*value {
        Exp::Havoc(_) => Exp::havoc(data.new_ty.clone()),
        Exp::BitCast(vdata) => {
            // ...however, we may simplify a chain of BitCast's
            if type_eq!(data.new_ty, vdata.value.ty()) {
                vdata.value.clone()
            } else {
                Exp::bitcast(data.new_ty.clone(), vdata.value.clone())
                    .or_else(|panic| panic.into())?
            }
        }
        _ => {
            if Rc::ptr_eq(&value, &data.value) {
                exp.clone()
            } else {
                Exp::bitcast(data.new_ty.clone(), value).or_else(|panic| panic.into())?
            }
        }
    })
}

/// **`Effect`s produced**: none.
fn exec_boolean(mode: &mut ExecMode, data: &exp_data::BooleanData, exp: &Rc<Exp>) -> ExecResult {
    let lhs = exec(data.lhs.clone(), mode)?;
    let rhs = exec(data.rhs.clone(), mode)?;
    match (data.op, exp_as_bool!(lhs), exp_as_bool!(rhs)) {
        (op::BoolOp::And, Some(false), _) => return Ok(Exp::false_exp()),
        (op::BoolOp::And, _, Some(false)) => return Ok(Exp::false_exp()),
        (op::BoolOp::And, Some(true), Some(true)) => return Ok(Exp::true_exp()),
        (op::BoolOp::Or, Some(true), _) => return Ok(Exp::true_exp()),
        (op::BoolOp::Or, _, Some(true)) => return Ok(Exp::true_exp()),
        (op::BoolOp::Or, Some(false), Some(false)) => return Ok(Exp::false_exp()),
        _ => {}
    }
    Ok(match (&*lhs, &*rhs) {
        // Havoc propagation
        (Exp::Havoc(_), _) => lhs.clone(),
        (_, Exp::Havoc(_)) => rhs.clone(),
        (Exp::Ident(_), _) | (_, Exp::Ident(_)) => Exp::havoc(lhs.ty()),
        _ => {
            if Rc::ptr_eq(&lhs, &data.lhs) && Rc::ptr_eq(&rhs, &data.rhs) {
                exp.clone()
            } else {
                Exp::boolean(data.op, lhs, rhs).or_else(|panic| panic.into())?
            }
        }
    })
}

/// **`Effect`s produced**:
/// * `Specialize`, if `SymbolicPtr`s are compared with `PointerLiteral`s at `ExecMode::Spec`.
fn exec_compare(mode: &mut ExecMode, data: &exp_data::CompareData, exp: &Rc<Exp>) -> ExecResult {
    let lhs = exec(data.lhs.clone(), mode)?;
    let rhs = exec(data.rhs.clone(), mode)?;

    let res = match (data.op, &*strip_bitcast!(lhs), &*strip_bitcast!(rhs)) {
        // `IntLiteral` supports arbitrary comparison
        (_, Exp::IntLiteral(ldata), Exp::IntLiteral(rdata)) => match data.op {
            op::CompareOp::Ult => (ldata.value as u64) < (rdata.value as u64),
            op::CompareOp::Ugt => (ldata.value as u64) > (rdata.value as u64),
            op::CompareOp::Eq => ldata.value == rdata.value,
            op::CompareOp::Neq => ldata.value != rdata.value,
            op::CompareOp::Ule => (ldata.value as u64) <= (rdata.value as u64),
            op::CompareOp::Uge => (ldata.value as u64) >= (rdata.value as u64),
            op::CompareOp::Sge => ldata.value >= rdata.value,
            op::CompareOp::Sgt => ldata.value > rdata.value,
            op::CompareOp::Sle => ldata.value <= rdata.value,
            op::CompareOp::Slt => ldata.value < rdata.value,
        },

        // `EnumLiteral` can only be == / != tested
        (
            op::CompareOp::Eq | op::CompareOp::Neq,
            Exp::EnumLiteral(ldata),
            Exp::EnumLiteral(rdata),
        ) => {
            if data.op == op::CompareOp::Eq {
                ldata.discriminant == rdata.discriminant
            } else {
                ldata.discriminant != rdata.discriminant
            }
        }

        (_, Exp::PointerLiteral(ldata), Exp::PointerLiteral(rdata)) => {
            let lptr = &ldata.desc;
            let rptr = &rdata.desc;
            if lptr.region_id() == rptr.region_id() {
                match data.op {
                    op::CompareOp::Eq => lptr.offset() == rptr.offset(),
                    op::CompareOp::Neq => lptr.offset() != rptr.offset(),
                    op::CompareOp::Ult => lptr.offset() < rptr.offset(),
                    op::CompareOp::Ugt => lptr.offset() > rptr.offset(),
                    op::CompareOp::Ule => lptr.offset() <= rptr.offset(),
                    op::CompareOp::Uge => lptr.offset() >= rptr.offset(),
                    _ => unreachable!(),
                }
            } else {
                match data.op {
                    op::CompareOp::Eq => false,
                    op::CompareOp::Neq => true,
                    _ => throw_panic!(
                        "trying to compare pointers between diffenrent regions: {lhs} and {rhs}"
                    ),
                }
            }
        }

        (_, Exp::SymbolicPtr(ldata), Exp::SymbolicPtr(rdata)) => {
            assert!(ldata.region.scope() == rdata.region.scope());
            if ldata.region == rdata.region {
                /* Note: this is OK because no node will be allocated for zero-sized fields */
                match data.op {
                    op::CompareOp::Eq => ldata.offset == rdata.offset,
                    op::CompareOp::Neq => ldata.offset != rdata.offset,
                    op::CompareOp::Ult => ldata.offset < rdata.offset,
                    op::CompareOp::Ugt => ldata.offset > rdata.offset,
                    op::CompareOp::Ule => ldata.offset <= rdata.offset,
                    op::CompareOp::Uge => ldata.offset >= rdata.offset,
                    _ => unreachable!(),
                }
            } else {
                match data.op {
                    op::CompareOp::Eq => false,
                    op::CompareOp::Neq => true,
                    _ => throw_panic!(
                        "trying to compare pointers between diffenrent regions: {lhs} and {rhs}"
                    ),
                }
            }
        }

        (_, Exp::SymbolicPtr(_), Exp::PointerLiteral(_)) => match data.op {
            op::CompareOp::Eq => false,
            op::CompareOp::Neq => true,
            _ => throw_panic!(
                "trying to compare pointers between diffenrent regions: {lhs} and {rhs}"
            ),
        },

        (_, Exp::PointerLiteral(_), Exp::SymbolicPtr(_)) => match data.op {
            op::CompareOp::Eq => false,
            op::CompareOp::Neq => true,
            _ => throw_panic!(
                "trying to compare pointers between diffenrent regions: {lhs} and {rhs}"
            ),
        },

        (_, Exp::Null(_), Exp::PointerLiteral(_) | Exp::SymbolicPtr(_) | Exp::Ident(_)) => {
            if matches!(
                data.op,
                op::CompareOp::Eq | op::CompareOp::Uge | op::CompareOp::Ugt
            ) {
                false
            } else {
                true
            }
        }
        (_, Exp::PointerLiteral(_) | Exp::SymbolicPtr(_) | Exp::Ident(_), Exp::Null(_)) => {
            if matches!(
                data.op,
                op::CompareOp::Eq | op::CompareOp::Ule | op::CompareOp::Ult
            ) {
                false
            } else {
                true
            }
        }
        (_, Exp::Null(_), Exp::Null(_)) => {
            if matches!(
                data.op,
                op::CompareOp::Eq | op::CompareOp::Ule | op::CompareOp::Uge
            ) {
                true
            } else {
                false
            }
        }

        // We may be comparing a pointer casted to int and zero...
        (
            op::CompareOp::Eq
            | op::CompareOp::Neq
            | op::CompareOp::Uge
            | op::CompareOp::Ugt
            | op::CompareOp::Ule
            | op::CompareOp::Ult,
            Exp::IntLiteral(vdata),
            Exp::PointerLiteral(_) | Exp::SymbolicPtr(_),
        ) if vdata.value == 0 => match data.op {
            op::CompareOp::Neq | op::CompareOp::Ule | op::CompareOp::Ult => true,
            _ => false,
        },

        (
            op::CompareOp::Eq
            | op::CompareOp::Neq
            | op::CompareOp::Uge
            | op::CompareOp::Ugt
            | op::CompareOp::Ule
            | op::CompareOp::Ult,
            Exp::PointerLiteral(_) | Exp::SymbolicPtr(_),
            Exp::IntLiteral(vdata),
        ) if vdata.value == 0 => match data.op {
            op::CompareOp::Neq | op::CompareOp::Uge | op::CompareOp::Ugt => true,
            _ => false,
        },

        // Havoc propagation
        (_, Exp::Havoc(_), _)
        | (_, _, Exp::Havoc(_))
        | (_, Exp::Ident(_), _)
        | (_, _, Exp::Ident(_)) => return Ok(Exp::havoc(Type::mk_bool())),

        _ => {
            if Rc::ptr_eq(&lhs, &data.lhs) && Rc::ptr_eq(&rhs, &data.rhs) {
                return Ok(exp.clone());
            } else {
                return Ok(Exp::compare(data.op, lhs, rhs).unwrap());
            }
        }
    };

    Ok(if res {
        Exp::true_exp()
    } else {
        Exp::false_exp()
    })
}

/// **`Effect`s produced**: none.
fn exec_concat(mode: &mut ExecMode, data: &exp_data::ConcatData, exp: &Rc<Exp>) -> ExecResult {
    let lhs = exec(data.lhs.clone(), mode)?;
    let rhs = exec(data.rhs.clone(), mode)?;
    Ok(match (&*lhs, &*rhs) {
        (Exp::Vector(ldata), Exp::Vector(rdata)) => {
            let elems = ldata
                .elems
                .iter()
                .chain(rdata.elems.iter())
                .cloned()
                .collect();
            Exp::vector(lhs.ty(), elems).unwrap()
        }
        // Havoc propagation
        (Exp::Havoc(_), _) => lhs.clone(),
        (_, Exp::Havoc(_)) => rhs.clone(),
        (Exp::Ident(_), _) | (_, Exp::Ident(_)) => Exp::havoc(lhs.ty()),

        _ => {
            if Rc::ptr_eq(&lhs, &data.lhs) && Rc::ptr_eq(&rhs, &data.rhs) {
                exp.clone()
            } else {
                Exp::concat(lhs, rhs).or_else(|panic| panic.into())?
            }
        }
    })
}

/// **`Effect`s produced**: none.
fn exec_ext(mode: &mut ExecMode, data: &exp_data::ExtData, exp: &Rc<Exp>) -> ExecResult {
    let value = exec(data.value.clone(), mode)?;

    // Havoc propagation
    match &*value {
        Exp::Havoc(_) => return Ok(value.clone()),
        Exp::Ident(_) => return Ok(Exp::havoc(data.new_ty.clone())),
        _ => {}
    }

    let Exp::IntLiteral(vdata) = &*value else {
        return Ok(if Rc::ptr_eq(&value, &data.value) {
            exp.clone()
        } else {
            Exp::ext(data.op, data.new_ty.clone(), value).or_else(|panic| panic.into())?
        });
    };

    let value = match (data.op, &*data.value.ty(), &*data.new_ty) {
        (op::ExtOp::Sext, _, _) => {
            // Sign-extension is NOOP since we always store values as `i64`
            vdata.value
        }
        (
            op::ExtOp::Zext,
            Type::BitVec(BitVecKind { width: w1, .. }),
            Type::BitVec(BitVecKind { width: w2, .. }),
        ) => {
            if *w1 == *w2 {
                vdata.value
            } else {
                // Zero-extension is truncation to `w1`
                ((vdata.value as u64) & (1u64 << (*w1 - 1)).wrapping_shl(1).wrapping_sub(1)) as i64
            }
        }
        (op::ExtOp::Trunc, _, Type::BitVec(BitVecKind { width: w2, .. })) => {
            (vdata.value << (64 - *w2)) as i64 >> (64 - *w2)
        }

        _ => {
            return Ok(if Rc::ptr_eq(&value, &data.value) {
                exp.clone()
            } else {
                Exp::ext(data.op, data.new_ty.clone(), value).or_else(|panic| panic.into())?
            })
        }
    };

    let width = Some(type_as_kind!(data.new_ty, Type::BitVec).width);
    Exp::int_literal(value, width).or_else(|panic| panic.into())
}

/// **`Effect`s produced**:
/// * `Specialize`, if indices are not all `Exp::IntLiteral`.
fn exec_extract_value(
    mode: &mut ExecMode,
    data: &exp_data::ExtractValueData,
    _: &Rc<Exp>,
) -> ExecResult {
    let mut agg = exec(data.agg.clone(), mode)?;
    // `Specialize` on indices
    let mut indices = data
        .indices
        .iter()
        .map(|exp| exec(exp.clone(), &mut mode_to_spec!(mode)))
        .collect::<Result<VecDeque<_>, _>>()?;

    while let Some(index) = indices.pop_front() {
        match (&*agg, &*index) {
            (Exp::Havoc(_), _) | (_, Exp::Havoc(_)) | (Exp::Ident(_), _) | (_, Exp::Ident(_)) => {
                // Early stop
                return Ok(Exp::havoc(data.ty.clone()));
            }
            (Exp::Tuple(vdata), Exp::IntLiteral(idata)) => {
                let index = idata.value;
                agg = vdata
                    .fields
                    .get(index as usize)
                    .cloned()
                    .unwrap_or_else(|| Exp::havoc(data.ty.clone()));
            }
            (Exp::Vector(vdata), Exp::IntLiteral(idata)) => {
                let index = idata.value;
                agg = vdata
                    .elems
                    .get(index as usize)
                    .cloned()
                    .unwrap_or_else(|| Exp::havoc(data.ty.clone()));
            }
            _ => return Exp::extract_value(agg, Vec::from(indices)).or_else(|panic| panic.into()),
        }
    }
    exec(agg, mode)
}

/// **`Effect`s produced**:
/// * `Specialize`, if the index is not `Exp::IntLiteral`.
fn exec_index(mode: &mut ExecMode, data: &exp_data::IndexData, exp: &Rc<Exp>) -> ExecResult {
    let list = exec(data.vector.clone(), mode)?;
    // specialize on the `index`
    let index = exec(data.index.clone(), &mut mode_to_spec!(mode))?;

    match (&*list, &*index) {
        (Exp::Ident(_), _) | (_, Exp::Ident(_)) => Ok(Exp::havoc(
            type_as_kind!(list.ty(), Type::List).elem_ty.clone(),
        )),
        (Exp::Vector(vdata), Exp::IntLiteral(idata)) => Ok(vdata
            .elems
            .get(idata.value as usize)
            .cloned()
            .unwrap_or_else(|| Exp::havoc(data.ty.clone()))),
        _ => {
            if Rc::ptr_eq(&list, &data.vector) && Rc::ptr_eq(&index, &data.index) {
                Ok(exp.clone())
            } else {
                Exp::index(list, index).or_else(|panic| panic.into())
            }
        }
    }
}

/// **`Effect`s produced**:
/// * `Specialize`, if indices are not all `Exp::IntLiteral`s.
fn exec_insert_value(
    mode: &mut ExecMode,
    data: &exp_data::InsertValueData,
    _: &Rc<Exp>,
) -> ExecResult {
    let mut agg = exec(data.agg.clone(), mode)?;
    let mut value = exec(data.value.clone(), mode)?;
    // `Specialize` on indices
    let mut indices = data
        .indices
        .iter()
        .map(|exp| exec(exp.clone(), &mut mode_to_spec!(mode)))
        .collect::<Result<VecDeque<_>, _>>()?;

    // XXX: because of the implied immutability of `Rc`s, this is very inefficient...
    // : The ExecContext should fix this!
    let mut aggs = Vec::new();
    let mut indices_usize = Vec::new();
    let mut may_fold = exp_is_kind!(value, Exp::Havoc);
    while let Some(index) = indices.pop_front() {
        match (&*agg, &*index) {
            (_, Exp::Havoc(_)) | (Exp::Ident(_), _) | (_, Exp::Ident(_)) => {
                return Ok(Exp::havoc(data.agg.ty()))
            }
            (Exp::Tuple(vdata), Exp::IntLiteral(idata)) => {
                aggs.push(agg.clone());
                indices_usize.push(idata.value as usize);
                if let Some(nxt) = vdata.fields.get(idata.value as usize) {
                    agg = nxt.clone();
                } else {
                    return Ok(Exp::havoc(data.agg.ty()));
                }
            }
            (Exp::Vector(vdata), Exp::IntLiteral(idata)) => {
                aggs.push(agg.clone());
                indices_usize.push(idata.value as usize);
                if let Some(nxt) = vdata.elems.get(idata.value as usize) {
                    agg = nxt.clone();
                } else {
                    return Ok(Exp::havoc(data.agg.ty()));
                }
            }
            (Exp::Havoc(_), Exp::IntLiteral(idata)) => {
                aggs.push(agg.clone());
                indices_usize.push(idata.value as usize);
                if let Ok(ty) = Type::sub_type(agg.ty(), index) {
                    agg = Exp::havoc(ty);
                } else {
                    return Ok(Exp::havoc(data.agg.ty()));
                }
            }
            _ => {
                // Early stop
                value = Exp::insert_value(agg, value, Vec::from(indices))
                    .or_else(|panic| panic.into())?;
                may_fold = false;
                break;
            }
        }
    }
    while let Some(agg) = aggs.pop() {
        let index = indices_usize.pop().unwrap();
        value = insert_value_once(agg, index, value);
    }

    if may_fold {
        exec(value, mode)
    } else {
        Ok(value)
    }
}

#[doc(hidden)]
fn insert_value_once(agg: Rc<Exp>, index: usize, value: Rc<Exp>) -> Rc<Exp> {
    match &*agg {
        Exp::Tuple(data) => {
            let mut fields = data.fields.clone();
            *fields.get_mut(index).unwrap() = value;
            Exp::tuple(fields, type_as_kind!(data.ty, Type::Tuple).packed)
        }
        Exp::Vector(data) => {
            let mut elems = data.elems.clone();
            *elems.get_mut(index).unwrap() = value;
            Exp::vector(data.ty.clone(), elems).unwrap()
        }
        Exp::Havoc(data) => match &*data.ty {
            Type::Array(kind) => {
                let elems: Vec<Rc<Exp>> = (0..kind.len)
                    .map(|idx| {
                        if idx == index {
                            value.clone()
                        } else {
                            Exp::havoc(kind.elem_ty.clone())
                        }
                    })
                    .collect();
                Exp::vector(data.ty.clone(), elems).unwrap()
            }
            Type::Tuple(kind) => {
                let fields: Vec<Rc<Exp>> = kind
                    .fields
                    .iter()
                    .enumerate()
                    .map(|(idx, ty)| {
                        if idx == index {
                            value.clone()
                        } else {
                            Exp::havoc(ty.clone())
                        }
                    })
                    .collect();
                Exp::tuple(fields, kind.packed)
            }
            _ => unreachable!(),
        },
        _ => unreachable!(),
    }
}

/// **`Effect`s produced**: none.
fn exec_not(mode: &mut ExecMode, data: &exp_data::NotData, exp: &Rc<Exp>) -> ExecResult {
    let value = exec(data.value.clone(), mode)?;

    match exp_as_bool!(value) {
        Some(true) => return Ok(Exp::false_exp()),
        Some(false) => return Ok(Exp::true_exp()),
        None => match value.as_ref() {
            // Try to simplify logical expressions
            Exp::Compare(data) => {
                return Ok(match data.op {
                    op::CompareOp::Ult => {
                        Exp::compare(op::CompareOp::Uge, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Ule => {
                        Exp::compare(op::CompareOp::Ugt, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Ugt => {
                        Exp::compare(op::CompareOp::Ule, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Uge => {
                        Exp::compare(op::CompareOp::Ult, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Slt => {
                        Exp::compare(op::CompareOp::Sge, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Sle => {
                        Exp::compare(op::CompareOp::Sgt, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Sgt => {
                        Exp::compare(op::CompareOp::Sle, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Sge => {
                        Exp::compare(op::CompareOp::Slt, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Eq => {
                        Exp::compare(op::CompareOp::Neq, data.lhs.clone(), data.rhs.clone())
                            .unwrap()
                    }
                    op::CompareOp::Neq => {
                        Exp::compare(op::CompareOp::Eq, data.lhs.clone(), data.rhs.clone()).unwrap()
                    }
                })
            }
            Exp::Not(data) => return Ok(data.value.clone()),
            _ => {}
        },
    }
    Ok(match &*value {
        // Havoc propagation
        Exp::Havoc(_) | Exp::Ident(_) => value.clone(),
        _ => {
            if Rc::ptr_eq(&value, &data.value) {
                exp.clone()
            } else {
                Exp::not(value).or_else(|panic| panic.into())?
            }
        }
    })
}

/// **`Effect`s produced**:
/// * `Specialize`, if the indices are not both `Exp::IntLiteral`s.
fn exec_range(mode: &mut ExecMode, data: &exp_data::RangeData, exp: &Rc<Exp>) -> ExecResult {
    let list = exec(data.vector.clone(), mode)?;
    let mut stale = Rc::ptr_eq(&list, &data.vector);
    let start = if let Some(start) = &data.start {
        let exp = exec(start.clone(), &mut mode_to_spec!(mode))?;
        stale = stale && Rc::ptr_eq(&exp, start);
        Some(exp_as_data!(exp, Exp::IntLiteral).value as usize)
    } else {
        None
    };
    let end = if let Some(end) = &data.end {
        let exp = exec(end.clone(), &mut mode_to_spec!(mode))?;
        stale = stale && Rc::ptr_eq(&exp, end);
        Some(exp_as_data!(exp, Exp::IntLiteral).value as usize)
    } else {
        None
    };

    match &*list {
        Exp::Vector(vdata) => {
            let len = vdata.elems.len() as usize;
            let start = start.unwrap_or(0);
            let end = end.unwrap_or(len);
            if start <= end && start <= len && end <= len {
                Exp::vector(list.ty(), Vec::from(&vdata.elems[start..end]))
                    .or_else(|panic| panic.into())
            } else {
                Ok(Exp::havoc(list.ty()))
            }
        }
        Exp::Havoc(_) | Exp::Ident(_) => Ok(Exp::havoc(list.ty())),
        _ => {
            if stale {
                Ok(exp.clone())
            } else {
                let start = start.map(|v| Exp::int_literal(v as i64, None).unwrap());
                let end = end.map(|v| Exp::int_literal(v as i64, None).unwrap());
                Ok(Exp::range(list, start, end).unwrap())
            }
        }
    }
}

/// **`Effect`s produced**: none.
///
/// Note that the execution mode when executing the fields of an
/// `Exp::Struct` is downgraded to `Exec` at most - it is never
/// necessary to `Specialize` on the `Exp::Struct` as a whole.
fn exec_struct(mode: &mut ExecMode, data: &exp_data::TupleData, _: &Rc<Exp>) -> ExecResult {
    let fields = data
        .fields
        .iter()
        .map(|f| exec(f.clone(), &mut mode_to_exec!(mode)))
        .collect::<Result<Vec<_>, _>>()?;

    Ok(if fields.iter().all(|f| exp_is_kind!(*f, Exp::Havoc)) {
        // Fold as one Havoc
        Exp::havoc(data.ty.clone())
    } else {
        Exp::tuple(fields, type_as_kind!(data.ty, Type::Tuple).packed)
    })
}

/// **`Effect`s produced**: none.
///
/// Like `exec_struct()`, the execution mode when executing the elements
/// are also downgraded to `Exec` at most.
fn exec_vector(mode: &mut ExecMode, data: &exp_data::VectorData, _: &Rc<Exp>) -> ExecResult {
    let elems: Vec<Rc<Exp>> = data
        .elems
        .iter()
        .map(|e| exec(e.clone(), &mut mode_to_exec!(mode)))
        .collect::<Result<Vec<_>, _>>()?;

    Ok(
        if type_is_kind!(data.ty, Type::Array) && elems.iter().all(|e| exp_is_kind!(*e, Exp::Havoc))
        {
            // Fold as one Havoc
            Exp::havoc(data.ty.clone())
        } else {
            Exp::vector(data.ty.clone(), elems).or_else(|panic| panic.into())?
        },
    )
}

/// **`Effect`s produced**: none.
fn exec_alloca(mode: &mut ExecMode, data: &exp_data::AllocaData, exp: &Rc<Exp>) -> ExecResult {
    let Some(See { mstate, sman, .. }) = see!(mode) else {
        return Ok(exp.clone());
    };
    let desc = mstate
        .alloc_stack(
            data.alloca_ty.clone(),
            data.func_name.clone(),
            data.alloc_name.clone(),
            sman.recursive_count(&data.func_name) - 1,
        )
        .or_else(|panic| panic.into())?;
    Ok(Exp::pointer_literal(desc))
}

/// **`Effect`s produced**:
/// * `Specialize`, if the pointer is `Symbolic` (not for `SymbolicPtr`).
/// * `Panic`, if the pointer is `Null`.
fn exec_load(mode: &mut ExecMode, data: &exp_data::LoadData, _: &Rc<Exp>) -> ExecResult {
    // `Specialize` on the load position
    let ptr = exec(data.ptr.clone(), &mut mode_to_spec!(mode))?;

    let Some(see) = see!(mode) else {
        return Exp::load(data.ty.clone(), ptr).or_else(|panic| panic.into());
    };
    let mdesc = ptr_to_desc!(
        see,
        ptr,
        {
            let err = SeError::PtrNull {
                ptr: data.ptr.clone(),
            };
            see.sman.panic(err.to_string(), &mut see.traces);
            return Err(err);
        },
        return Exp::load(data.ty.clone(), ptr).or_else(|panic| panic.into())
    );
    match see
        .mstate
        .load(data.ty.clone(), &mdesc, Some(&mut see.sman))
    {
        Err(SeError::Panic(panic)) => Err(SeError::Panic(panic)),
        Err(err) => {
            produce_panic_if!(see.sman, &mut see.traces, true, err)?;
            unreachable!()
        }
        Ok(loaded) => exec(loaded, mode),
    }
}

/// **`Effect`s produced**:
/// * `Specialize`, if the pointer is `Symbolic`.
/// * `Panic`, if the pointer is `Null`, out-of-scope, or readonly.
/// * `Store`, if the pointer points to a non-local memory location.
fn exec_store(mode: &mut ExecMode, data: &exp_data::StoreData, _: &Rc<Exp>) -> ExecResult {
    // `Specialize` on the store position
    let ptr = exec(data.ptr.clone(), &mut mode_to_spec!(mode))?;
    let value = exec(data.value.clone(), mode)?;

    let Some(see) = see!(mode) else {
        return Exp::store(ptr, value).or_else(|panic| panic.into());
    };
    let mdesc = ptr_to_desc!(
        see,
        ptr,
        {
            let err = SeError::PtrNull {
                ptr: data.ptr.clone(),
            };
            see.sman.panic(err.to_string(), &mut see.traces);
            return Err(err);
        },
        return Ok(Exp::store(ptr, value).unwrap())
    );

    let see = see!(mode).unwrap();
    match see.mstate.store(&mdesc, value.clone(), false) {
        Err(SeError::Panic(panic)) => Err(SeError::Panic(panic)),
        Err(err) => {
            produce_panic_if!(see.sman, &mut see.traces, true, err)?;
            unreachable!()
        }
        Ok(_) => Ok(Exp::none()),
    }
}

/// **`Effect`s produced**: none.
fn exec_var(mode: &mut ExecMode, data: &exp_data::VarData, exp: &Rc<Exp>) -> ExecResult {
    let var_ty = data.ty.clone();

    let See { vstate, .. } = see!(mode).unwrap();
    let Some(vexp) = vstate.get(&data.desc) else {
        throw_panic!("{exp} is not registered");
    };
    if !type_eq!(vexp.ty(), var_ty) {
        throw_type_mismatch!(vexp.ty(), var_ty);
    } else {
        exec(vexp, mode)
    }
}

/// **`Effect`s produced**:
/// * `Specialize`, if the pointer is `Symbolic`.
/// * `Specialize`, if the index is not constant.
fn exec_get_ptr(mode: &mut ExecMode, data: &exp_data::GetPtrData, _: &Rc<Exp>) -> ExecResult {
    // `Specialize` on the base pointer
    let ptr = exec(data.ptr.clone(), &mut mode_to_spec!(mode))?;
    // `Specialize` on the index
    let index = exec(data.index.clone(), &mut mode_to_spec!(mode))?;

    let Some(see) = see!(mode) else {
        return Exp::get_ptr(data.btype.clone(), ptr, index, data.inbounds)
            .or_else(|panic| panic.into());
    };
    let idx = exp_as_data!(index, Exp::IntLiteral).value as isize;

    if exp_is_kind!(ptr, Exp::Null) {
        if idx == 0 {
            // GetPtr(null, 0) yields null
            return Ok(Exp::null());
        } else {
            // GetPtr(null, nonzero) yields havoc
            return Ok(Exp::havoc(Type::mk_pointer()));
        }
    }

    if exp_is_kind!(ptr, Exp::BitCast) {
        if idx == 0 {
            return Ok(ptr);
        }
    }

    let mdesc = ptr_to_desc!(
        see,
        ptr,
        return Ok(Exp::havoc(Type::mk_pointer())),
        return Exp::get_ptr(data.btype.clone(), ptr, index, data.inbounds)
            .or_else(|panic| panic.into())
    );

    let result = if data.inbounds {
        see.mstate.get_ptr(data.btype.clone(), &mdesc, idx)
    } else {
        see.mstate
            .get_ptr_unbounded(data.btype.clone(), &mdesc, idx)
    };
    let desc = match result {
        Err(SeError::Panic(panic)) => return Err(SeError::Panic(panic)),
        Err(_) => {
            // GetPtr (out-of-bounds) produces havoc
            return Ok(Exp::havoc(Type::mk_pointer()));
        }
        Ok(desc) => desc,
    };

    // ..make it symbolic
    if exp_is_kind!(ptr, Exp::SymbolicPtr) {
        let actual = see.mstate.region_of(&desc);
        let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())
            .or_else(|panic| panic.into())?;
        Ok(Exp::symbolic_ptr(
            sdesc,
            see.mstate.layout_of(actual),
            desc.offset(),
        ))
    } else {
        Ok(Exp::pointer_literal(desc))
    }
}

/// **`Effect`s produced**:
/// * `Specialize`, if the pointer is `Symbolic`.
/// * `Specialize`, if the index is not constant.
fn exec_get_elem_ptr(
    mode: &mut ExecMode,
    data: &exp_data::GetElemPtrData,
    _: &Rc<Exp>,
) -> ExecResult {
    // `Specialize` on the base pointer
    let ptr = exec(data.ptr.clone(), &mut mode_to_spec!(mode))?;
    // `Specialize` on the index
    let index = exec(data.index.clone(), &mut mode_to_spec!(mode))?;

    let Some(see) = see!(mode) else {
        return Exp::get_elem_ptr(data.btype.clone(), ptr, index, data.inbounds)
            .or_else(|panic| panic.into());
    };
    let idx = exp_as_data!(index, Exp::IntLiteral).value as usize;
    if exp_is_kind!(ptr, Exp::Null) {
        if idx == 0 {
            // GetElemPtr(null, 0) yields null
            return Ok(Exp::null());
        } else {
            // GetElemPtr(null, nonzero) yields havoc
            return Ok(Exp::havoc(Type::mk_pointer()));
        }
    }

    if exp_is_kind!(ptr, Exp::BitCast) {
        if idx == 0 {
            return Ok(ptr);
        }
    }

    let mdesc = ptr_to_desc!(
        see,
        ptr,
        return Ok(Exp::havoc(Type::mk_pointer())),
        return Exp::get_elem_ptr(data.btype.clone(), ptr, index, data.inbounds)
            .or_else(|panic| panic.into())
    );

    let result = if data.inbounds {
        see.mstate.get_elem_ptr(data.btype.clone(), &mdesc, idx)
    } else {
        see.mstate
            .get_elem_ptr_unbounded(data.btype.clone(), &mdesc, idx)
    };
    let desc = match result {
        Err(SeError::Panic(panic)) => return Err(SeError::Panic(panic)),
        Err(_) => {
            // GetElemPtr (out-of-bounds) produces havoc
            return Ok(Exp::havoc(Type::mk_pointer()));
        }
        Ok(desc) => desc,
    };

    // ..make it symbolic
    if exp_is_kind!(ptr, Exp::SymbolicPtr) {
        let actual = see.mstate.region_of(&desc);
        let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())
            .or_else(|panic| panic.into())?;
        Ok(Exp::symbolic_ptr(
            sdesc,
            see.mstate.layout_of(actual),
            desc.offset(),
        ))
    } else {
        Ok(Exp::pointer_literal(desc))
    }
}

/// **`Effect`s produced**:
/// * `Specialize`, if in the `ExecMode::Spec` mode.
///
/// Note that in the `ExecMode::Exec` mode, the execution will also yield the
/// specialized value, if `exp` has already been `Specialize`-d (or its `Scope` doesn't
/// match the current builder's `Scope`). However, in this case no `Effect` is produced.
fn exec_symbolic(mode: &mut ExecMode, data: &exp_data::SymbolicData, exp: &Rc<Exp>) -> ExecResult {
    let is_spec = matches!(mode, ExecMode::Spec(_));
    let Some(see) = see!(mode) else {
        return Ok(exp.clone());
    };

    match (is_spec, see.sman.symbolic_state(&data.desc)) {
        (_, SymbolicState::Referral) => {
            let concretized = data.desc.concretize(data.ty.clone(), see);
            if Rc::ptr_eq(&concretized, exp) {
                // Truly symbolic values concretize to themselves..
                if is_spec {
                    throw_panic!("truly symbolic {concretized} is WIP")
                } else {
                    Ok(exp.clone())
                }
            } else {
                exec(concretized, mode)
            }
        }

        (_, SymbolicState::Specialized(_, spec)) => exec(spec.clone(), mode),

        (false, SymbolicState::Symbolic(_)) => Ok(exp.clone()),

        (true, SymbolicState::Symbolic(spec)) => {
            let mut spec = exec(spec.clone(), &mut ExecMode::Spec(see))?;

            // Try assigning a symbolic region
            let raw_parts = match spec.as_ref() {
                Exp::PointerLiteral(vdata) => {
                    Some((see.mstate.region_of(&vdata.desc), vdata.desc.offset()))
                }
                Exp::SymbolicPtr(vdata) => Some((
                    SymbolicRegionDesc::concretize(
                        &mut see.sman,
                        vdata.region.scope(),
                        vdata.region.symbolic(),
                    )
                    .get(see.traces()),
                    vdata.offset,
                )),
                _ => None,
            };
            if let Some((region, node)) = raw_parts {
                if !region.is_global() {
                    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, region.clone())
                        .or_else(|panic| panic.into())?;
                    spec = Exp::symbolic_ptr(sdesc, see.mstate.layout_of(region), node);
                }
            }

            /* Only produce `Specialize` if the dependency is in the current scope */
            if data.desc.scope() == see.sman().current_scope().unwrap().as_ref() {
                see.sman.specialize(
                    &mut see.solver,
                    &mut see.mstate,
                    exp.clone(),
                    spec.clone(),
                    &mut see.traces,
                )?;
            }
            Ok(spec)
        }
    }
}

/// **`Effect`s produced**: none.
///
/// Note: executing an `Exp::SymbolicPtr` will trans-scope it into the
/// current summary's scope.
fn exec_symbolic_ptr(
    mode: &mut ExecMode,
    data: &exp_data::SymbolicPtrData,
    exp: &Rc<Exp>,
) -> ExecResult {
    let Some(see) = see!(mode) else {
        return Ok(exp.clone());
    };

    if data.region.scope() == see.sman.current_scope().unwrap().as_ref() {
        // In the same scope
        Ok(exp.clone())
    } else {
        // From a different scope
        let Ok(actual) = SymbolicRegionDesc::concretize(
            &mut see.sman,
            data.region.scope(),
            data.region.symbolic(),
        ) else {
            return Ok(Exp::havoc(Type::mk_pointer()));
        };
        let region =
            SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone()).get(see.traces());
        Ok(Exp::symbolic_ptr(
            region,
            see.mstate.layout_of(actual),
            data.offset,
        ))
    }
}

pub(crate) use strip_bitcast;

#[cfg(test)]
mod tests {
    use super::*;
    use crate::middleend::se::MemoryState;
    use crate::panic::Panicable;

    fn init_log() {
        let _ = env_logger::builder()
            .format_timestamp(None)
            .is_test(true)
            .try_init();
    }

    /// Test `Exp::Arith`, `Exp::Boolean`, `Exp::Compare`, `Exp::Ext` and `Exp::Not`
    /// evalution.
    #[test]
    fn exec_arith_basic() -> Panicable<()> {
        init_log();

        /* ((((127_i8 - -128_i8) sext to i32) < ((not false) zext to i32)) || havoc)  == true */
        let exp1 = Exp::int_literal(127, Some(8))?;
        let exp2 = Exp::int_literal(-128, Some(8))?;
        let exp = Exp::arith(op::ArithOp::Sub, exp1, exp2)?;
        let ty = Type::mk_bitvec(32);
        let exp1 = Exp::ext(op::ExtOp::Sext, ty.clone(), exp)?;

        let exp = Exp::false_exp();
        let exp = Exp::not(exp)?;
        let exp2 = Exp::ext(op::ExtOp::Zext, ty, exp)?;

        let exp = Exp::compare(op::CompareOp::Slt, exp1, exp2)?;
        let ty = Type::mk_bool();
        let havoc = Exp::havoc(ty);
        let exp = Exp::boolean(op::BoolOp::Or, exp, havoc)?;

        let res = exec(exp.clone(), &mut ExecMode::Eval).unwrap();
        let ans = Exp::true_exp();
        assert_eq!(res.eq(&ans), ExpOrdering::Eq);
        Ok(())
    }

    #[test]
    fn exec_arith_bits() -> Panicable<()> {
        init_log();

        /* ~x+~y+1 == ~(x+y) */

        let x = 123;
        let y = -456;
        let x_plus_y = x + y;

        let exp1 = Exp::int_literal(x, Some(32))?;
        let exp2 = Exp::int_literal(y, Some(32))?;
        let exp_sum = Exp::int_literal(x_plus_y, Some(32))?;
        let ones = Exp::int_literal(-1, Some(32))?;
        let one = Exp::int_literal(1, Some(32))?;

        let exp1 = Exp::arith(op::ArithOp::Xor, exp1, ones.clone())?;
        let exp2 = Exp::arith(op::ArithOp::Xor, exp2, ones.clone())?;
        let exp = Exp::arith(op::ArithOp::Add, exp1, exp2)?;
        let exp = Exp::arith(op::ArithOp::Add, exp, one)?;
        let exp = Exp::arith(op::ArithOp::Xor, exp, ones)?;

        let res = exec(exp.clone(), &mut ExecMode::Eval).unwrap();
        assert_eq!(res.eq(&exp_sum), ExpOrdering::Eq);
        Ok(())
    }

    #[test]
    fn exec_arith_mul_div() -> Panicable<()> {
        init_log();

        /* Integer division optimization trick. */
        let dividend = Exp::int_literal(99999, Some(32))?;
        let imm = Exp::int_literal(0xAAAAAAAB_u32 as i32 as i64, Some(32))?;
        let shamt = Exp::int_literal(33, Some(64))?;
        let divider = Exp::int_literal(3, Some(32))?;
        let ans = Exp::arith(op::ArithOp::Sdiv, dividend.clone(), divider)?;

        let ty = Type::mk_bitvec(64);
        let exp1 = Exp::ext(op::ExtOp::Zext, ty.clone(), dividend)?;
        let exp2 = Exp::ext(op::ExtOp::Zext, ty.clone(), imm)?;
        let exp = Exp::arith(op::ArithOp::Mul, exp1, exp2)?;
        let exp = Exp::arith(op::ArithOp::Lshr, exp, shamt)?;
        let exp = Exp::ext(op::ExtOp::Trunc, ans.ty(), exp)?;

        let res = exec(exp.clone(), &mut ExecMode::Eval).unwrap();
        let ans = exec(ans.clone(), &mut ExecMode::Eval).unwrap();
        assert_eq!(res.eq(&ans), ExpOrdering::Eq);
        Ok(())
    }

    // Test that `Exp::BitCast`s are correctly stripped.
    #[test]
    fn exec_pointer_bitcast() -> Panicable<()> {
        init_log();
        let mstate = &mut MemoryState::new();

        let ty2 = Type::mk_bool();
        let pty = Type::mk_pointer();
        let desc = mstate.alloc_stack(ty2.clone(), "Test".into(), "0".into(), 0)?;

        let null = Exp::null();
        let zero = Exp::int_literal(0, Some(TYPE_POINTER_WIDTH))?;
        let nonnull = Exp::pointer_literal(desc);

        let null_casted = Exp::bitcast(pty.clone(), null)?;
        let nonnull_casted = Exp::bitcast(pty.clone(), nonnull)?;
        let zero_casted = Exp::bitcast(pty.clone(), zero.clone())?;

        let null_eval = exec(null_casted.clone(), &mut ExecMode::Eval).unwrap();
        let nonnull_eval = exec(nonnull_casted.clone(), &mut ExecMode::Eval).unwrap();
        let zero_eval = exec(zero_casted.clone(), &mut ExecMode::Eval).unwrap();

        assert_eq!(null_eval.eq(&nonnull_eval), ExpOrdering::Neq);
        assert_eq!(null_eval.eq(&zero_eval), ExpOrdering::Eq);

        // Caveat: `ExpOrd::eq` does not strip bitcasts, so
        // the following will be `Unsure`, while `Exp::compare` should
        // evaluate it to be `Neq`.
        let should_be_non_zero =
            exec(Exp::bitcast(zero.ty(), nonnull_eval)?, &mut ExecMode::Eval).unwrap();
        assert_eq!(should_be_non_zero.eq(&zero), ExpOrdering::Unsure);

        let havoc = Exp::havoc(pty.clone());
        let should_be_havoc = Exp::bitcast(pty.clone(), havoc)?;
        let ans = Exp::havoc(pty.clone());
        assert_eq!(
            exec(should_be_havoc, &mut ExecMode::Eval).unwrap().eq(&ans),
            ExpOrdering::Eq
        );

        Ok(())
    }

    #[test]
    fn exec_pointer_compare() -> Panicable<()> {
        init_log();
        let mstate = &mut MemoryState::new();

        let ty1 = Type::mk_bitvec(32);
        let desc = mstate.alloc_stack(ty1, "Test".into(), "0".into(), 0)?;

        let zero = Exp::int_literal(0, Some(TYPE_POINTER_WIDTH))?;
        let nonnull = Exp::pointer_literal(desc);

        let should_be_non_zero = Exp::bitcast(zero.ty(), nonnull)?;
        let comp = Exp::compare(op::CompareOp::Ult, zero, should_be_non_zero)?;
        let true_exp = Exp::true_exp();

        assert_eq!(
            exec(comp, &mut ExecMode::Eval).unwrap().eq(&true_exp),
            ExpOrdering::Eq
        );
        Ok(())
    }

    /// Test evaluation of `Exp::Struct`.
    #[test]
    fn exec_struct() -> Panicable<()> {
        init_log();

        let node_ty = typ!({ i32, ptr });
        Type::bind("ListNode".into(), node_ty.clone()).unwrap();

        let exp1 = Exp::int_literal(-3, Some(32))?;
        let exp2 = Exp::int_literal(4, Some(32))?;
        let data = Exp::arith(op::ArithOp::Srem, exp1, exp2.clone())?;
        let ity = Type::mk_bitvec(2);
        let ptr = Exp::ext(op::ExtOp::Trunc, ity, exp2)?;
        let ity = Type::mk_bitvec(TYPE_POINTER_WIDTH);
        let pty = Type::mk_pointer();
        let ptr = Exp::ext(op::ExtOp::Sext, ity.clone(), ptr)?;
        let ptr = Exp::bitcast(pty.clone(), ptr)?;
        let node = Exp::tuple(vec![data, ptr], false);

        let ans_data = Exp::int_literal(-3, Some(32))?;
        let ans_ptr = Exp::null();
        let ans = Exp::tuple(vec![ans_data, ans_ptr], false);

        assert_eq!(
            exec(node, &mut ExecMode::Eval).unwrap().eq(&ans),
            ExpOrdering::Eq
        );

        // Also test Havoc folding
        let havoc = Exp::havoc(ity.clone());
        let verbose = Exp::havoc(node_ty.clone());
        let verbose = Exp::tuple(vec![havoc, verbose], false);
        let folded = Exp::havoc(verbose.ty());

        assert_eq!(
            exec(verbose, &mut ExecMode::Eval).unwrap().eq(&folded),
            ExpOrdering::Eq
        );
        Ok(())
    }

    /// Test evaluation of `Exp::Vector`.
    #[test]
    fn exec_vector() -> Panicable<()> {
        init_log();

        let bool_ty = Type::mk_bool();
        let havoc = Exp::havoc(bool_ty.clone());
        let exp1 = Exp::int_literal(-128, Some(8))?;
        let exp2 = Exp::int_literal(127, Some(8))?;
        let exp = Exp::compare(op::CompareOp::Ugt, exp1, exp2)?;
        let exp = Exp::boolean(op::BoolOp::And, exp, havoc.clone())?;

        let array_ty = Type::mk_array(2, bool_ty.clone());
        let vector = Exp::vector(array_ty, vec![exp, havoc])?;
        let should_be_havoc = Exp::havoc(vector.ty());

        assert_eq!(
            exec(vector, &mut ExecMode::Eval)
                .unwrap()
                .eq(&should_be_havoc),
            ExpOrdering::Eq
        );
        Ok(())
    }

    /// Test evaluation of `Exp::ExtractValue` and `Exp::InsertValue`.
    #[test]
    fn exec_insert_extract() -> Panicable<()> {
        init_log();

        let ty = Type::mk_bitvec(8);
        let array_ty = Type::mk_array(4, ty.clone());
        let tuple_ty = Type::mk_tuple(vec![ty.clone(), array_ty.clone()]);

        let havoc = Exp::havoc(tuple_ty.clone());

        // <1>
        let index1 = Exp::int_literal(1, None)?;
        let index2 = Exp::int_literal(3, None)?;
        let should_be_havoc =
            Exp::extract_value(havoc.clone(), vec![index1.clone(), index2.clone()])?;
        assert!(exp_is_kind!(
            exec(should_be_havoc.clone(), &mut ExecMode::Eval).unwrap(),
            Exp::Havoc
        ));

        // <2>
        let value = Exp::int_literal(0x20, Some(8))?;
        let inserted = Exp::insert_value(
            havoc.clone(),
            value.clone(),
            vec![index1.clone(), index2.clone()],
        )?;
        let extracted = Exp::extract_value(inserted.clone(), vec![index1.clone(), index2.clone()])?;
        assert_eq!(
            exec(extracted, &mut ExecMode::Eval).unwrap().eq(&value),
            ExpOrdering::Eq
        );

        // <3>
        let overwritten = Exp::insert_value(
            inserted.clone(),
            should_be_havoc,
            vec![index1.clone(), index2.clone()],
        )?;
        assert_eq!(
            exec(overwritten, &mut ExecMode::Eval).unwrap().eq(&havoc),
            ExpOrdering::Eq
        );
        Ok(())
    }

    /// Test evaluation of `Exp::Index` and `Exp::Range`.
    #[test]
    fn exec_index_range() -> Panicable<()> {
        init_log();

        let elems = vec![
            Exp::int_literal(1, None)?,
            Exp::int_literal(2, None)?,
            Exp::int_literal(3, None)?,
        ];
        let elem_ty = Type::mk_int();
        let list_ty = Type::mk_list(elem_ty.clone());
        let list = Exp::vector(list_ty, elems)?;

        let index = Exp::int_literal(0, None)?;
        let end = Exp::int_literal(1, None)?;
        let indexed = Exp::index(list.clone(), index.clone())?;
        let range = Exp::range(list, Some(indexed), Some(end))?;
        let should_be_havoc = Exp::index(range, index.clone())?;

        let havoc = Exp::havoc(elem_ty);
        assert_eq!(
            exec(should_be_havoc, &mut ExecMode::Eval)
                .unwrap()
                .eq(&havoc),
            ExpOrdering::Eq
        );
        Ok(())
    }
}
