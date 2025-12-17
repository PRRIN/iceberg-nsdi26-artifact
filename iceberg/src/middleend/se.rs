//! This module implements the core of Iceberg, that is
//! (S)ymbolic (E)xecution.
//!
//! (For now) Iceberg sticks to full-path symbolic execution,
//! meaning that every branch is explored, with no state merging
//! techniques. This is due to the need for auto-summary.
//!
//! The SE engine manages its state with two modules: `ValueState`
//! manages named variables, while `MemoryState` manages named
//! memory locations. See the documentation in `se::value_state`
//! and `se::memory_state` for more information.

pub mod builtin;
pub mod config;
pub mod error;
mod exec;
pub mod memory_state;
pub mod summary;
mod trace;
pub mod value_state;

use crate::backend::*;
use crate::middleend::*;
use crate::panic::*;
use crate::util::{Counted, StringRef};
pub use builtin::{BuiltinIterator, BuiltinManager};
use config::Config;
pub use error::SeError;
pub use memory_state::{MemoryDesc, MemoryLayout, MemorySnapshot, MemoryState, RegionDesc};
pub use see_builder::{Configured, Init, Parsed, SeeBuilder};
use std::rc::Rc;
pub use summary::SummaryManager;
use summary::{SummaryApplier, SymbolicState};
use trace::Traces;
pub use value_state::{ValueDesc, ValueState};

/// A (s)ymbolic (e)xecution (e)ngine.
///
/// A `See` manages all states necessary during the entire analysis
/// of the associated `Ast`. It provides the core methods for summarizing
/// a `Function` in the `Ast`, executing `Exp`s statefully, etc.
///
/// The `See` is a complex structure that requires multi-step initialization.
/// The `SeeBuilder` object handles the construction of `See` using a type-state
/// pattern.
pub struct See {
    ast: Ast,
    config: Config,
    vstate: ValueState,
    mstate: MemoryState,
    sman: SummaryManager,
    bman: BuiltinManager,
    walkstack: WalkStack,
    traces: Traces,

    /// The backend solver instance.
    solver: Solver,
}

mod see_builder {
    //! This module implemnets the type-state pattern for building an instance of `See`.

    use super::*;
    use std::collections::HashMap;

    /// Builder for a `See` using the type-state pattern.
    pub struct SeeBuilder<S: SeeBuilderState> {
        /// The internal `See` object that may be half-initialized.
        see: See,
        /// Ensure the type state is used.
        _marker: std::marker::PhantomData<S>,
    }

    // --- Type state options for `SeeBuilder` ---
    pub enum Init {} // Initial state
    pub enum Parsed {} // Parsed a primary frontend file
    pub enum Configured {} // Parsed an extra config file (and SPEC file)

    pub trait SeeBuilderState {}
    impl SeeBuilderState for Init {}
    impl SeeBuilderState for Parsed {}
    impl SeeBuilderState for Configured {}

    impl SeeBuilder<Init> {
        pub fn new() -> Self {
            let config = Config::default();
            let bman = BuiltinManager::new(&config);
            let see = See {
                ast: Ast {
                    functions: HashMap::new(),
                    global_inits: Vec::new(),
                    eta: HashMap::new(),
                },
                config,
                vstate: ValueState::new(),
                mstate: MemoryState::new(),
                sman: SummaryManager::new(),
                bman,
                walkstack: Vec::new(),
                traces: Traces::new(),
                solver: Solver::new(),
            };
            SeeBuilder {
                see,
                _marker: std::marker::PhantomData::default(),
            }
        }

        /// Access the `ValueState` of the building `See`.
        pub fn vstate(&self) -> &ValueState {
            &self.see.vstate
        }

        /// Access the `ValueState` of the building `See`, mutably.
        pub fn vstate_mut(&mut self) -> &mut ValueState {
            &mut self.see.vstate
        }

        /// Access the `Traces` of the building `See`.
        pub fn traces(&self) -> &Traces {
            &self.see.traces
        }

        /// Consume an `ast`, replacing the internal one, and initialize
        /// other components properly.
        pub fn parse(mut self, ast: Ast) -> SeeBuilder<Parsed> {
            let See {
                vstate,
                mstate,
                sman,
                ..
            } = &mut self.see;
            let mut vdescs = Vec::new();
            let mut mdescs = Vec::new();
            for (name, init) in &ast.global_inits {
                match init {
                    Initializer::ByValue(exp) => {
                        let vdesc = vstate.global(name);
                        vstate.put(&vdesc, exp.clone());
                        vdescs.push((vdesc, exp.clone()));
                    }
                    Initializer::InMemory(exp, constant) => {
                        let mdesc = mstate
                            .alloc_global(exp.clone(), name.clone(), *constant)
                            .unwrap();
                        let ptr = Exp::pointer_literal(mdesc.clone());
                        let vdesc = vstate.global(name);
                        vstate.put(&vdesc, ptr);
                        mdescs.push((mdesc, exp.clone()));
                    }
                    Initializer::Undef(ty) => {
                        let havoc = Exp::havoc(ty.clone());
                        let mdesc = mstate.alloc_global(havoc, name.clone(), true).unwrap();
                        let ptr = Exp::pointer_literal(mdesc.clone());
                        let vdesc = vstate.global(name);
                        vstate.put(&vdesc, ptr);
                    }
                }
            }

            // Add target scopes
            for scope in ast.functions.keys() {
                sman.add_scope(scope.clone()).unwrap();
            }

            // Execute initializers to resolved named references
            for (vdesc, exp) in vdescs {
                let exp = self.see.exec(exp).unwrap();
                self.see.vstate.put(&vdesc, exp);
            }
            for (mdesc, exp) in mdescs {
                let exp = self.see.exec(exp).unwrap();
                if exp.ty().get_layout(self.see.mstate_mut()).unwrap().size > 0 {
                    self.see.mstate.store(&mdesc, exp, true).unwrap();
                }
            }

            // Update Ast
            self.see.ast = ast;

            SeeBuilder {
                see: self.see,
                _marker: std::marker::PhantomData::default(),
            }
        }
    }

