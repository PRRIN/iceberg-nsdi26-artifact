//! Implements the summary builder.

use super::*;
use crate::middleend::{se::*, *};
use by_address::ByAddress;
use fxhash::{FxHashMap, FxHashSet};

/// A `SummaryBuilder` manages a summary that is being built.
///
/// `SummaryBuilder` holds the scope of the summary, and the root node / cursor
/// node on the building summary tree.
///
/// The symbolic states are also managed by a `SummaryBuilder`. During the summary
/// building process, the builder keeps track of how each dependent states
/// (corresponding to an `Exp::Symbolic`) are specialized.
/// In the case of `SymbolicPointer`s, the builder further bookkeeps the relation
/// between actual region descriptors and symbolic region descriptors.
pub(super) struct SummaryBuilder {
    /// The scope of the summary being built.
    scope: Scope,
    /// The root node of the summary being built.
    root: SummaryNodeRef,
    /// The current node of the summary being built.
    cursor: SummaryNodeRef,
    /// Memory snapshot when building started.
    snapshot: MemorySnapshot,

    /*
       ### `events` and `bcount`

       At any time, `bcount` keeps track of the number of steps from `cursor`
       to the latest branch point upper in the summary tree. `events` saves the
       binding of symbolic regions, and also the saved `bcount` values for all
       previous branching points.
    */
    /// Stack of build events.
    pub(super) events: Vec<BuilderEvent>,
    /// Current branch counter.
    bcount: u32,

    /// The state of all dependent symbolic descriptors.
    pub(super) symbolic_states: HashMap<Rc<SymbolicDesc>, SymbolicState<Rc<Exp>>>,

    /// The binding of all dependent symbolic region descriptors, indexed by
    /// symbolic region ID.
    pub(super) symbolic_region_binding: Vec<Rc<RegionDesc>>,

    /// The symbolic region descriptors that this summary builder currently uses,
    /// mapped from actual region descriptors.
    pub(super) reverse_region_map: HashMap<Rc<RegionDesc>, SymbolicRegionDesc>,
}

/// Builder events that come and go.
///
/// Notably, unlike the event systems in `MemoryState` or `ValueState`, the summary
/// tree in a `SummaryBuilder` already serves to record some of the modification
/// history (for example, the `Effect::Specialize`s).
/// The events here are for those not recorded in the summary tree.
///
/// For compactness, the `BuilderEvent` is encoded as an `u32`.
pub(super) struct BuilderEvent(u32);

impl BuilderEvent {
    /// Flag indicating whether a `BuildEvent` is a symbolic region bind.
    const BIND: u32 = u32::MAX;

    pub(super) fn is_bind(&self) -> bool {
        self.0 == BuilderEvent::BIND
    }

    pub(super) fn bind() -> BuilderEvent {
        BuilderEvent(BuilderEvent::BIND)
    }
}

impl SummaryBuilder {
    pub(super) fn new(snapshot: MemorySnapshot, scope: Scope) -> Self {
        let root = Rc::new_cyclic(|me| {
            RefCell::new(SummaryNode {
                effect: Effect::Root,
                succs: vec![],
                parent: me.clone(), // Root node's parent is itself
                color: Cell::new(SummaryNode::COLOR_UNCACHED),
            })
        });
        SummaryBuilder {
            scope,
            root: root.clone(),
            cursor: root.clone(),
            snapshot,

            events: vec![],
            bcount: 0,

            symbolic_states: HashMap::new(),
            symbolic_region_binding: vec![],
            reverse_region_map: HashMap::new(),
        }
    }

    pub(super) fn snapshot(&self) -> &MemorySnapshot {
        &self.snapshot
    }

    pub(super) fn scope(&self) -> Scope {
        self.scope.clone()
    }

    pub(super) fn branch(&mut self) {
        self.events.push(BuilderEvent(self.bcount));
        self.bcount = 0;
    }

