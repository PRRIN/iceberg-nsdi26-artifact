//! Implements the summary system for the symbolic execution.
//!
//! From Iceberg's viewpoint, each function boils down to a set
//! of "constraint-effect" pairs, which essentially means "if this,
//! do that". The constraints are represented using the `Exp` system,
//! while the effects are represented with `Effect`s.
//!
//! `Effect`s should be collected with the `SummaryManager`, which is
//! closely coupled with the symbolic execution process.
//! See the documentation for `SummaryManager` for detailed discussion.

mod applier;
mod builder;
pub mod effect;
mod symbolic;

use crate::backend::*;
use crate::middleend::se::*;
use crate::panic::*;
use crate::util::StringRef;
pub use applier::SummaryApplier;
use builder::{BuilderEvent, SummaryBuilder};
use effect::{Effect, SideEffect};
use fxhash::FxHashMap;
use std::cell::{Cell, RefCell};
use std::collections::{HashMap, HashSet};
use std::fmt;
use std::rc::{Rc, Weak};
pub use symbolic::{SymbolicDesc, SymbolicRegionDesc, SymbolicState};

/// The `SummaryManager` is the core of the summary system. It single-handedly
/// handles the creation, application and modification of summaries.
///
/// Summaries are organized with respect to the concept of `Scope`s. Each `Scope` maps
/// into exactly one `Summary` instance. Further, `SummaryManager` internally keeps stacks
/// to determine the most recent (currently worked-on) summary.
///
/// The execution of certain `Exp`s (see `se::exec`), or the traversal
/// of certain `CfgNode`s, will produce `Effect`s.
/// For example, executing a `Exp::Store` may produce `Effect::Store`,
/// and reaching a `CfgNode::Return` will produce `Effect::Return`.
/// A `SummaryManager` rigorously records all such `Effect`s appropriately
/// in the current summary.
///
/// A prime application of this design is the **partial specification
/// system** (see `Effect::Specialize` for explanation of specializing).
/// Instead of making up explicit patterns for producing `Specialize`
/// effects, we **specialize on a per-`SymbolicDesc` granularity**,
/// keeping a specializer for each possible dependent state.
///
/// Under this view, all dependent states of a summary are initialized
/// as `Exp::Symbolics`s, but with their concrete values stored as "specializer"s
/// within a `SummaryManager`. When the `Symbolic` value prevents execution
/// from proceeding (symbolic indexing; loading from symbolic pointers; etc.),
/// the execution automatically resorts to the specializer, producing a
/// `Effect::Specialize` accordingly.
///
/// This design allows for automatic, rigorous and fine-grained specializing
/// of summaries. There is a further tradeoff on whether to specialize on
/// executable `Exp`s, in order to control the path explosion, with
/// the cost of a less general summary, which is left for future considerations.
pub struct SummaryManager {
    /// Managed summaries indexed by `Scope`.
    summaries: HashMap<Scope, Summary>,

    /// Stack of building summaries, represented in `Scope`s.
    build_stack: Vec<Scope>,

    /// Count of repetitively called scopes, measuaring recursions.
    recursive_count: HashMap<Scope, u32>,

    /// Manages coloring of summary nodes.
    colors: FxHashMap<(Effect, Vec<u32>), u32>,
}

/// A `Summary` instance. It represents a summary of a function, and
/// also manages dependent states of it.
///
/// A summary is conceptually a scoped tree of `Effect`s. Practically, the
/// `Specialize` nodes seal parts of the tree, saving the sub-tree for
/// future exploration (or effectively pruning it).
///
/// As such, a summary may only be partially built, and may go over a loop
/// of building and applying.
///
/// In order to handle the complexity brought by recursion (a summary may depend
/// on itself), a `Summary` is explicitly restricted to NOT be double building, or
/// applying after building. Any of these state corresponds to recursion, where Iceberg
/// simply resorts to concrete execution.
///
/// Notably, an applying `Summary` can still *transition* into a building one, if
/// a mismatched `Specialize` occurs. This is not to be confused with building
/// after applying, which in fact cannot happen - it would require a sequence of
/// [apply f] -(specialize fail) -> [apply -> build f] -> .. -> [build f], which
/// is treated as double building.
pub struct Summary {
    /// The scope of the summary.
    scope: Scope,
    /// Root of the summary tree.
    root: SummaryNodeRef,
    /// Summary state.
    state: SummaryState,