    impl SeeBuilder<Parsed> {
        /// Access the `ValueState` of the building `See`.
        pub fn vstate(&self) -> &ValueState {
            &self.see.vstate
        }

        /// Access the `ValueState` of the building `See`, mutably.
        pub fn vstate_mut(&mut self) -> &mut ValueState {
            &mut self.see.vstate
        }

        /// Access the `Traces` of the building `See`.
        pub fn traces(&self) -> &Traces {
            &self.see.traces
        }

        pub fn ast(&mut self) -> &mut Ast {
            &mut self.see.ast
        }

        /// Finish building and produces an instance of `See`.
        pub fn ok(self) -> See {
            self.see
        }

        /// Consume a `config`, replacing the internal one, and initialize
        /// relevant fields.
        pub fn config(mut self, config: Config) -> SeeBuilder<Configured> {

            // Include SPEC hints.
            if let Some(spec_file) = config.summary_spec_file() {
                crate::glue::spice::ast_merge_spec(&mut self, spec_file);
            }

            let mut see = self.see;

            // Install precondtions
            let ty = Type::mk_bool();
            for (func_name, precond) in config.summary_preconds() {
                let func = Rc::get_mut(
                    see
                        .ast
                        .functions
                        .get_mut(func_name.as_str())
                        .unwrap()
                ).unwrap(); // ..only us should be holding functions right now
                    
                let func_name = StringRef::from(func_name.as_str());
                let args = func
                    .args
                    .iter()
                    .map(|(desc, ty)| Exp::var(desc.clone(), ty.clone()))
                    .collect();

                let funct = Exp::ident(ty.clone(), precond.as_str().into());
                let assign = Exp::var(
                    see.vstate.local(func_name.as_ref(), ".precond"),
                    ty.clone(),
                );

                let cfg = &mut func.cfg;
                let entry = cfg.entry().unwrap();
                let precond_node = cfg.func_call_node(
                    assign.clone(),
                    funct,
                    args,
                )
                .unwrap();

                let yes = cfg.assume_node(assign.clone()).unwrap();
                let no = cfg.assume_node(Exp::not(assign).unwrap()).unwrap();
                let panic = cfg.panic_node(Some("failed precondition".to_string()));

                cfg.connect(precond_node, yes).unwrap();
                cfg.connect(precond_node, no).unwrap();
                cfg.connect(yes, entry).unwrap();
                cfg.connect(no, panic).unwrap();
                cfg.set_entry(precond_node);
            }

            // Install oracles
            let unit = Type::mk_unit();
            for (func_name, oracle) in config.summary_oracles() {
                if let Some(func) = see.ast.functions.get_mut(func_name.as_str()) {
                    let func_name = StringRef::from(func_name.as_str());
                    let func = Rc::get_mut(func).unwrap();  
                    // ..only us should be holding functions right now

                    let args = func
                        .args
                        .iter()
                        .map(|(desc, ty)| Exp::var(desc.clone(), ty.clone()))
                        .collect();

                    let funct = Exp::ident(unit.clone(), oracle.as_str().into());
                    let ret_desc = see.vstate.local(func_name.as_ref(), ValueDesc::RET_VAL);
                    let assign = Exp::var(ret_desc.clone(), func.ret_ty.clone());

                    let ex_flg = Exp::var(
                        see.vstate.local(func_name.as_ref(), ValueDesc::EX_FLG),
                        Type::mk_bool(),
                    );

                    let cfg = &mut func.cfg;
                    let oracle = cfg.func_call_node(
                        assign.clone(),
                        funct,
                        args,
                    )
                    .unwrap();

                    let ok_node = cfg.assume_node(Exp::not(ex_flg.clone()).unwrap()).unwrap();
                    let ex_node = cfg.assume_node(ex_flg).unwrap();
                    let ret_node = cfg.return_node(false);
                    let throw_node = cfg.return_node(true);

                    cfg.connect(oracle, ok_node).unwrap();
                    cfg.connect(oracle, ex_node).unwrap();
                    cfg.connect(ok_node, ret_node).unwrap();
                    cfg.connect(ex_node, throw_node).unwrap();
                    cfg.set_entry(oracle);
                } else {
                    let oracle = see.ast.functions.get(oracle.as_str()).unwrap().clone();
                    _ = see.ast.functions.insert(func_name.as_str().into(), oracle);
                }
            }

            // Update the builtin model
            see.bman = BuiltinManager::new(&config);
            see.config = config;

            SeeBuilder {
                see,
                _marker: std::marker::PhantomData::default(),
            }
        }
    }

    impl SeeBuilder<Configured> {
        pub fn ok(self) -> See {
            self.see
        }
    }
}

type WalkStack = Vec<WalkState>;
type WalkStateDelta = u8;

const DELTA_NONE: WalkStateDelta = 0;
const DELTA_STATES: WalkStateDelta = 0b1;
const DELTA_SUMMAN: WalkStateDelta = 0b10;
const DELTA_SOLVER: WalkStateDelta = 0b100;
const DELTA_BIND: WalkStateDelta = 0b1000;

