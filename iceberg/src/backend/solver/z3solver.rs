//! Solver using the z3 implementation.

use super::{CheckResult, SolverImpl};
use crate::middleend::*;
use crate::panic::*;
use by_address::ByAddress;
use std::collections::HashSet;
use std::ops::*;
use std::rc::Rc;
use z3::ast::{Ast, Bool, Dynamic, Int, BV};

/// The z3 implementation of a backend solver.
pub struct Z3Solver {
    /// Z3 context.
    ctx: *const z3::Context,
    /// Z3 solver.
    solver: z3::Solver<'static>,

    /// Tracks all dependent `SymbolicDescs` that has been included in the path constraints
    /// at least once.
    deps: HashSet<State>,
    /// Event stacks for tracking dependencies.
    events: Vec<SolverEvent>,
}

type State = ByAddress<Rc<SymbolicDesc>>;

enum SolverEvent {
    Push,
    Depend(State),
}

thread_local! {
    pub static Z3_CTX: z3::Context = {
        let cfg = z3::Config::new();
        z3::Context::new(&cfg)
    }
}

impl Z3Solver {
    pub fn new() -> Z3Solver {
        // `with` will initialize `Z3_CTX`, if this is the first invocation
        let ptr = Z3_CTX.with(|it| it as *const z3::Context);
        // Unfortunately using `unsafe`, because of `z3_sys` API requires a reference...
        let ctx = unsafe { &*ptr };

        let solver = z3::Solver::new(ctx);
        Z3Solver {
            ctx: ptr,
            solver,
            deps: HashSet::new(),
            events: vec![],
        }
    }