    /// All dependent states, represented as `SymbolicDesc`s.
    symbolic_descs: HashSet<Rc<SymbolicDesc>>,
}

/// ### Sketch: Locking of summary nodes
/// TODO: locking is in prototype phase
/// `SummaryBuilder` and `SummaryApplier` are essentially writer and reader of a
/// summary, where locking may be necessary to ensure they work together.
/// The locking scheme is detailed as follows:
/// * `SummaryApplier`s increment the use count of every summary node when entering,
///   and decrement the use count when leaving, effectively reader-locks the node.
/// * `SummaryBuilder` modifies the summary tree in two ways.
///   `Summary::merge` only adds to the summary (by growing new `Specialize` branches),
///   and is not restricted by any appliers, as growing the tree does not invalidate
///   views of the tree.
///   `Summary::optimize` only removes from or make adjustments to the tree, and must
///   not touch any nodes that are "in-use" by an applier.
struct SummaryNode {
    /// Effect of this node.
    effect: Effect,
    /// Successor nodes.
    succs: Vec<SummaryNodeRef>,
    /// Parent node.
    parent: Weak<RefCell<SummaryNode>>,

    /// Color for tree merging.
    ///
    /// A `SummaryNode`'s color uniquely identifies the corresponding subtree.
    color: Cell<u32>,
}

type SummaryNodeRef = Rc<RefCell<SummaryNode>>;

impl SummaryNode {
    const COLOR_UNCACHED: u32 = 0;

    pub fn dump(
        &self,
        indent: usize,
        is_last: bool,
        verbose: bool,
        f: &mut fmt::Formatter<'_>,
    ) -> fmt::Result {
        let space = format!(
            "{} {}",
            "  ".repeat(indent - 1),
            if is_last { "└" } else { "├" }
        );
        if verbose {
            write!(
                f,
                "{space}{}\n",
                indent::indent_by(2 * indent + 4, self.effect.to_string())
            )?;
        } else {
            write!(f, "{space}")?;
            self.effect.fmt(f, false)?;
            write!(f, "\n")?;
        }

        let mut peekable = self.succs.iter().peekable();
        while let Some(succ) = peekable.next() {
            let nxt = succ.as_ref().borrow();
            nxt.dump(indent + 1, peekable.peek().is_none(), verbose, f)?;
        }
        Ok(())
    }
}

/// The concept of `Scope` organizes summaries and dependent states.
/// Under the hood, `Scope`s are simply function names. This works as Iceberg
/// does not perform summarization of multiple instances of the same function.
///
/// To clarify: by using a function name as a `Scope`, we convery a very specific
/// meaning: "the last time the named function was summarized". For example, a
/// `Summary` with `Scope` of `@func` is just the latest summary for `@func`. A
/// `SymbolicDesc` (see later) with `Scope` of `@func` represents the state when
/// we last summarized `@func`, which explains something like `@func::@global_mem::0`:
/// it means the state of `@global_mem::0` when we last summarized `@func`.
type Scope = StringRef;

/// State of a `Summary` instance.
#[derive(Default)]
enum SummaryState {
    #[default]
    Empty,
    Apply(Vec<ApplyState>),
    Build(BuildState),
}

#[derive(Default)]
struct ApplyState {
    /// Bindings from applying symbolic region specializations, organized as
    /// a counted map.
    region_binding: HashMap<u32, Counted<Rc<RegionDesc>>>,

    /// Reverse mapping of `region_bindings`, for ensuring it is one-to-one.
    reverse_region_map: HashMap<Rc<RegionDesc>, u32>,
}

struct BuildState {
    /// Saved apply state.
    apply_states: Vec<ApplyState>,

    /// Associated summary builder.
    builder: SummaryBuilder,
}

impl SummaryManager {
    /// Create a new `SummaryManager` without any scopes.
    pub fn new() -> Self {
        SummaryManager {
            summaries: HashMap::default(),
            build_stack: vec![],
            recursive_count: HashMap::default(),
            colors: FxHashMap::default(),
        }
    }