/// Intermediate state for iterative DFS walking of the CFG.
enum WalkState {
    /// Entering a node.
    Entry(CfgNodeRef, WalkStateDelta),
    /// Leaving a node.
    Tail(WalkStateDelta),
    /// Iterating over a node.
    Iteration(CfgNodeRef, Box<WalkIterator>),
}

#[allow(unused)]
enum WalkIterator {
    /// Applying a function summary.
    Apply(usize, SummaryApplier),
    /// Walking a function, treating it as inlined.
    Inline(usize, Rc<Function>, WalkStack, bool /* first */),
    /// Walking a builtin that branches.
    Builtin(BuiltinIterator),
}

impl See {
    // /// Reset the `See` instance back to the state when created by
    // /// `See::new()`.
    // pub fn reset(&mut self) {
    //     self.vstate.reset();
    //     self.mstate.reset();
    //     self.sman.reset();
    //     self.traces.reset();
    //     self.solver.reset();

    //     self.walkstack.clear();
    // }

    /// Statically *evaluate* `exp`, returning the (perhaps) simplified `Exp`.
    ///
    /// The evaluation is static, in that it refuses to handle any
    /// side effects or `ValueState`/`MemoryState` related updates.
    ///
    /// To dynamically *execute* an `Exp` with `ValueState`/`MemoryState`,
    /// use `See::exec()`.
    pub fn eval(&mut self, exp: Rc<Exp>) -> Option<Rc<Exp>> {
        match exec::exec(exp, &mut exec::ExecMode::Eval) {
            Ok(exp) => Some(exp),
            Err(SeError::Panic(panic)) => panic.panic(&self.traces),
            Err(_) => None,
        }
    }

    /// Dynamically *execute* `exp` under the current associated states,
    /// returning a resulting `Exp`.
    ///
    /// The associated states may be modified after this call, so use with
    /// caution: `Exp`s with side-effects should generally be `exec()`-ed only
    /// once before being `pop()`-ed.
    pub fn exec(&mut self, exp: Rc<Exp>) -> Option<Rc<Exp>> {
        match exec::exec(exp, &mut exec::ExecMode::Exec(self)) {
            Ok(exp) => Some(exp),
            Err(SeError::Panic(panic)) => panic.panic(&self.traces),
            Err(err) => {
                self.traces
                    .msg(format_args!("execution produces error: {err}"));
                None
            }
        }
    }

    /// Execute `exp`, under the "Spec" mode.
    pub fn exec_spec(&mut self, exp: Rc<Exp>) -> Option<Rc<Exp>> {
        match exec::exec(exp, &mut exec::ExecMode::Spec(self)) {
            Ok(exp) => Some(exp),
            Err(SeError::Panic(panic)) => panic.panic(&self.traces),
            Err(err) => {
                self.traces
                    .msg(format_args!("execution produces error: {err}"));
                None
            }
        }
    }

    pub fn ast(&self) -> &Ast {
        &self.ast
    }

    pub fn config(&self) -> &Config {
        &self.config
    }

    pub fn vstate(&self) -> &ValueState {
        &self.vstate
    }

    pub fn vstate_mut(&mut self) -> &mut ValueState {
        &mut self.vstate
    }

    pub fn mstate(&self) -> &MemoryState {
        &self.mstate
    }

    pub fn mstate_mut(&mut self) -> &mut MemoryState {
        &mut self.mstate
    }

    pub fn sman(&mut self) -> &mut SummaryManager {
        &mut self.sman
    }

    pub fn solver(&self) -> &Solver {
        &self.solver
    }

    pub fn traces(&self) -> &Traces {
        &self.traces
    }

    pub fn alloc_global(
        &mut self,
        exp: Rc<Exp>,
        global_name: StringRef,
        constant: bool,
    ) -> Panicable<MemoryDesc> {
        self.mstate.alloc_global(exp, global_name, constant)
    }

    pub fn alloc_global_unwritable(
        &mut self,
        exp: Rc<Exp>,
        global_name: StringRef,
    ) -> Panicable<MemoryDesc> {
        self.mstate.alloc_global_unwritable(exp, global_name)
    }

    pub fn alloc_heap(&mut self, ty: Rc<Type>, zero_init: bool) -> Panicable<MemoryDesc> {
        let mdesc = self.mstate.alloc_heap(ty, zero_init)?;
        Ok(mdesc)
    }

    /// Summarize function `func`, with symbolic execution.
    ///
    /// Returns `false` if a summary for `func_name` is already being built.
    #[must_use]
    pub fn summarize(&mut self, func_name: StringRef, args: &Vec<Rc<Exp>>) -> bool {
        let Some(func) = self.ast.functions.get(&func_name).cloned() else {
            make_panic!("{func_name} is not registered").panic(&self.traces)
        };

        let entry = CfgNodeRef { 
            func: func.clone(), 
            node: func.cfg.entry().unwrap(),
        };

        // start building, and prepare memory
        if !self
            .sman
            .start_build(&self.mstate, func_name.clone(), &mut self.traces)
        {
            return false;
        }

        self.mstate.push();
        self.vstate.push();
        self.traces.push();

        // prepare arguments by wrapping them as symbolic values
        assert_eq!(args.len(), func.args.len());
        for ((desc, aty), arg) in func.args.iter().zip(args.iter()) {
            assert!(
                type_eq!(arg.ty(), *aty),
                "expect {}, found {}",
                aty,
                arg.ty()
            );
            self.vstate.put(desc, arg.clone());
            let symbolic = SymbolicDesc::from_vdesc(self, desc, aty.clone()).get(self.traces());
            self.vstate.put(desc, symbolic);
        }

        // walk!
        let mut walkstack = vec![WalkState::Entry(entry, DELTA_NONE)];
        self.switch_stack(&mut walkstack);
        self.walk(false);
        self.switch_stack(&mut walkstack);

        // end building
        self.traces.pop();
        self.mstate.pop();
        self.vstate.pop();
        self.sman
            .end_build(&mut self.solver, &mut self.traces)
            .get(self.traces());

        true
    }

