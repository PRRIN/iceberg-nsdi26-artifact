//! Implements the summary applier.

use super::{Effect, Scope, SideEffect, SummaryNodeRef};
use crate::panic::*;
use crate::middleend::{*, se::*};

/// A `SummaryApplier` is a stateful view of a summary, used as an iteration 
/// handle over it.
pub struct SummaryApplier {
    /// The scope of the summary being applied.
    scope: Scope,
    /// The root node of the summary being applied.
    root: SummaryNodeRef,
    /// The current node of the summary being applied.
    cursor: SummaryNodeRef,

    /// The next action to take.
    action: Action,
    /// The stack of actions taken so far.
    history_actions: Vec<Action>,
    /// The currently checked `Effect::Specialize` found value, cached.
    spec: Option<Rc<Exp>>,

    /// Function arguments, used for failover summary retry.
    /// 
    /// If `None`, no failover is allowed.
    args: Option<Vec<Rc<Exp>>>,
}

#[derive(Debug, Clone, Copy)]
enum Action {
    /// Apply the current `Effect`.
    Cur,
    /// Go to the next `Effect` (the i-th successor).
    Next(u32),
    /// Backtrack.
    Back(WalkStateDelta),
}

impl Action {

    /// Morph `self` into `Back` if it was `Next`.
    fn to_back(&mut self) {
        let Action::Next(v) = self else {
            unreachable!()
        };
        let delta = (*v >> 24) as u8;
        *self = Action::Back(delta);
    }
}

impl SummaryApplier {

    pub(super) fn new(scope: Scope, root: SummaryNodeRef, args: Option<Vec<Rc<Exp>>>) -> Self {
        SummaryApplier {
            scope,
            cursor: root.clone(),
            root,
            action: Action::Cur,
            history_actions: vec![],
            spec: None,
            args,
        }
    }

    pub fn scope(&self) -> &str {
        self.scope.as_ref()
    }

    /// Retry the application.
    fn restart(&mut self, see: &mut See) -> Option<(Rc<Exp>, bool)> {
        let Some(args) = self.args.take() else {
            make_panic!("restarting applier of scope {} for more than once in one go", self.scope)
                .panic(&see.traces);
        };
        assert!(see.summarize(self.scope.clone(), &args));
        self.next(see)
    }

    /// Whether this applier has taken any action.
    pub fn have_taken(&self) -> bool {
        !(Rc::ptr_eq(&self.cursor, &self.root) && matches!(self.action, Action::Cur))
    }