    /// Starts building a new summary tree with the given `scope`. If `scope` already
    /// maps into a building summary, return `false`.
    ///
    /// Growing the tree is then achieved with the `branch()` and `regress()`
    /// methods. For example, to create a complete binary tree with 3 nodes:
    /// ```no_run
    /// // `mstate` is `&MemoryState`; `traces` is `&mut Traces`;
    /// let mut sman = SummaryManager::new();
    /// _ = sman.start_build(mstate, "TestScope", traces);
    /// sman.branch();
    /// sman.assume(cond1);
    /// sman.regress();
    /// sman.branch();
    /// sman.assume(cond2);
    /// sman.end_build(traces);
    /// ```
    /// See the documentation for each of the methods for more information.
    #[must_use]
    pub fn start_build(&mut self, mstate: &MemoryState, scope: Scope, traces: &mut Traces) -> bool {
        if matches!(
            self.summaries.get_mut(&scope).unwrap().state,
            SummaryState::Build(_)
        ) {
            traces.msg(format_args!(
                "summary with scope {scope} is already being built; not starting a new one"
            ));
            return false;
        }

        // println!("starts building {scope}");
        traces.msg(format_args!("building summary with scope {scope}"));
        self.enter(scope.clone());
        let builder = SummaryBuilder::new(mstate.snapshot(), scope.clone());
        let summary = self.summaries.get_mut(&scope).unwrap();
        self.build_stack.push(scope);

        let summary_state = std::mem::take(&mut summary.state);
        match summary_state {
            SummaryState::Empty => {
                summary.state = SummaryState::Build(BuildState {
                    apply_states: vec![],
                    builder,
                })
            }
            SummaryState::Apply(prev_state) => {
                summary.state = SummaryState::Build(BuildState {
                    apply_states: prev_state,
                    builder,
                })
            }
            SummaryState::Build(_) => unreachable!(),
        }
        true
    }

    /// Starts applying a summary with the given `scope`, returning an applier if possible.
    /// If `scope` currently maps into an empty summary, or if the summary is still being built,
    /// return `None`.
    #[must_use]
    pub fn start_apply(
        &mut self,
        scope: Scope,
        traces: &mut Traces,
        args: Option<Vec<Rc<Exp>>>,
    ) -> Option<SummaryApplier> {
        let summary = self.summary_mut(&scope);
        match &mut summary.state {
            SummaryState::Empty => {
                traces.msg(format_args!(
                    "summary with scope {scope} is empty; not applying"
                ));
                None
            }
            SummaryState::Apply(states) => {
                traces.msg(format_args!("applying summary with scope {scope}"));
                let applier = SummaryApplier::new(scope, summary.root.clone(), args);
                states.push(ApplyState {
                    ..Default::default()
                });
                Some(applier)
            }
            SummaryState::Build(_) => {
                traces.msg(format_args!(
                    "summary with scope {scope} is still being built; not applying"
                ));
                None
            }
        }
    }

    /// Enter a function scope.
    pub fn enter(&mut self, scope: Scope) {
        if self.recursive_count.contains_key(&scope) {
            *self.recursive_count.get_mut(&scope).unwrap() += 1;
        } else {
            self.recursive_count.insert(scope, 1);
        }
    }

    /// Leave a function scope.
    pub fn leave(&mut self, scope: Scope) {
        *self.recursive_count.get_mut(&scope).unwrap() -= 1;
    }

    /// Get the scope for the current building summary.
    pub fn current_scope(&self) -> Option<Scope> {
        self.build_stack.last().map(|s| s.clone())
    }

    /// Whether `self` is created with the scope `scope`.
    pub fn has_scope(&self, scope: &str) -> bool {
        self.summaries.contains_key(scope)
    }

    /// Add scope `scope` to `self`.
    pub fn add_scope(&mut self, scope: Scope) -> Panicable<()> {
        if self.summaries.contains_key(&scope) {
            throw_panic!("[SummaryManager::add_scope] Already has scope {scope}")
        }
        let root = Rc::new_cyclic(|me| {
            RefCell::new(SummaryNode {
                effect: Effect::Root,
                succs: vec![],
                parent: me.clone(), // Root node's parent is itself
                color: Cell::new(SummaryNode::COLOR_UNCACHED),
            })
        });
        self.summaries.insert(
            scope.clone(),
            Summary {
                scope: scope.clone(),
                root,
                state: SummaryState::Empty,
                symbolic_descs: HashSet::new(),
            },
        );
        self.recursive_count.insert(scope, 0);
        Ok(())
    }

    /// Get the summary with scope `scope`.
    pub fn summary(&self, scope: &str) -> &Summary {
        self.summaries.get(scope).unwrap()
    }