    /// Swap the current walkstack in `self` and `walkstack`.
    fn switch_stack(&mut self, walkstack: &mut Vec<WalkState>) {
        std::mem::swap(&mut self.walkstack, walkstack);
    }

    /// Walk the CFG using the current walkstack.
    ///
    /// At any point during the visit of the current node, a `SeError` may be produced.
    /// The `SeError::Panic` variant will cause a panic and trace dump directly. Any other
    /// variants simply cause `walk()` to visit the next state, effectively pruning all
    /// subsequent paths.
    ///
    /// If `inlined`, `walk()` will return whenever reaching a `CfgNode::Return`; otherwise,
    /// `walk()` returns when all paths in the `walkstack` are walked.
    fn walk(&mut self, inlined: bool) {
        while let Some(state) = self.walkstack.pop() {
            match state {
                WalkState::Entry(cur, delta) => {
                    if delta & DELTA_STATES != 0 {
                        self.vstate.push();
                        self.mstate.push();
                        self.traces.push();
                    }
                    self.traces.visit(cur.clone());
                    _ = match cur.as_ref() {
                        CfgNode::Assume(_) => self.walk_entry_assume(cur, delta),
                        CfgNode::FuncCall(_) => self.walk_entry_func(cur),
                        CfgNode::Let(_) => self.walk_entry_let(cur),
                        CfgNode::Panic(_) => self.walk_panic(cur),
                        CfgNode::Return(node) => {
                            self.vstate.put(&cur.func.ex_flag(), if node.exception { Exp::true_exp() } else { Exp::false_exp()});

                            if inlined { return }
                            self.walk_return(cur)
                        }
                        CfgNode::Label(_) | CfgNode::Noop(_) => {
                            /* No-op */
                            self.walkstack.push(WalkState::Tail(delta));
                            self.walk_next(cur);
                            Some(())
                        }
                    }
                }
                WalkState::Tail(delta) => {
                    if delta & DELTA_STATES != 0 {
                        self.traces.pop();
                        self.mstate.pop();
                        self.vstate.pop();
                    }
                    if delta & DELTA_SUMMAN != 0 {
                        self.sman.regress(&mut self.solver).get(self.traces());
                    }
                    if delta & DELTA_SOLVER != 0 {
                        self.solver.pop();
                    }
                }
                WalkState::Iteration(cur, iterator) => {
                    _ = self.walk_iter(cur, iterator);
                }
            }
        }
    }

    /// Initial handling of a function node: retrieve the function called, check for
    /// builtin shortcuts, and perform type checks.
    fn walk_func_prologue(
        &mut self,
        cur: CfgNodeRef,
        node: &FuncCallNode,
        conc: bool,
    ) -> Result<Rc<Function>, bool> {
        // Get the function that is called
        let funct = self.exec_spec(node.funct.clone()).ok_or(false)?;
        let func_name = match funct.as_ref() {
            Exp::Ident(vdata) => &vdata.ident,
            _ => make_panic!("Unresolved function {} when visiting {node}", node.funct)
                .panic(&self.traces),
        };

        if let Some(builtin_func) = self.bman.resolve(func_name) {
            /*
                Almost all builtin functions don't throw exceptions, so we
                set the exception flag to false here.
                Any exceptions to that (ha!) can be handled inside the builtin.
             */
            self.vstate.put(cur.func.ex_flag(), Exp::false_exp());
            let cont = builtin_func(self, cur, conc).get(self.traces());
            return Err(cont);
        }

        let Some(function) = self.ast.functions.get(func_name) else {
            make_panic!("Undefined name {func_name} when visiting {node}").panic(&self.traces)
        };

        // Type check
        #[cfg(feature = "traces")]
        {
            let found = Type::mk_lambda(
                function.ret_ty.clone(),
                function
                    .args
                    .iter()
                    .map(|(_, ty)| ty.clone())
                    .collect::<Vec<_>>(),
                false,
            );
            let expected = Type::mk_lambda(
                node.assign.ty(),
                node.args.iter().map(|arg| arg.ty()).collect::<Vec<_>>(),
                false,
            );
    
            if !type_eq!(function.ret_ty.clone(), node.assign.ty()) {
                make_type_mismatch!(found, expected).panic(&self.traces)
            }
    
            if function.args.len() != node.args.len() {
                make_type_mismatch!(found, expected).panic(&self.traces)
            }
    
            for ((_, found_arg), expected_arg) in function.args.iter().zip(node.args.iter()) {
                let expected_arg_ty = expected_arg.ty();
                if !type_eq!(*found_arg, expected_arg_ty) {
                    make_type_mismatch!(found, expected).panic(&self.traces)
                }
            }
        }

        Ok(function.clone())
    }

    #[inline]
    fn walk_next(&mut self, cur: CfgNodeRef) {
        // Need to save states if there are multiple successors..
        let node = cur.as_ref();
        let delta = if node.succ().len() > 1 {
            DELTA_STATES
        } else {
            DELTA_NONE
        };
        for succ in node.succ().iter().rev() {
            self.walkstack.push(WalkState::Entry(CfgNodeRef { func: cur.func.clone(), node: *succ }, delta));
        }
    }