    pub(super) fn regress(&mut self, solver: &mut Solver) {
        // Walk up the summary tree
        let cur = &mut self.cursor;
        for _ in 0..self.bcount {
            let guard = cur.as_ref().borrow();
            match &guard.effect {
                Effect::Specialize(desc, _) => {
                    if !solver.is_free(desc.clone()) {
                        solver.pop();
                    }
                    let state = self.symbolic_states.get_mut(desc).unwrap();
                    let SymbolicState::Specialized(symbolic, _) = state else {
                        unreachable!()
                    };
                    *state = SymbolicState::Symbolic(symbolic.clone());
                }
                _ => {}
            }
            let parent = guard.parent.upgrade().unwrap();
            drop(guard);
            *cur = parent;
        }
        // Walk up the events stack
        while let Some(event) = self.events.pop() {
            if event.is_bind() {
                /* must be the newest bind so far */
                let region = self.symbolic_region_binding.pop().unwrap();
                self.reverse_region_map.remove(&region).unwrap();
            } else {
                self.bcount = event.0;
                return;
            }
        }
        self.bcount = 0;
    }

    #[doc(hidden)]
    pub(super) fn grow_with(&mut self, effect: Effect) {
        let cur = &mut self.cursor;
        let mut guard = cur.as_ref().borrow_mut();

        let new_node = Rc::new(RefCell::new(SummaryNode {
            effect,
            succs: vec![],
            parent: Rc::downgrade(cur),
            color: Cell::new(SummaryNode::COLOR_UNCACHED),
        }));
        guard.succs.push(new_node.clone());
        drop(guard);
        *cur = new_node;

        self.bcount += 1;
    }

    pub(super) fn assume(&mut self, cond: Rc<Exp>) -> Option<Effect> {
        assert!(
            type_is_bool!(cond.ty()),
            "[SummaryBuilder::assume] type {} of cond {cond} is not Bool",
            cond.ty()
        );
        if matches!(exp_as_bool!(cond), Some(true)) {
            // no need to add "true" as a path constraint
            return None;
        }
        let effect = Effect::Assume(cond);
        self.grow_with(effect.clone());
        Some(effect)
    }

    pub(super) fn specialize(
        &mut self,
        solver: &mut Solver,
        mstate: &MemoryState,
        symbolic: Rc<Exp>,
        spec: Rc<Exp>,
    ) -> Result<Effect, SeError> {
        let Exp::Symbolic(data) = symbolic.as_ref() else {
            unreachable!()
        };

        let desc = &data.desc;
        assert!(self.scope.as_ref().eq(desc.scope()));

        // Grow the `Specialize` node anyway
        let effect = Effect::Specialize(desc.clone(), spec.clone());
        self.grow_with(effect.clone());
        let state = self.symbolic_states.get_mut(desc).unwrap();
        match state {
            SymbolicState::Specialized(_, _) | SymbolicState::Referral => unreachable!(),
            SymbolicState::Symbolic(symbolic) => {
                *state = SymbolicState::Specialized(symbolic.clone(), spec.clone());
            }
        };

        // ..check if this constraint is backward compatible
        if solver.is_free(desc.clone()) {
            /*
               We are specializing a state that is brand new to the backend,
               in which case the constraint is trivially compatible.
            */
            return Ok(effect);
        }

        solver.push();
        solver
            .assert_eq(symbolic.clone(), spec.clone(), mstate)
            .or_else(|panic| panic.into())?;
        let compatible: bool = solver.check().into();
        if !compatible {
            /* solver.pop() will be called when regress() visits the Effect */
            return Err(SeError::ImpossibleSpecialize);
        }
        Ok(effect)
    }

    pub(super) fn panic(&mut self, msg: impl Into<String>) -> Effect {
        let msg = msg.into();
        let effect = Effect::Panic(msg);
        self.grow_with(effect.clone());
        effect
    }