    /// Get the summary with scope `scope`, mutably.
    pub fn summary_mut(&mut self, scope: &str) -> &mut Summary {
        self.summaries.get_mut(scope).unwrap()
    }

    /// Get the current building summary.
    pub fn current_summary(&mut self) -> Panicable<&mut Summary> {
        let scope = self
            .current_scope()
            .ok_or_else(|| throw_panic!("no current building summary"))?;
        Ok(self.summaries.get_mut(scope.as_ref()).unwrap())
    }

    pub fn recursive_count(&self, scope: &str) -> u32 {
        *self.recursive_count.get(scope).unwrap()
    }

    /// Get the current summary builder.
    fn current_builder(&mut self) -> Panicable<&mut SummaryBuilder> {
        let Self {
            summaries,
            build_stack,
            ..
        } = self;
        match &mut summaries
            .get_mut(build_stack.last().unwrap())
            .unwrap()
            .state
        {
            SummaryState::Build(state) => Ok(&mut state.builder),
            _ => throw_panic!("no building summaries"),
        }
    }

    /// For the current building summary, record the current node as a branch point.
    pub fn branch(&mut self) -> Panicable<()> {
        self.current_builder()?.branch();
        Ok(())
    }

    /// For the current building summary, backtrack to the most recent branch point.
    /// Any effect in between is also reverted.
    pub fn regress(&mut self, solver: &mut Solver) -> Panicable<()> {
        self.current_builder()?.regress(solver);
        Ok(())
    }

    /// For the current building summary, grow an `Effect::Assume` node.
    pub fn assume(&mut self, cond: Rc<Exp>, traces: &mut Traces) {
        if let Some(effect) = self.current_builder().get(traces).assume(cond) {
            traces.summary_info(format_args!("{effect}"));
        }
    }

    /// For the current buildin summary, grow an `Effect::Panic` node.
    pub fn panic(&mut self, msg: impl Into<String>, traces: &mut Traces) {
        let effect = self.current_builder().get(traces).panic(msg);
        traces.summary_info(format_args!("{effect}"));
    }

    /// For the current building summary, try to do a specialization.
    /// The attempt succeeds only when the constraint is actually satisfiable with
    /// respect to the existing ones. As such, the backend solver will be invoked,
    /// and a new path constraint may be produced.
    ///
    /// When successful, mark the corresponding state as specialized, if it has not
    /// been previously marked. Otherwise, no effect is produced.
    ///
    /// Note that the scope of the given `symbolic` must match the scope of the current summary.
    /// In the case of a scope mismatch, this call has no effect.
    pub fn specialize(
        &mut self,
        solver: &mut Solver,
        mstate: &mut MemoryState,
        symbolic: Rc<Exp>,
        spec: Rc<Exp>,
        traces: &mut Traces,
    ) -> Result<(), SeError> {
        let effect = self
            .current_builder()
            .get(traces)
            .specialize(solver, mstate, symbolic, spec)?;
        traces.summary_info(format_args!("{effect}"));
        Ok(())
    }

    /// For the current building summary, grow an `Effect::Ret` node.
    ///
    /// If a non-panic `SeError` is produced during the construction, an `Effect::Panic`
    /// is grown instead.
    pub fn ret(&mut self, value: Rc<Exp>, mstate: &MemoryState, traces: &mut Traces) {
        match self.current_builder().get(traces).ret(value, mstate, false) {
            Ok(_) => traces.summary_info(format_args!("[Ret| .. ]")),
            Err(SeError::Panic(panic)) => panic.panic(traces),
            Err(err) => {
                self.panic(&err.to_string(), traces);
                println!("\n{}", traces);
                panic!()
            }
        }
    }

    /// Similar to `ret()`, but throwing an exception instead of returning normally.
    pub fn throw(&mut self, value: Rc<Exp>, mstate: &MemoryState, traces: &mut Traces) {
        match self.current_builder().get(traces).ret(value, mstate, true) {
            Ok(_) => traces.summary_info(format_args!("[Throw| .. ]")),
            Err(SeError::Panic(panic)) => panic.panic(traces),
            Err(err) => {
                self.panic(&err.to_string(), traces);
                println!("\n{}", traces);
                panic!()
            }
        }
    }