    fn ctx(&self) -> &'static z3::Context {
        unsafe { &*self.ctx }
    }

    fn interpret(
        &mut self,
        exp: Rc<Exp>,
        is_bool: bool,
        mstate: &MemoryState,
    ) -> Panicable<Dynamic<'static>> {
        let ty = exp.ty();
        match exp.as_ref() {
            Exp::Arith(data) => match ty.as_ref() {
                Type::BitVec(_) => {
                    if is_bool {
                        let lhs = Bool::try_from(self.interpret(data.lhs.clone(), true, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let rhs = Bool::try_from(self.interpret(data.rhs.clone(), true, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let op_result: Bool<'_>;
                        match data.op {
                            op::ArithOp::And => op_result = Bool::and(self.ctx(), &[&lhs, &rhs]),
                            op::ArithOp::Or => op_result = Bool::or(self.ctx(), &[&lhs, &rhs]),
                            op::ArithOp::Xor => op_result = lhs.xor(&rhs),
                            _ => todo!("{} not implemented for Bool", data.op),
                        }
                        Ok(Dynamic::from(op_result))
                    } else {
                        let lhs = BV::try_from(self.interpret(data.lhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let rhs = BV::try_from(self.interpret(data.rhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let op_result: BV<'_>;
                        match data.op {
                            op::ArithOp::Add => op_result = lhs.bvadd(&rhs),
                            op::ArithOp::Sub => op_result = lhs.bvsub(&rhs),
                            op::ArithOp::And => op_result = lhs.bvand(&rhs),
                            op::ArithOp::Or => op_result = lhs.bvor(&rhs),
                            op::ArithOp::Xor => op_result = lhs.bvxor(&rhs),
                            op::ArithOp::Lshr => op_result = lhs.bvlshr(&rhs),
                            op::ArithOp::Ashr => op_result = lhs.bvashr(&rhs),
                            op::ArithOp::Shl => op_result = lhs.bvshl(&rhs),
                            op::ArithOp::Mul => op_result = lhs.bvmul(&rhs),
                            op::ArithOp::Sdiv => op_result = lhs.bvsdiv(&rhs),
                            op::ArithOp::Udiv => op_result = lhs.bvudiv(&rhs),
                            op::ArithOp::Srem => op_result = lhs.bvsrem(&rhs),
                            op::ArithOp::Urem => op_result = lhs.bvurem(&rhs),
                        }
                        Ok(Dynamic::from(op_result))
                    }
                }
                Type::Int(_) => {
                    let lhs = Int::try_from(self.interpret(data.lhs.clone(), false, mstate)?)
                        .map_err(|err| make_panic!("{err}"))?;
                    let rhs = Int::try_from(self.interpret(data.rhs.clone(), false, mstate)?)
                        .map_err(|err| make_panic!("{err}"))?;
                    let op_result: Int<'_>;
                    match data.op {
                        op::ArithOp::Add => op_result = lhs.add(rhs),
                        op::ArithOp::Sub => op_result = lhs.sub(rhs),
                        op::ArithOp::Mul => op_result = lhs.mul(rhs),
                        op::ArithOp::Sdiv => op_result = lhs.div(rhs),
                        op::ArithOp::Srem => op_result = lhs.rem(rhs),
                        _ => throw_panic!("{} is not supported on type {}", data.op, ty),
                    }
                    Ok(Dynamic::from(op_result))
                }
                _ => unreachable!(),
            },
            Exp::Boolean(data) => {
                let lhs = Bool::try_from(self.interpret(data.lhs.clone(), true, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                let rhs = Bool::try_from(self.interpret(data.rhs.clone(), true, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                let op_result: Bool<'_>;
                match data.op {
                    op::BoolOp::And => op_result = Bool::and(self.ctx(), &[&lhs, &rhs]),
                    op::BoolOp::Or => op_result = Bool::or(self.ctx(), &[&lhs, &rhs]),
                }
                Ok(Dynamic::from(op_result))
            }
            Exp::Compare(data) => {
                let op_result: Bool<'_>;
                match data.lhs.ty().as_ref() {
                    Type::BitVec(_) | Type::Pointer(_) => {
                        let lhs = BV::try_from(self.interpret(data.lhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let rhs = BV::try_from(self.interpret(data.rhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        match data.op {
                            op::CompareOp::Eq => op_result = lhs._eq(&rhs),
                            op::CompareOp::Neq => op_result = lhs._eq(&rhs).not(),
                            op::CompareOp::Ult => op_result = lhs.bvult(&rhs),
                            op::CompareOp::Ule => op_result = lhs.bvule(&rhs),
                            op::CompareOp::Ugt => op_result = lhs.bvugt(&rhs),
                            op::CompareOp::Uge => op_result = lhs.bvuge(&rhs),
                            op::CompareOp::Slt => op_result = lhs.bvslt(&rhs),
                            op::CompareOp::Sle => op_result = lhs.bvsle(&rhs),
                            op::CompareOp::Sgt => op_result = lhs.bvsgt(&rhs),
                            op::CompareOp::Sge => op_result = lhs.bvsge(&rhs),
                        }
                    }
                    Type::Int(_) | Type::Enum(_) => {
                        let lhs = Int::try_from(self.interpret(data.lhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        let rhs = Int::try_from(self.interpret(data.rhs.clone(), false, mstate)?)
                            .map_err(|err| make_panic!("{err}"))?;
                        match data.op {
                            op::CompareOp::Eq => op_result = lhs._eq(&rhs),
                            op::CompareOp::Neq => op_result = lhs._eq(&rhs).not(),
                            op::CompareOp::Slt => op_result = lhs.lt(&rhs),
                            op::CompareOp::Sle => op_result = lhs.le(&rhs),
                            op::CompareOp::Sgt => op_result = lhs.gt(&rhs),
                            op::CompareOp::Sge => op_result = lhs.ge(&rhs),
                            _ => throw_panic!(
                                "{} is not supported on type {}",
                                data.op,
                                data.lhs.ty()
                            ),
                        }
                    }
                    _ => unreachable!(),
                }
                if is_bool {
                    Ok(Dynamic::from(op_result))
                } else {
                    // Use ITE to encode Bool-to-BV
                    Ok(Dynamic::from(op_result.ite(
                        &BV::from_i64(self.ctx(), 1, 1),
                        &BV::from_i64(self.ctx(), 0, 1),
                    )))
                }
            }
            Exp::EnumLiteral(data) => {
                // Use the ID of `EnumLiteral` as its backend encoding
                let int = Int::from_i64(self.ctx(), data.id);
                Ok(Dynamic::from(int))
            }
            Exp::Ext(data) => {
                let bv = BV::try_from(self.interpret(data.value.clone(), false, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                let old_width = type_as_kind!(data.value.ty(), Type::BitVec).width;
                let new_width = type_as_kind!(data.new_ty, Type::BitVec).width;
                let op_result: BV<'_>;
                match data.op {
                    op::ExtOp::Sext => op_result = bv.sign_ext((new_width - old_width) as u32),
                    op::ExtOp::Trunc => op_result = bv.extract(new_width as u32 - 1, 0),
                    op::ExtOp::Zext => op_result = bv.zero_ext((new_width - old_width) as u32),
                }
                Ok(Dynamic::from(op_result))
            }
            Exp::Havoc(_) => throw_panic!("interpretting havoc"),
            Exp::IntLiteral(data) => match data.width {
                /*
                   Unfortunately for integers larger than 64-bit, there isn't a direct constructor
                   in the z3 binding, so we have to use a string..
                */
                #[cfg(feature = "int128")]
                None => Ok(Dynamic::from(
                    Int::from_str(self.ctx(), format!("{}", data.value).as_str()).unwrap(),
                )),
                #[cfg(not(feature = "int128"))]
                None => Ok(Dynamic::from(Int::from_i64(self.ctx(), data.value))),

                Some(w @ 65..=128) => Ok(Dynamic::from(
                    BV::from_str(self.ctx(), w as u32, format!("{}", data.value).as_str()).unwrap(),
                )),
                Some(w @ 2..=64) => Ok(Dynamic::from(BV::from_i64(
                    self.ctx(),
                    data.value as i64,
                    w as u32,
                ))),
                _ => {
                    if is_bool == false {
                        Ok(Dynamic::from(BV::from_i64(
                            self.ctx(),
                            data.value as i64,
                            1,
                        )))
                    } else if data.value == 0 {
                        Ok(Dynamic::from(Bool::from_bool(self.ctx(), false)))
                    } else {
                        Ok(Dynamic::from(Bool::from_bool(self.ctx(), true)))
                    }
                }
            },
            Exp::Not(data) => Ok(Dynamic::from(
                Bool::try_from(self.interpret(data.value.clone(), true, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?
                    .not(),
            )),
            Exp::Symbolic(data) => {
                if !self.deps.contains(&ByAddress(data.desc.clone())) {
                    self.events
                        .push(SolverEvent::Depend(ByAddress(data.desc.clone())));
                    self.deps.insert(ByAddress(data.desc.clone()));
                }
                match data.ty.as_ref() {
                    Type::BitVec(kind) => {
                        if is_bool {
                            assert_or_throw!(kind.width == 1, "expected Bool, found {}", data.ty);
                            Ok(Dynamic::from(Bool::new_const(
                                self.ctx(),
                                format!("{:p}", data.desc),
                            )))
                        } else {
                            Ok(Dynamic::from(BV::new_const(
                                self.ctx(),
                                format!("{:p}", data.desc),
                                kind.width as u32,
                            )))
                        }
                    }
                    Type::Int(_) => Ok(Dynamic::from(Int::new_const(
                        self.ctx(),
                        format!("{:p}", data.desc),
                    ))),
                    // Encode symbolic pointer as BV
                    Type::Pointer(_) => Ok(Dynamic::from(BV::new_const(
                        self.ctx(),
                        format!("{:p}", data.desc),
                        64,
                    ))),
                    _ => throw_panic!("symbolic of type {} is not supported", data.ty),
                }
            }
            Exp::BitCast(data) => self.interpret(data.value.clone(), false, mstate),
            Exp::SymbolicPtr(data) => {
                // Symbolic pointer is encoded as a symbolic is the region + node ID
                let region_const = {
                    let region = BV::new_const(self.ctx(), data.region.to_string(), 31);
                    let ext = region.zero_ext(1);
                    let start = BV::from_i64(self.ctx(), 1, 32);
                    let nonzero = ext.bvadd(&start);
                    nonzero.zero_ext(32)
                };

                let shamt = BV::from_i64(self.ctx(), 32, 64);
                let node = BV::from_i64(self.ctx(), data.offset as i64, 64);
                return Ok(Dynamic::from(region_const.bvshl(&shamt).bvadd(&node)));
            }
            Exp::PointerLiteral(data) => {
                let id = data.desc.backend_repr(mstate);
                let int = BV::from_u64(self.ctx(), id, 64);
                Ok(Dynamic::from(int))
            }
            Exp::Null(_) => {
                // `Null` is encoded as 0w64
                Ok(Dynamic::from(BV::from_i64(self.ctx(), 0, 64)))
            }
            Exp::Ident(_) if type_is_kind!(exp.ty(), Type::Pointer) => {
                // TODO: how do we encode this for comparison correctness?
                Ok(Dynamic::from(BV::from_i64(self.ctx(), -1, 64)))
            }
            _ => throw_panic!("expression {exp} is not supported"),
        }
    }
}

pub type Expr = Dynamic<'static>;
pub type Solver = Z3Solver;

impl SolverImpl for Z3Solver {
    fn push(&mut self) {
        self.solver.push();
        self.events.push(SolverEvent::Push);
    }

    fn pop(&mut self) {
        self.solver.pop(1);
        while let Some(event) = self.events.pop() {
            match event {
                SolverEvent::Push => break,
                SolverEvent::Depend(state) => self.deps.remove(&state),
            };
        }
    }

    fn assert(&mut self, cond: Rc<Exp>, mstate: &MemoryState) -> Panicable<()> {
        let cond = Bool::try_from(self.interpret(cond, true, mstate)?)
            .map_err(|err| make_panic!("{err}"))?;
        self.solver.assert(&cond);
        Ok(())
    }

    fn assert_eq(&mut self, this: Rc<Exp>, that: Rc<Exp>, mstate: &MemoryState) -> Panicable<()> {
        assert_or_throw!(
            type_eq!(this.ty(), that.ty()),
            "type mismatch between {this} and {that}",
        );

        let ty = this.ty();
        let constraint = match ty.as_ref() {
            Type::BitVec(_) | Type::Pointer(_) => {
                let this = BV::try_from(self.interpret(this, false, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                let that = BV::try_from(self.interpret(that, false, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                this._eq(&that)
            }
            Type::Enum(_) | Type::Int(_) => {
                let this = Int::try_from(self.interpret(this, false, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                let that = Int::try_from(self.interpret(that, false, mstate)?)
                    .map_err(|err| make_panic!("{err}"))?;
                this._eq(&that)
            }
            _ => throw_panic!("type {ty} is not supported"),
        };
        self.solver.assert(&constraint);
        Ok(())
    }

    fn check(&self) -> CheckResult {
        match self.solver.check() {
            z3::SatResult::Sat => CheckResult::Sat,
            z3::SatResult::Unknown => CheckResult::Unknown,
            z3::SatResult::Unsat => CheckResult::Unsat,
        }
    }

    fn is_free(&self, desc: Rc<SymbolicDesc>) -> bool {
        // false
        !self.deps.contains(&ByAddress(desc))
    }
}