    fn walk_entry_assume(
        &mut self,
        cur: CfgNodeRef,
        mut delta: WalkStateDelta,
    ) -> Option<()> {
        let CfgNode::Assume(node) = cur.as_ref() else { unreachable!() };
        let cond = self.exec(node.condition.clone())?;

        let mut sat = matches!(exp_as_bool!(cond), Some(true));
        if !sat {
            delta |= DELTA_SOLVER;
            self.solver.push();
            self.solver
                .assert(cond.clone(), &self.mstate)
                .get(self.traces());
            sat = self.solver.check().into();
        }
        if sat {
            delta |= DELTA_SUMMAN;
            self.sman.branch().get(self.traces());
            self.sman.assume(cond, &mut self.traces);

            self.walkstack.push(WalkState::Tail(delta));
            self.walk_next(cur);
            return Some(());
        }
        // otherwise, decideably unsatisfiable; prune
        self.walkstack.push(WalkState::Tail(delta));
        Some(())
    }

    fn walk_entry_func(&mut self, cur: CfgNodeRef) -> Option<()> {
        let CfgNode::FuncCall(node) = cur.as_ref() else { unreachable!() };
        let function = match self.walk_func_prologue(cur.clone(), node, false) {
            Ok(function) => function,
            Err(true) => {
                self.walk_next(cur);
                return Some(());
            }
            Err(false) => return Some(()),
        };

        let func_name = &function.name;
        let params = function.args.iter().cloned().collect::<Vec<_>>();

        // Bind function arguments
        let mut args = node
            .args
            .iter()
            .map(|arg| self.exec(arg.clone()))
            .collect::<Option<Vec<_>>>()?;
        self.vstate.push();
        let v_epoch = self.vstate.epoch();
        for ((vdesc, aty), arg_exp) in params.iter().zip(args.iter_mut()) {
            if !type_eq!(arg_exp.ty(), *aty) {
                make_panic!("{func_name} expects {aty}, found {}", arg_exp.ty())
                    .panic(self.traces());
            }
            self.vstate.put(vdesc, arg_exp.clone());
        }

        let applier = if !self.sman.has_scope(func_name)
            || self.config.summary_inlined().contains(func_name.as_ref())
        {
            None
        } else {
            // Apply if possible...
            self.sman
                .start_apply(func_name.clone(), &mut self.traces, Some(args.clone()))
                .or_else(|| {
                    // ...or, try building the summary first
                    if self.summarize(
                        func_name.clone(),
                        &args.iter().map(|arg| arg.clone()).collect(),
                    ) {
                        let applier = self
                            .sman
                            .start_apply(func_name.clone(), &mut self.traces, None)
                            .unwrap();
                        Some(applier)
                    } else {
                        // ...recursion!
                        // resort to inline walking
                        None
                    }
                })
        };

        if let Some(applier) = applier {
            self.walk_iter(cur, Box::new(WalkIterator::Apply(v_epoch, applier)));
        } else {
            self.sman.enter(func_name.clone());
            let entry = CfgNodeRef { func: function.clone(), node: function.cfg.entry().unwrap() };
            let walkstack = vec![WalkState::Entry(entry, DELTA_NONE)];
            self.walk_iter(
                cur,
                Box::new(WalkIterator::Inline(
                    v_epoch,
                    function,
                    walkstack,
                    true,
                )),
            );
        }
        Some(())
    }

    fn walk_entry_let(&mut self, cur: CfgNodeRef) -> Option<()> {
        let CfgNode::Let(node) = cur.as_ref() else { unreachable!() };
        let vdesc = &exp_as_data!(node.lexp, Exp::Var).desc;
        let exp = self.exec(node.rexp.clone())?;
        self.traces.msg(format_args!("{exp} -> {vdesc}"));
        self.vstate.put(vdesc, exp);
        self.walk_next(cur);
        Some(())
    }

    fn walk_panic(&mut self, cur: CfgNodeRef) -> Option<()> {
        let CfgNode::Panic(node) = cur.as_ref() else { unreachable!() };
        let msg = node
            .message
            .clone()
            .unwrap_or_else(|| "(no msg)".to_string());
        self.sman.panic(msg, &mut self.traces);
        Some(())
    }

    fn walk_return(&mut self, cur: CfgNodeRef) -> Option<()> {
        let CfgNode::Return(node) = cur.as_ref() else { unreachable!() };
        if node.exception {
            let value = self.vstate.get(cur.func.throwval())
                .unwrap_or_else(|| {
                    println!("\n{}", self.traces());
                    panic!()
                });
            self.sman.throw(value, &self.mstate, &mut self.traces);
        } else {
            let value = self.vstate.get(cur.func.retval()).unwrap();
            self.sman.ret(value, &self.mstate, &mut self.traces);
        }
        Some(())
    }