    /// End the building of the current summary. In the case that an old summary
    /// exists, the new summary is merged with the old one.
    pub fn end_build(&mut self, solver: &mut Solver, traces: &mut Traces) -> Panicable<()> {
        let scope = self
            .build_stack
            .pop()
            .ok_or_else(|| make_panic!("no building summaries"))?;

        self.leave(scope.clone());
        let mut summary = self.summaries.remove(&scope).unwrap();

        match summary.state {
            SummaryState::Build(state) => {
                let new = state.builder.done(solver)?;
                Summary::optimize(self, new.clone())?;
                Summary::merge(summary.root.clone(), new)?;
                Summary::check(summary.root.clone())?;
                summary.state = SummaryState::Apply(state.apply_states);
            }
            _ => throw_panic!("summary with scope {scope} is not in Build state"),
        }
        self.summaries.insert(scope.clone(), summary);
        traces.msg(format_args!(
            "finishing building summary with scope {scope}"
        ));
        Ok(())
    }

    /// End the applying of a summary, by reclaiming `applier`.
    pub fn end_apply(&mut self, applier: SummaryApplier, traces: &mut Traces) -> Panicable<()> {
        let scope = applier.scope();
        let summary = self.summaries.get_mut(scope).unwrap();
        traces.msg(format_args!(
            "finishing applying summary with scope {scope}"
        ));
        match &mut summary.state {
            SummaryState::Empty | SummaryState::Build(_) => {
                throw_panic!("summary with scope {scope} is not in Apply state")
            }
            SummaryState::Apply(states) => {
                states.pop().unwrap();
                applier.done()?
            }
        }
        Ok(())
    }

    /// Get the current `SymbolicState` that is associated with the symbolic descriptor
    /// `desc`, by querying the latest state of the `Summary` with a matching scope.
    pub fn symbolic_state(&self, desc: &SymbolicDesc) -> SymbolicState<Rc<Exp>> {
        if desc.scope().is_empty() {
            // Scope-less descriptors are always Referral
            SymbolicState::Referral
        } else {
            match &self.summary(desc.scope()).state {
                SummaryState::Empty => unreachable!(),
                SummaryState::Apply(_) => SymbolicState::Referral,
                SummaryState::Build(state) => {
                    state.builder.symbolic_states.get(desc).unwrap().clone()
                }
            }
        }
    }
}

impl Summary {
    fn builder(&mut self) -> Option<&mut SummaryBuilder> {
        match &mut self.state {
            SummaryState::Build(state) => Some(&mut state.builder),
            _ => None,
        }
    }

    /// Check the well-formedness of the summary tree starting from node `root`.
    /// The well-formedness is defined as follows:
    /// * Only the root should be `Root`;
    /// * Leaf nodes should only be `Panic`s, `Ret`s or impossible `Specialize(R)`s.
    /// * A `Specialize`'s siblings, if any, must also be `Specialize`s.
    /// * ...the same goes for `SpecializeR`s.
    /// * Parent pointers are correct.
    /// Any violation will cause a `Panic`.
    fn check(root: SummaryNodeRef) -> Panicable<()> {
        assert_or_throw!(
            matches!(root.borrow().effect, Effect::Root),
            "the root effect is not Root"
        );
        for succ in root.borrow().succs.iter() {
            Summary::check_r(succ.clone(), root.clone())?;
        }
        Ok(())
    }

    fn check_r(cur: SummaryNodeRef, parent: SummaryNodeRef) -> Panicable<()> {
        let guard = cur.borrow();
        if let Some(par) = guard.parent.upgrade() {
            assert_or_throw!(
                Rc::ptr_eq(&par, &parent),
                "parent pointer inconsistent at {}",
                guard.effect
            );
        } else {
            throw_panic!("parent pointer not accessible at {}", guard.effect);
        }

        let is_leaf = guard.succs.is_empty();
        match (is_leaf, &guard.effect) {
            (true, Effect::Panic(_) | Effect::Ret(_) | Effect::Specialize(_, _)) => return Ok(()),
            (true, _) => throw_panic!("effect {} should not be at leaf", guard.effect),
            (false, Effect::Panic(_) | Effect::Ret(_)) => {
                throw_panic!("effect {} should only be at leaf", guard.effect)
            }
            (false, Effect::Root) => throw_panic!("effect {} should only be at root", guard.effect),
            (false, Effect::Specialize(_, _) | Effect::Assume(_)) => {}
        }
        let mut check_effect: Option<std::cell::Ref<'_, SummaryNode>> = None;
        for succ in guard.succs.iter() {
            let guard = succ.borrow();
            match &guard.effect {
                Effect::Specialize(_, _) => {
                    if let Some(sibling) = &check_effect {
                        assert_or_throw!(
                            matches!(sibling.effect, Effect::Specialize(_, _)),
                            "not all siblings of {} are Specialize",
                            guard.effect
                        );
                    }
                    _ = check_effect.replace(guard);
                }
                _ => _ = check_effect.insert(guard),
            }
            Summary::check_r(succ.clone(), cur.clone())?;
        }
        Ok(())
    }