    /// Enumerate the next path of the associated summary tree, applying all `Effect`s 
    /// appropriately with the given `see`.
    ///
    /// ## Return Value
    /// * `Some(_)` if a return is reached.
    /// * `None`, when all paths are drained.
    /// Notably, reaching an `Effect::Panic` does not cause this method to return. The
    /// panic is propagated to the current builder via `SummaryManager`, and we simply
    /// look for the next path.
    pub(in crate::middleend::se) fn next(&mut self, see: &mut See) -> Option<(Rc<Exp>, bool)> {
        'apply: loop {
            let guard = self.cursor.borrow();
            match self.action {
                Action::Cur => {
                    let mut delta = DELTA_NONE;
                    see.traces.applier_info(format_args!("applier for {} visits {}", self.scope, guard.effect.to_string()));

                    match &guard.effect {
                        // Try a path condition
                        Effect::Assume(cond) => {
                            let cond = see.exec(cond.clone()).unwrap();
                            let sat = if let Some(sat) = exp_as_bool!(cond) {
                                sat
                            } else {
                                delta |= DELTA_SOLVER;
                                see.solver.push();
                                see.solver.assert(cond.clone(), &see.mstate).unwrap();
                                see.solver.check().into()
                            };
                            
                            if sat {
                                delta |= DELTA_SUMMAN;
                                see.sman.branch().get(see.traces());
                                see.sman.assume(cond, &mut see.traces);
                            } else {
                                // ...pruned
                                self.action = Action::Back(delta);
                                continue 'apply
                            }
                        }

                        // Match a specialization
                        Effect::Specialize(desc, expected) => {

                            // Handling symbolic pointers:
                            // * If `found` is `Exp::SymbolicPtr`, concretize to get the actual associated 
                            //   region.
                            // * If `expected` is `Exp::SymbolicPtr`, try concretizing it; in the case that
                            //   it is bound, check if the binding matches; otherwise, bind it.

                            if self.spec.is_none() {

                                delta |= DELTA_SUMMAN; 
                                see.sman.branch().get(see.traces());
                                // vvv These can result in `sman.specialize()` vvv
                                let found = desc.concretize(expected.ty(), see);
                                let found = match see.exec_spec(found) {
                                    Some(found) => found,
                                    None => {
                                        // Executing `found` yields non-panic SeError, meaning
                                        // that the specialization will not succeed in any case;
                                        // Double back on previous node as well.
                                        self.action = Action::Back(delta);
                                        self.history_actions.last_mut().unwrap().to_back();
                                        see.sman
                                            .regress(&mut see.solver)
                                            .get(see.traces());
                                        continue 'apply
                                    }
                                };
                                // TODO: these strip_bitcast's may have a better solution..
                                // : In fact, after we rework how symbolic pointers are implemented,
                                // this will be solved.
                                let found = match exec::strip_bitcast!(found).as_ref() {
                                    Exp::SymbolicPtr(data) => {
                                        let mdesc = {
                                            let actual = SymbolicRegionDesc::concretize(
                                                &mut see.sman,
                                                data.region.scope(),
                                                data.region.symbolic(),
                                            ).get(see.traces());
                                            MemoryDesc::from_raw_parts(actual, data.offset)
                                        };
                                        let ptr = Exp::pointer_literal(mdesc);
                                        if !type_eq!(found.ty(), ptr.ty()) {
                                            Exp::bitcast(found.ty(), ptr).unwrap()
                                        } else {
                                            ptr
                                        }
                                    },
                                    _ => found,
                                };
                                // By now, if `found` were an `Exp::SymbolicPtr`, it will become an
                                // `Exp::PointerLiteral`.

                                // cache the found value
                                self.spec = Some(found.clone());
                            }
                            
                            let found = self.spec.clone().unwrap();
                            match (exec::strip_bitcast!(*expected).as_ref(), exec::strip_bitcast!(found).as_ref()) {
                                (Exp::SymbolicPtr(sdata), Exp::PointerLiteral(pdata)) => {
                                    // Expecting a symbolic pointer; try to bind it
                                    let symbolic = sdata.region.symbolic();
                                    let actual = see.mstate.region_of(&pdata.desc);

                                    let expected = see.mstate().layout_of(actual.clone());
                                    let found = sdata.layout.clone();
        
                                    if !std::ptr::eq(&*expected, &*found) || sdata.offset != pdata.desc.offset() {
                                        see.traces.applier_info(
                                            format_args!(
                                                "applier for {} fails to specialize: layouts are not the same",
                                                self.scope,
                                            )
                                        );
                                        self.action = Action::Back(delta);
                                        continue 'apply
                                    }
                                    if !see.sman.bind_symbolic(&self.scope, symbolic, actual.clone()) {
                                        see.traces.applier_info(
                                            format_args!(
                                                "applier for {} fails to specialize: binding {symbolic} to {actual} fails",
                                                self.scope,
                                            )
                                        );
                                        self.action = Action::Back(delta);
                                        continue 'apply
                                    }
                                    delta |= DELTA_BIND;
                                },
                                _ => {
                                    // ...otherwise, compare normally
                                    let compare = found.eq(expected);
                                    match compare {
                                        ExpOrdering::Eq => {},
                                        _ => {
                                            see.traces.applier_info(
                                                format_args!(
                                                    "applier for {} fails to specialize: comparing {expected} and {found} gives {:?}", 
                                                    self.scope, 
                                                    compare
                                                )
                                            );
                                            self.action = Action::Back(delta);
                                            continue 'apply
                                        }
                                    }
                                }
                            }
                            // ...specialization passed
                            // clear the cached found value before going further
                            self.spec = None;
                            delta |= DELTA_STATES;
                        }
    
                        // Propagate a panic
                        Effect::Panic(msg) => {
                            see.sman.panic(msg, &mut see.traces);
                            self.action = Action::Back(DELTA_NONE);
                            continue 'apply
                        }

                        // Apply side effects and bind the return value
                        Effect::Ret(side_effects) => {
                            see.mstate.push();

                            let mut value = None;
                            let mut is_throw = false;
    
                            // Apply all the side effects; `Malloc`s are assumed to appear before all `Store`s
                            // and `StoreSymbolic`s, and stores must all be executed before storing.
                            let mut stores = Vec::new();
                            for side_effect in side_effects.iter() {
                                match side_effect {
                                    SideEffect::Return(ret) => { 
                                        _ = value.insert(ret.clone());
                                    },
                                    SideEffect::Throw(ret) => { 
                                        _ = value.insert(ret.clone());
                                        is_throw = true;
                                    },
                                    SideEffect::Malloc(ty, zero_init, symbolic) => {
                                        let mdesc = see.mstate.alloc_heap(
                                            ty.clone(), 
                                            *zero_init,
                                        ).unwrap();
                                        let actual = see.mstate.region_of(&mdesc);
                                        SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())
                                            .get(see.traces());
                                        if !see.sman.bind_symbolic(&self.scope, *symbolic, actual.clone()) {
                                            make_panic!("failed to bind {symbolic} to {actual} when applying {}", self.scope)
                                                .panic(see.traces())
                                        }
                                    }
                                    SideEffect::Store(target, value) => {
                                        let value = see.exec(value.clone()).unwrap();
                                        stores.push((target.clone(), value));
                                    }
                                    SideEffect::StoreSymbolic(sym, ofs, value) => {
                                        let region = SymbolicRegionDesc::concretize(
                                            &mut see.sman,
                                            &self.scope,
                                            *sym,
                                        ).get(see.traces());
                                        let target = MemoryDesc::from_raw_parts(region, *ofs);
                                        let value = see.exec(value.clone()).unwrap();
                                        stores.push((target, value));
                                    }
                                    SideEffect::Free(sym) => {
                                        let rdesc =  SymbolicRegionDesc::concretize(
                                            &mut see.sman,
                                            &self.scope,
                                            *sym,
                                        ).get(see.traces());
                                        match see.mstate.free_heap(rdesc.clone()) {
                                            Ok(_) => {},
                                            Err(SeError::Panic(panic)) => panic.panic(see.traces()),
                                            Err(err) => {
                                                see.sman.panic(err.to_string(), &mut see.traces);
                                                self.action = Action::Back(DELTA_NONE);
                                                continue 'apply
                                            }
                                        }
                                    }
                                }
                            }
    
                            // ..get the return value before malloc unbinding because it may be a heap pointer
                            let retval = {
                                see.exec(value.unwrap()).unwrap()
                            };
    
                            // ..perform stores
                            for (target, value) in stores {
                                see.mstate.store(&target, value, false).unwrap();
                            }
    
                            // ..unbind mallocs
                            for side_effect in side_effects.iter() {
                                match side_effect {
                                    SideEffect::Malloc(_, _, symbolic) => {
                                        see.sman.unbind_symbolic(&self.scope, *symbolic).unwrap();
                                    },
                                    _ => break,
                                }
                            }

                            self.action = Action::Back(DELTA_NONE);
                            break Some((retval, is_throw))
                        },

                        // No-op
                        Effect::Root => {},
                    };

                    // ...go next
                    self.action = Action::Next((delta as u32) << 24);
                }

                Action::Next(v) => {
                    let idx = (v & 0xFFFFFF) as usize;
                    if idx < guard.succs.len() {
                        self.history_actions.push(Action::Next(v + 1));
                        self.action = Action::Cur;
                        let nxt = guard.succs.get(idx).unwrap().clone();
                        drop(guard);
                        self.cursor = nxt;
                    } else {
                        if guard.succs.first().is_some_and(|nxt| {
                            matches!(nxt.borrow().effect, Effect::Specialize(_, _))
                        }) {
                            // Summary needs expansion
                            see.traces.applier_info(format_args!("applier for {} returns in need of restart", self.scope));
                            drop(guard);
                            break self.restart(see)
                        } 
                        // Normal backtrack
                        self.action.to_back();
                    }
                }

                Action::Back(delta) => {
                    match &guard.effect {
                        Effect::Assume(_) => {
                            if delta & DELTA_SOLVER != 0 {
                                see.solver.pop();
                            }
                            if delta & DELTA_SUMMAN != 0 {
                                see.sman
                                    .regress(&mut see.solver)
                                    .get(see.traces());
                            }
                        },
                        Effect::Specialize(_, expected) => {
                            // Backtracking a successful `Specialize` means other branches are not possible
                            if delta & DELTA_STATES != 0 {
                                // The cached found value is already cleared when specialization succeeded
                                see.sman
                                    .regress(&mut see.solver)
                                    .get(see.traces());
                                self.history_actions.last_mut().unwrap().to_back();
                                // Also, if a symbolic pointer was bound, unbind it here.
                                if delta & DELTA_BIND != 0 {
                                    let expected = exec::strip_bitcast!(*expected);
                                    let data = exp_as_data!(expected, Exp::SymbolicPtr);
                                    see.sman
                                        .unbind_symbolic(&self.scope, data.region.symbolic())
                                        .get(see.traces());
                                }
                            } 
                        },
                        Effect::Ret(_) => {
                            see.mstate.pop();
                        }
                        Effect::Root => {
                            see.traces.applier_info(format_args!("applier for {} is drained", self.scope));
                            break None;
                        }
                        _ => {},
                    }
                    let nxt = self.history_actions.pop().unwrap();
                    self.action = nxt;
                    let parent = guard.parent.upgrade().unwrap().clone();
                    drop(guard);
                    self.cursor = parent;
                }
            }
        }
    }

    /// Check and claim this applier in its final state.
    pub(super) fn done(self) -> Panicable<()> {
        assert_or_throw!(Rc::ptr_eq(&self.cursor, &self.root), "cursor did not return to root");
        assert_or_throw!(self.history_actions.is_empty(), "actions are not all popped");
        assert_or_throw!(matches!(self.action, Action::Back(DELTA_NONE)), "applier is not drained");
        Ok(())
    }
}