    fn walk_iter(&mut self, cur: CfgNodeRef, mut iterator: Box<WalkIterator>) {
        let CfgNode::FuncCall(node) = cur.as_ref() else {
            unreachable!()
        };
        match iterator.as_mut() {
            WalkIterator::Apply(_, applier) => {
                if let Some((retval, is_throw)) = applier.next(self) {
                    // ...go further
                    // Note: `retval` must be executed inside `SummaryApplier::next()`

                    if is_throw {
                        let assign = cur.func.throwval();
                        self.traces.msg(format_args!("{retval} -> {assign}"));
                        self.vstate.put(assign, retval);
                        self.vstate.put(cur.func.ex_flag(), Exp::true_exp());
                    } else {
                        let assign = &exp_as_data!(node.assign, Exp::Var).desc;
                        self.traces.msg(format_args!("{retval} -> {assign}"));
                        self.vstate.put(assign, retval);
                        self.vstate.put(cur.func.ex_flag(), Exp::false_exp());
                    }
                    self.walkstack
                        .push(WalkState::Iteration(cur.clone(), iterator));
                    self.walk_next(cur);
                }
                // ...applier drained
                else {
                    let WalkIterator::Apply(v_epoch, applier) = *iterator else {
                        unreachable!()
                    };
                    self.sman
                        .end_apply(applier, &mut self.traces)
                        .get(self.traces());

                    // Unbind function arguments
                    if v_epoch != self.vstate.epoch() {
                        make_panic!(
                            "ValueState epoch started as {v_epoch}, but ends as {}",
                            self.vstate.epoch()
                        )
                        .panic(self.traces());
                    }
                    self.vstate.pop();
                }
            }
            WalkIterator::Inline(v_epoch, function, walkstack, first) => {
                if !*first {
                    // Pop the previous return value
                    self.traces.msg(format_args!("return to inlined {}", function.name));
                    self.vstate.pop();
                    self.vstate.unstash().get(self.traces());
                } else {
                    self.traces.msg(format_args!("start inlining {}", function.name));
                    *first = false;
                }

                self.switch_stack(walkstack);
                self.walk(true);
                if !self.walkstack.is_empty() {
                    self.traces.msg(format_args!("leave inlined {}", function.name));

                    let is_throw = exp_as_bool!(self.vstate.get(function.ex_flag()).unwrap()).unwrap();
                    let retval = if is_throw {
                        self.vstate.get(&function.throwval()).unwrap()
                    } else {
                        self.vstate.get(&function.retval()).unwrap()
                    };

                    // Stash inlined values...
                    self.vstate.stash(*v_epoch);

                    // ...bind return value
                    self.vstate.push();

                    if is_throw {
                        let assign = cur.func.throwval();
                        self.traces.msg(format_args!("{retval} -> {assign}"));
                        self.vstate.put(assign, retval);
                        self.vstate.put(cur.func.ex_flag(), Exp::true_exp());
                    } else {
                        let assign = &exp_as_data!(node.assign, Exp::Var).desc;
                        self.traces.msg(format_args!("{retval} -> {assign}"));
                        self.vstate.put(assign, retval);
                        self.vstate.put(cur.func.ex_flag(), Exp::false_exp());
                    }

                    //　...go further
                    self.switch_stack(walkstack);
                    self.walkstack
                        .push(WalkState::Iteration(cur.clone(), iterator));
                    self.walk_next(cur);
                } else {
                    // Unbind function arguments
                    self.traces.msg(format_args!("end inlining {}", function.name));
                    if *v_epoch != self.vstate.epoch() {
                        make_panic!(
                            "ValueState epoch started as {v_epoch}, but ends as {}",
                            self.vstate.epoch()
                        )
                        .panic(self.traces());
                    }
                    self.vstate.pop();
                    self.sman.leave(function.name.clone());
                    self.switch_stack(walkstack);
                }
            }
            WalkIterator::Builtin(it) => {
                let cont = it.next(self);
                if cont {
                    self.walkstack
                        .push(WalkState::Iteration(cur.clone(), iterator));
                    self.walk_next(cur);
                }
            }
        }
    }
}

#[cfg(test)]
mod tests {

    use super::*;
    use crate::glue::llvm::tests::*;
    use std::{fs, io::Write};

    fn get_summary_outfile(filename: &str) -> fs::File {
        let mut file_path = std::env::current_dir().expect("failed to get current directory");
        file_path.push("test");
        file_path.push("summary");
        file_path.push(filename);
        fs::OpenOptions::new()
            .create(true)
            .truncate(true)
            .write(true)
            .open(file_path)
            .expect("cannot open summary outfile")
    }

    fn make_char_array(with: &str) -> Rc<Exp> {
        let bytes = with.as_bytes();
        let len = bytes.len();
        let cty = Type::mk_bitvec(8);
        let elems: Vec<_> = (0..len)
            .map(|i| Exp::int_literal(bytes[i] as i64, Some(8)).unwrap())
            .collect();
        let ty = Type::mk_array(len, cty.clone());
        Exp::vector(ty, elems).unwrap()
    }

    fn make_pointer_with_array(see: &mut See, array: Rc<Exp>, alloc_name: StringRef) -> Rc<Exp> {
        let See { mstate, .. } = see;
        let mdesc = mstate
            .alloc_global(array.clone(), alloc_name, true)
            .unwrap();
        Exp::pointer_literal(mdesc)
    }