    /// Merging a new summary tree with root `new` into an old one with root `old`. `old`
    /// is grown **in-place**.
    ///
    /// Note: `new` is assumed to be a newly built summary. This specifically means that any
    /// `Effect::Specialize` will have no siblings.
    /// Also, `new` is no longer valid after merging.
    fn merge(old: SummaryNodeRef, new: SummaryNodeRef) -> Panicable<()> {
        let mut old_guard = old.as_ref().borrow_mut();
        let new_guard = new.as_ref().borrow_mut();

        // Empty old summary?
        if matches!(old_guard.effect, Effect::Root) && old_guard.succs.is_empty() {
            assert!(matches!(new_guard.effect, Effect::Root));
            for new_succ in new_guard.succs.iter() {
                new_succ.borrow_mut().parent = Rc::downgrade(&old);
                old_guard.succs.push(new_succ.clone());
            }
            return Ok(());
        }

        assert_or_throw!(
            std::mem::discriminant(&old_guard.effect) == std::mem::discriminant(&new_guard.effect),
            "old is {}, but new is {}",
            old_guard.effect,
            new_guard.effect
        );

        // Handle (potentially) new `Specialize`
        if new_guard.succs.len() == 1 {
            let new_succ_guard = new_guard.succs[0].borrow();
            let same_old_succ = match &new_succ_guard.effect {
                Effect::Specialize(_, new_value) => Some(
                    old_guard
                        .succs
                        .iter()
                        .find(|old_succ| {
                            let guard = old_succ.borrow();
                            if let Effect::Specialize(_, old_value) = &guard.effect {
                                old_value.eq(new_value).into()
                            } else {
                                false
                            }
                        })
                        .cloned(),
                ),
                _ => None,
            };
            if let Some(old_succ) = same_old_succ {
                if let Some(old_succ) = old_succ {
                    // The subtree may still be different
                    drop(new_succ_guard);
                    Summary::merge(old_succ.clone(), new_guard.succs[0].clone())?;
                } else {
                    // Merge the entire subtree right away
                    drop(new_succ_guard);
                    new_guard.succs[0].borrow_mut().parent = Rc::downgrade(&old);
                    old_guard.succs.push(new_guard.succs[0].clone());
                }
                return Ok(());
            }
        }

        // if new_guard.succs.len() == 0 {
        //     return Ok(());
        // }

        assert_or_throw!(
            old_guard.succs.len() == new_guard.succs.len(),
            "at {}, old is {}, but new has {}",
            old_guard.effect,
            old_guard.succs.len(),
            new_guard.succs.len(),
        );
        for (old_succ, new_succ) in old_guard.succs.iter().zip(new_guard.succs.iter()) {
            Summary::merge(old_succ.clone(), new_succ.clone())?;
        }
        Ok(())
    }

    /// Optimize the summary tree starting from the node `root`.
    /// The following passes are applied:
    /// * (MinimizeAssume) `Assume`s without siblings are discarded; by design, such assertions should be always true.
    /// * (MergeAssume) Equivalent sibiling `Assume` branches are merged, removing the `Assume`s.
    ///   The equivalence is determined based on the entire sub-tree.
    ///
    /// Note: since `SummaryApplier`s are direct views of one underlying summary tree, all
    /// optimizations passes must take care to not invalidate any on-going application.
    fn optimize(sman: &mut SummaryManager, root: SummaryNodeRef) -> Panicable<()> {
        Summary::minimize_assume(root.clone());
        Summary::merge_assume(sman, root.clone());
        Summary::check(root)
    }