    pub(super) fn ret(
        &mut self,
        mut value: Rc<Exp>,
        mstate: &MemoryState,
        is_throw: bool,
    ) -> Result<(), SeError> {
        // Obtain all locally freed regions
        let frees: Vec<_> = mstate
            .all_freed(&self.snapshot)
            .into_iter()
            .filter(|rdesc| mstate.epoch_of(rdesc.clone()) < self.snapshot().epoch())
            .collect();

        // Obtain all modifications to the memory.
        let mut stores = mstate.all_modified(&self.snapshot);

        // Perform the Escape Analysis to obtain lasting regions.
        //
        // A region is considered lasting, if it has an allocation epoch that is earlier
        // than the start of the current summary, or it has a pointer stored to a lasting
        // region/returned - and it as not been freed.
        let mut escaped: FxHashSet<_> = FxHashSet::default();
        let mut esa: FxHashMap<_, _> = FxHashMap::default();

        // ...capture regions in the return value
        // XXX: vvv returning `List`s is NOT checked here vvv
        // Again, the symbolic rework should solve this.
        let mut values = Exp::flatten(value.clone()).unwrap_or_else(|_| vec![]); 
        
        #[allow(unused_mut)]
        let mut value_changed = false;
        for exp in values.iter_mut() {
            let region = match exec::strip_bitcast!(*exp).as_ref() {
                Exp::PointerLiteral(data) => mstate.region_of(&data.desc),
                Exp::SymbolicPtr(data) => {
                    assert!(data.region.scope().eq(self.scope.as_ref()));
                    self.symbolic_region_binding
                        .get(data.region.symbolic() as usize)
                        .unwrap()
                        .clone()
                }
                _ => continue,
            };
            #[cfg(not(feature = "err_stack_pointer_leak"))]
            if region.is_stack() && mstate.epoch_of(region.clone()) > self.snapshot().epoch() {
                // leaked stack pointer becomes `Havoc`
                *exp = Exp::havoc(exp.ty());
                value_changed = true;
                continue;
            }
            match SummaryBuilder::esa_query(mstate, self.snapshot(), &mut escaped, region.clone()) {
                None => _ = escaped.insert(ByAddress(region)), // returned regions are for sure escaped
                _ => {}
            }
        }
        if value_changed {
            value = Exp::collect(value.ty(), &mut values.into_iter()).unwrap();
        }

        // ...capture stored regions
        for (target, value) in stores.iter_mut() {
            let target_region = mstate.region_of(&target);
            let target_escaped = SummaryBuilder::esa_query(
                mstate,
                self.snapshot(),
                &mut escaped,
                target_region.clone(),
            );

            let stored_region = match exec::strip_bitcast!(*value).as_ref() {
                Exp::PointerLiteral(data) => mstate.region_of(&data.desc),
                Exp::SymbolicPtr(data) => {
                    assert_or_throw!(
                        data.region.scope().eq(self.scope.as_ref()),
                        "{} should be {}, when storing {value} to {target}",
                        data.region.scope(),
                        self.scope
                    );
                    self.symbolic_region_binding
                        .get(data.region.symbolic() as usize)
                        .unwrap()
                        .clone()
                }
                _ => continue,
            };

            if stored_region.is_stack()
                && mstate.epoch_of(stored_region.clone()) > self.snapshot().epoch()
            {
                #[cfg(not(feature = "err_stack_pointer_leak"))]
                {
                    // leaked stack pointer becomes `Havoc`
                    *value = Exp::havoc(value.ty());
                }
                continue;
            }

            let stored_escaped = SummaryBuilder::esa_query(
                mstate,
                self.snapshot(),
                &mut escaped,
                stored_region.clone(),
            );
            match (target_escaped, stored_escaped) {
                (Some(true), None) => {
                    // _ = escaped.insert(ByAddress(stored_region.clone()));
                    SummaryBuilder::esa_cascade(&mut escaped, &mut esa, ByAddress(stored_region));
                }
                (None, None) => {
                    /*
                        For `stored_escaped` to be None, `stored_region` must be a non-freed heap region:
                        - Globals, or non-local stacks would be marked as escaped by `SummaryBuilder::esa_query`
                        - Local stack would be skipped by the check right above
                        - Freed heap would be marked as not escaped.
                        Hence it can still become escaped, if `target_region` escapes.
                    */
                    esa.entry(ByAddress(target_region.clone()))
                        .or_insert_with(Vec::new);
                    esa.get_mut(&ByAddress(target_region))
                        .unwrap()
                        .push(ByAddress(stored_region));
                }
                _ => {}
            }
        }

        #[cfg(feature = "err_stack_pointer_leak")]
        if let Some(stack) = escaped.iter().find(|region| {
            region.is_stack() && mstate.epoch_of((region.0).clone()) > self.snapshot().epoch()
        }) {
            // Local stack region becomes lasting, which means a local stack
            // region is leaked.
            return Err(SeError::StackLeak {
                stack_desc: stack.0.clone(),
            });
        }

        // Generate side effects:
        // * Generate `Malloc` for heap regions in `mstate.mallocs()` that are also lasting
        // * Generate `Store` and `StoreSymbolic` for stores in `stores` whose target is lasting
        // * Generate `Free` and `FreeSymbolic` for freed heap regions
        // Note that the order is crucial: `Store` targets may be `Malloc`-ed, and the stored values
        // may be then `Free`-ed.
        let mut side_effects = mstate
            .mallocs(self.snapshot().epoch())
            .iter()
            .filter(|region| escaped.contains(&ByAddress((*region).clone())) && region.is_heap())
            .map(|region| {
                let ty = mstate.type_of(region.clone());
                let zero_init = region.is_zero_init();
                let sdesc = self.reverse_region_map.get(region).unwrap().clone();
                SideEffect::Malloc(ty, zero_init, sdesc.symbolic())
            })
            .collect::<Vec<_>>();

        side_effects.sort_by_key(|se| {
            let SideEffect::Malloc(_, _, sym) = se else {
                unreachable!()
            };
            *sym
        });

        side_effects.extend(
            stores
                .into_iter()
                .filter(|(target, _)| escaped.contains(&ByAddress(mstate.region_of(&target))))
                .map(|(desc, value)| {
                    let rdesc = mstate.region_of(&desc);
                    if rdesc.is_global() {
                        SideEffect::Store(desc, value)
                    } else {
                        let region = self.reverse_region_map.get(&rdesc).unwrap();
                        SideEffect::StoreSymbolic(region.symbolic(), desc.offset(), value)
                    }
                }),
        );

        side_effects.extend(frees.into_iter().map(|rdesc| {
            let sdesc = self.reverse_region_map.get(&rdesc).unwrap();
            SideEffect::Free(sdesc.symbolic())
        }));

        if is_throw {
            side_effects.push(SideEffect::Throw(value));
        } else {
            side_effects.push(SideEffect::Return(value));
        }

        let effect = Effect::Ret(side_effects.into());
        self.grow_with(effect.clone());
        Ok(())
    }