    #[test]
    fn se_summarize_simple_func1() -> Panicable<()> {
        let mut file = get_summary_outfile("simple_func1.txt");
        let mut see = llvm_glue_simple();
        assert!({
            let ty = Type::mk_bitvec(32);
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;

            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty)?;

            see.summarize("@func1".into(), &vec![arg0, arg1])
        });
        let summary = see.sman.summary("@func1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_simple_func2() -> Panicable<()> {
        let mut file = get_summary_outfile("simple_func2.txt");
        let mut see = llvm_glue_simple();
        assert!({
            let ty = Type::mk_bitvec(32);
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;

            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty)?;

            see.summarize("@func2".into(), &vec![arg0, arg1])
        });
        let summary = see.sman.summary("@func2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_simple_func3() -> Panicable<()> {
        let mut file = get_summary_outfile("simple_func3.txt");
        let mut see = llvm_glue_simple();
        assert!({
            let ty = Type::mk_bitvec(32);
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;

            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty)?;

            see.summarize("@func3".into(), &vec![arg0, arg1])
        });
        let summary = see.sman.summary("@func3");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_simple_func4() -> Panicable<()> {
        let mut file = get_summary_outfile("simple_func4.txt");
        let mut see = llvm_glue_simple();
        assert!({
            let ty = Type::mk_bitvec(32);
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;

            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty)?;

            see.summarize("@func4".into(), &vec![arg0, arg1])
        });
        let summary = see.sman.summary("@func4");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_data() -> Panicable<()> {
        let mut file = get_summary_outfile("data.txt");
        let mut see = llvm_glue_data();

        let ty = Type::mk_bitvec(32);
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;
            see.summarize("@satMul3".into(), &vec![arg0])
        });
        let summary = see.sman.summary("@satMul3");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        assert!({
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty.clone())?;
            let arg2 = see.vstate_mut().global("arg2".into());
            let arg2 = SymbolicDesc::from_vdesc(&mut see, &arg2, ty.clone())?;
            let arg3 = see.vstate_mut().global("arg3".into());
            let arg3 = SymbolicDesc::from_vdesc(&mut see, &arg3, ty.clone())?;
            let arg4 = see.vstate_mut().global("arg4".into());
            let arg4 = SymbolicDesc::from_vdesc(&mut see, &arg4, ty)?;
            see.summarize("@test".into(), &vec![arg1, arg2, arg3, arg4])
        });
        let summary = see.sman.summary("@test");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_store() -> Panicable<()> {
        let mut file = get_summary_outfile("store.txt");
        let mut see = llvm_glue_store();

        assert!({
            let argc = Exp::int_literal(4, Some(32))?;
            let argv0 = {
                let array = make_char_array("store\0");
                make_pointer_with_array(&mut see, array, "Test::argv0".into())
            };
            let argv1 = {
                let array = make_char_array("argv1\0");
                make_pointer_with_array(&mut see, array, "Test::argv1".into())
            };
            let argv2 = {
                let array = make_char_array("argv2\0");
                make_pointer_with_array(&mut see, array, "Test::argv2".into())
            };
            let argv3 = {
                let array = make_char_array("argv3\0");
                make_pointer_with_array(&mut see, array, "Test::argv3".into())
            };
            let argv = {
                let elem_ty = argv0.ty();
                let ty = Type::mk_array(4, elem_ty.clone());
                let array = Exp::vector(ty, vec![argv0, argv1, argv2, argv3])?;
                make_pointer_with_array(&mut see, array, "Test::argv".into())
            };
            see.summarize("@main".into(), &vec![argc, argv])
        });

        assert!(see.summarize("@test_list_local".into(), &vec![]));

        assert!({
            let a = Exp::int_literal(1, Some(32)).unwrap();
            let b = Exp::int_literal(2, Some(32)).unwrap();
            let c = Exp::int_literal(3, Some(32)).unwrap();
            see.summarize("@test_list_global".into(), &vec![a, b, c])
        });

        let summary = see.sman.summary("@main");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        let summary = see.sman.summary("@test_list_local");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        let summary = see.sman.summary("@test_list_global");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        let summary = see.sman.summary("@list_sum");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@init");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@list_push_back");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_panic() -> Panicable<()> {
        let mut file = get_summary_outfile("panic.txt");
        let mut see = llvm_glue_panic();

        let ty = Type::mk_bitvec(32);
        assert!({
            let a = Exp::int_literal(-1, Some(32))?;
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty.clone())?;
            let arg2 = see.vstate_mut().global("arg2".into());
            let arg2 = SymbolicDesc::from_vdesc(&mut see, &arg2, ty)?;
            see.summarize("@nested".into(), &vec![a, arg1, arg2])
        });
        let summary = see.sman.summary("@div_by_zero");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@null_pointer");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@out_of_bound");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@nested");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_recurse() -> Panicable<()> {
        let mut file = get_summary_outfile("recurse.txt");
        let mut see = llvm_glue_recurse();
        assert!(see.summarize("@sum".into(), &vec![]));
        // assert!({
        //     let a = Exp::int_literal(15, Some(32)).unwrap();
        //     let b = Exp::int_literal(213, Some(32)).unwrap();
        //     see.summarize("@gcd", &vec![Some(a), Some(b)])
        // });
        assert!(see.summarize("@test_tree".into(), &vec![]));

        let summary = see.sman.summary("@sum");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@rsum");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@gcd");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_tree");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@add");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@wsum");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_funcp() -> Panicable<()> {
        let mut file = get_summary_outfile("funcp.txt");
        let mut see = llvm_glue_funcp();
        assert!({
            let choice = Exp::int_literal(3, Some(32)).unwrap();
            see.summarize("@test_function_pointer".into(), &vec![choice])
        });
        let summary = see.sman.summary("@test_function_pointer");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_intrinsic() -> Panicable<()> {
        let mut file = get_summary_outfile("intrinsic.txt");
        let mut see = llvm_glue_intrinsic();
        assert!({
            let x = Exp::int_literal(0, Some(32)).unwrap();
            see.summarize("@llvm_memcpy1".into(), &vec![x])
        });
        assert!({
            let x = Exp::int_literal(0, Some(32)).unwrap();
            see.summarize("@llvm_memcpy2".into(), &vec![x])
        });
        assert!({
            let x = Exp::int_literal(1, Some(32)).unwrap();
            let y = Exp::int_literal(1, Some(32)).unwrap();
            see.summarize("@llvm_memset1".into(), &vec![x, y])
        });
        assert!({
            let x = Exp::int_literal(1, Some(32)).unwrap();
            let y = Exp::int_literal(1, Some(32)).unwrap();
            see.summarize("@llvm_memset2".into(), &vec![x, y])
        });

        let summary = see.sman.summary("@llvm_memcpy1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@llvm_memcpy2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@llvm_memset1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@llvm_memset2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_loop() -> Panicable<()> {
        let mut file = get_summary_outfile("loop.txt");
        let mut see = llvm_glue_loop();

        let ty = Type::mk_bitvec(8);
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;
            see.summarize("@loop0".into(), &vec![arg0])
        });
        assert!({
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty.clone())?;
            let arg2 = see.vstate_mut().global("arg2".into());
            let arg2 = SymbolicDesc::from_vdesc(&mut see, &arg2, ty)?;
            see.summarize("@loop1".into(), &vec![arg1, arg2])
        });
        assert!(see.summarize("@loop2".into(), &vec![]));

        let summary = see.sman.summary("@loop0");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@loop1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@loop2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_leak() -> Panicable<()> {
        let mut file = get_summary_outfile("leak.txt");
        let mut see = llvm_glue_leak();

        assert!(see.summarize("@leak1".into(), &vec![]));
        assert!(see.summarize("@leak2".into(), &vec![]));
        assert!(see.summarize("@leak3".into(), &vec![]));

        let summary = see.sman.summary("@leak1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@leak2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@leak3");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_leak_ptr() -> Panicable<()> {
        let mut file = get_summary_outfile("leak_ptr.txt");
        let mut see = llvm_glue_leak_ptr();

        assert!(see.summarize("@caller".into(), &vec![]));

        let summary = see.sman.summary("@caller");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@leak");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_question() -> Panicable<()> {
        let mut file = get_summary_outfile("question.txt");
        let mut see = llvm_glue_question();

        let ty = Type::mk_bitvec(32);
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;
            see.summarize("@f1".into(), &vec![arg0])
        });
        assert!({
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty)?;
            see.summarize("@f2".into(), &vec![arg1])
        });
        assert!(see.summarize("@caller".into(), &vec![]));
        assert!(see.summarize("@alias".into(), &vec![]));
        assert!(see.summarize("@noalias".into(), &vec![]));

        let summary = see.sman.summary("@f1");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@f2");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@callee");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@intermediate");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@caller");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@may_alias");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@noalias");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@alias");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_pointers() -> Panicable<()> {
        let mut file = get_summary_outfile("pointers.txt");
        let mut see = llvm_glue_pointers();

        assert!(see.summarize("@caller".into(), &vec![]));
        assert!(see.summarize("@test_eq".into(), &vec![]));

        let summary = see.sman.summary("@callee");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@caller");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@eq");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_eq");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_heap() -> Panicable<()> {
        let mut file = get_summary_outfile("heap.txt");
        let mut see = llvm_glue_heap();

        let ty = Type::mk_bitvec(32);
        assert!(see.summarize("@test_basic".into(), &vec![]));
        assert!({
            let ty = Type::mk_pointer();
            let havoc = Exp::havoc(ty.clone());
            let mdesc = see.mstate.alloc_global(havoc, "Test::0".into(), false)?;
            let ptr = Exp::pointer_literal(mdesc);
            see.summarize("@test_return".into(), &vec![ptr])
        });
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty.clone())?;
            see.summarize("@test_local".into(), &vec![arg0, arg1])
        });
        assert!({
            let arg2 = see.vstate_mut().global("arg2".into());
            let arg2 = SymbolicDesc::from_vdesc(&mut see, &arg2, ty.clone())?;
            see.summarize("@test_construct".into(), &vec![arg2])
        });
        assert!({
            let arg3 = see.vstate_mut().global("arg3".into());
            let arg3 = SymbolicDesc::from_vdesc(&mut see, &arg3, ty)?;
            see.summarize("@test_free".into(), &vec![arg3])
        });

        let summary = see.sman.summary("@test_basic");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_return");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_local");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@new");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_construct");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@test_free");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@foo");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_boolean() -> Panicable<()> {
        let mut file = get_summary_outfile("boolean.txt");
        let mut see = llvm_glue_boolean();

        let ty = Type::mk_bitvec(32);
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty)?;
            see.summarize("@test".into(), &vec![arg0])
        });

        let summary = see.sman.summary("@test");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_switch() -> Panicable<()> {
        let mut file = get_summary_outfile("switch.txt");
        let mut see = llvm_glue_switch();

        assert!({
            let value = Exp::int_literal(0, Some(32)).unwrap();
            see.summarize("@test_switch".into(), &vec![value])
        });

        let summary = see.sman.summary("@test_switch");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        Ok(())
    }

    #[test]
    fn se_summarize_exception() -> Panicable<()> {
        let mut file = get_summary_outfile("exception.txt");
        let mut see = llvm_glue_exception();

        let ty = Type::mk_bitvec(32);
        assert!({
            let arg0 = see.vstate_mut().global("arg0".into());
            let arg0 = SymbolicDesc::from_vdesc(&mut see, &arg0, ty.clone())?;
            see.summarize("@_Z9throw_inti".into(), &vec![arg0])
        });
        let summary = see.sman.summary("@_Z9throw_inti");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        assert!({
            let arg1 = see.vstate_mut().global("arg1".into());
            let arg1 = SymbolicDesc::from_vdesc(&mut see, &arg1, ty.clone())?;
            see.summarize("@_Z3bari".into(), &vec![arg1])
        });
        assert!({
            let arg2 = see.vstate_mut().global("arg2".into());
            let arg2 = SymbolicDesc::from_vdesc(&mut see, &arg2, ty.clone())?;
            see.summarize("@_Z4testi".into(), &vec![arg2])
        });

        let summary = see.sman.summary("@_Z3bari");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");
        let summary = see.sman.summary("@_Z4testi");
        file.write_all(format!("{:?}", summary).as_bytes())
            .expect("failed to write summary");

        Ok(())
    }
}