    /// Minimize the `Assume` nodes in the summary tree, by deleting `Assume`s without siblings.
    fn minimize_assume(cur: SummaryNodeRef) {
        while cur.borrow().succs.len() == 1 {
            let guard = cur.borrow();
            let succ = guard.succs.get(0).unwrap().clone();
            let guard2 = succ.borrow();
            if matches!(guard2.effect, Effect::Assume(_)) {
                drop(guard);
                for grandson in guard2.succs.iter() {
                    grandson.as_ref().borrow_mut().parent = Rc::downgrade(&cur);
                }
                let mut guard = cur.as_ref().borrow_mut();
                guard.succs.pop();
                guard.succs.extend(guard2.succs.iter().cloned());
            } else {
                break;
            }
        }
        for succ in cur.borrow().succs.iter() {
            Summary::minimize_assume(succ.clone());
        }
    }

    /// Merge subtrees in the summary tree that have identical leaf nodes, by coloring
    /// the nodes.
    ///
    /// Subtree identity is determined with a coloring scheme:
    /// each node's color is determined by its effect and the colors of its children.
    ///
    /// For now, merging will not go past any `Effect::Specialize`. This is because these
    /// nodes represent only a part of the complete summary - while with some specialization
    /// value, the two branches may seem to have the same effect, it can not be assumed
    /// that some other unexplored specialization values will also be identical.
    /// Here's an example:
    /// ```c
    /// y = 0;
    /// if (x > 0) { y = 1; }
    /// switch (z /* let's say this specializes `z` */) {
    ///     case 0: return 0;
    ///     case 1: return y;
    ///     ..
    /// }
    /// ```
    /// The summary will first branch on Assume(x>0) and !Assume(x>0); in the case that z=0,
    /// the summary will look like both branches returns 0, but in the case that z=1, the
    /// return value is dependent on x.
    fn merge_assume(sman: &mut SummaryManager, cur: SummaryNodeRef) -> bool {
        // TODO: need to reset `color` once we implement in-place merging
        let mut guard = cur.borrow_mut();
        let mut safe = true;
        for succ in guard.succs.iter() {
            safe = Summary::merge_assume(sman, succ.clone()) && safe;
        }
        if !safe {
            return false;
        }

        let succ_colors: Vec<_> = match guard.succs.split_first() {
            Some((first, rest)) if matches!(first.borrow().effect, Effect::Assume(_)) => {
                // We have a layer of `Assume`s..
                let colors = first
                    .borrow()
                    .succs
                    .iter()
                    .map(|succ| succ.borrow().color.get())
                    .collect::<Vec<_>>();

                if rest.iter().all(|succ| {
                    let succ_guard = succ.borrow();
                    succ_guard
                        .succs
                        .iter()
                        .map(|succ| succ.borrow().color.get())
                        .eq(colors.iter().cloned())
                }) {
                    // ..and we can get rid of them!
                    let first = first.clone();
                    guard.succs.clear();
                    for succ in first.borrow().succs.iter() {
                        succ.borrow_mut().parent = Rc::downgrade(&cur);
                        guard.succs.push(succ.clone());
                    }
                    colors
                } else {
                    guard
                        .succs
                        .iter()
                        .map(|succ| succ.borrow().color.get())
                        .collect()
                }
            }
            _ => guard
                .succs
                .iter()
                .map(|succ| succ.borrow().color.get())
                .collect(),
        };

        if matches!(guard.effect, Effect::Specialize(_, _)) {
            return false;
        }

        let n_colors = sman.colors.len() + 1;
        let color = sman
            .colors
            .entry((guard.effect.clone(), succ_colors))
            .or_insert(n_colors as u32);
        guard.color.set(*color);
        true
    }
}

impl fmt::Display for Summary {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match &self.state {
            SummaryState::Empty => write!(f, "{}: Empty\n", self.scope),
            SummaryState::Build(_) => write!(f, "{}: Build\n", self.scope),
            SummaryState::Apply(_) => {
                write!(f, "{}: Apply\n", self.scope)?;
                self.root.as_ref().borrow().dump(1, true, false, f)
            }
        }
    }
}

impl fmt::Debug for Summary {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        match &self.state {
            SummaryState::Empty => write!(f, "{}: Empty\n", self.scope),
            SummaryState::Build(_) => write!(f, "{}: Build\n", self.scope),
            SummaryState::Apply(_) => {
                write!(f, "{}: Apply\n", self.scope)?;
                self.root.as_ref().borrow().dump(1, true, true, f)
            }
        }
    }
}