    pub(super) fn done(mut self, solver: &mut Solver) -> Panicable<SummaryNodeRef> {
        self.regress(solver);
        assert!(Rc::ptr_eq(&self.cursor, &self.root));
        assert!(self.events.is_empty());
        assert!(self.bcount == 0);
        Summary::check(self.root.clone())?;
        Ok(self.root)
    }

    /// Perform the escape analysis, incrementally.
    fn esa_query(
        mstate: &MemoryState,
        snapshot: &MemorySnapshot,
        escaped: &mut FxHashSet<ByAddress<Rc<RegionDesc>>>,
        region: Rc<RegionDesc>,
    ) -> Option<bool> {
        // Decide, with best effort, if `region` escapes
        if escaped.contains(&ByAddress(region.clone())) {
            return Some(true);
        }

        if region.is_heap() && mstate.is_freed(region.clone()) {
            return Some(false);
        }

        if region.is_global() || mstate.epoch_of(region.clone()) <= snapshot.epoch() {
            _ = escaped.insert(ByAddress(region));
            return Some(true);
        }

        // ..cannot decide for now
        return None;
    }

    /// Cascade stashed escape analysis results, starting from `region`.
    fn esa_cascade(
        escaped: &mut FxHashSet<ByAddress<Rc<RegionDesc>>>,
        esa: &mut FxHashMap<ByAddress<Rc<RegionDesc>>, Vec<ByAddress<Rc<RegionDesc>>>>,
        region: ByAddress<Rc<RegionDesc>>,
    ) {
        let mut worklist = vec![region];
        while let Some(region) = worklist.pop() {
            if escaped.insert(region.clone()) {
                if let Some(rs) = esa.get_mut(&region) {
                    worklist.extend(rs.drain(..));
                }
            }
        }
    }
}
