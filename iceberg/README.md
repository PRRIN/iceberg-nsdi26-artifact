# What is Iceberg?

Iceberg is a symbolic execution engine for LLVM, built in Rust. It aims at verifying opensource DNS implementations.

## Current Project State

Iceberg follows a frontend-middleend-backend architecture.

### Frontend

The frontend handles parsing of both LLVM IR and a custom SPEC language (used for automated summary). It emits a unified intermediate representation for the middleend (CFG + Exp).

For now, `lalrpop` is used as the parser generator.


* LLVM frontend: 
    * ✅ [**Done**] Main interface done.
    * ✅ [**Done**] Full support for C and Go.
    * ⏳ [**Postponed**] C++ exceptions.
    * 🔽 [**Low-Priority**] Full grammar support (attributes, metadata...).
    * 🔽 [**Low-Priority**] `llvm-ir` crate integration.
    * 🔽 [**Low-Priority**] Custom parser (other than `lalrpop`) for quicker compile time.

* SPEC frontend: 
    * ✅ [**Done**] Prototype implementaion.
    * 🚫 [**Failure**] Effectively broken because of type inference and `Exp::Ite`.
    Revision on the SPEC design is needed, before any progress can be made.
    * 🔽 [**Low-Priority**] Better error handling / prompting.
    * 🔽 [**Low-Priority**] LSP integration.


### Middleend

The middleend works with CFGs (imperative statements) and Exps (expressions), which can be symbolic. It can perform full-path symbolic execution on a given CFG, collecting its paths (and path conditions for the backend).

The middleend also features a summary / symbolic state system, that captures Effects produced during execution, manages built summarys, and applies them appropriately.

* `Type` system
    * ✅ [**Done**] Singleton type system and `TypeManager`.
    * ✅ [**Done**] Type formatting.
    * ✅ [**Done**] Type system overhaul for aliasing.
    * ✅ [**Done**]  Data layout and type alignment calculation.
    
* `Exp`/`exec` system
    * ✅ [**Done**] Basic constructors and validity checks.
    * ✅ [**Done**] Exp formatting.
    * ✅ [**Done**] Evaluation and execution of `exp`s.
    * ✅ [**Done**] Comparison of `Exp`s, or the `ExpOrdering`
    * ✅ [**Done**] Evaluation and execution of `exp`s.
    * ✅ [**Done**] Improve efficiency when `exec` does not have any effect.

* `CfgNode` system
    * ✅ [**Done**] Basic constructors.
    * ⏹️ [**Resolved**] Do we merge `CfgNode` with `SummaryNode`? **No**.

* `MemoryState/ValueState` system
    * ✅ [**Done**] Basic interface and push/pop version control.
    * ✅ [**Done**] Overhaul with unified descriptor system.
    * ✅ [**Done**] Scratch allocation for recursive calls. 
    * ✅ [**Done**] Annotation and verification of read-only memory.
    * ✅ [**Done**] Better support for out-of-scope MemoryDesc; it is now an `Effect::Panic` to operate out-of-scope memory descriptors.
    * 🔽 [**Maybe**] Optimization: improve pop efficiency by caching modifications.
    * ✅ [**Done**] **Symbolic Memory Update**
    * ✅ [**Done**] Heap allocation

* `Trace` system (*completed*)
    * ✅ [**Done**] Basic interface and push-pops.
    * ✅ [**Done**] Truly no-op tracing using conditional compilation and lazy formatting.

* `Summary` system
    * ✅ [**Done**] `SummaryManager` & interface.
    * ✅ [**Done**] Design of `Effect`s.
    * ✅ [**Done**] Fine-grained `Specialize` system.
    * ✅ [**Done**] `SummaryBuilder` and summary tree building.
    * ✅ [**Done**] `SummaryApplier` and summary tree enumeration.
    * ✅ [**Done**] Correct internal state transition of `Summary` for truly automated summarization.
    * ✅ [**Done**] Falling back to concrete execution for recursive calls.
    * ✅ [**Done**] `Effect::Store` aggregating.
    * 🔽 [**Low-Priority**] Summary tree minimization.
    * ✅ [**Done**] **Symbolic Memory Update**

* `Error` system (*completed*)
    * ✅ [**Done**] Basic custom errors; overhaul fallible interfaces.
    * ✅ [**Done**] Integration of logging.
    * ✅ [**Done**] `Panicable<_>` and utility macros for custom unwinding and trace dumping.

* `Walk` system
    * ✅ [**Done**] Refactor recursion into iteration, to avoid SO.
    * ✅ [**Done**] More complete support for LLVM primitives such as `memcpy` and `memset`.

### Backend

The backend is mainly a wrapper for invoking the SMT solver. Currently, we use `z3` only.

* `z3` wrapper:
    * ✅ [**Done**] Basic calling interface.
    * ✅ [**Done**] Optimization: Incremental mode.
    * ✅ [**Done**] Optimization: Context reuse/cache for less memory usage.
    * 🔽 [**Maybe**] Optimization: Batched invocation.
    * 🔽 [**Maybe**] Optimization: Cache UNSAT core.
    * 🔽 [**Maybe**] Functionality: Z3 list support.

* Other SMTs:
    * 🔽 [**Maybe**] Make use of other SMT solver.


## Verification Progress

* Basic tests:
    * ✅ [**Passed**] Leaf function summary 
    * ✅ [**Passed**] Memory side effects
    * ✅ [**Passed**] `Exp` stress test
    * ✅ [**Passed**] Recursive type checking
    * ✅ [**Passed**] Loops stress test
    * ✅ [**Passed**] Simple "a calls b" test
    * ✅ [**Passed**] Complicated non-leaf function
    * ✅ [**Passed**] Recursive function
    * ✅ [**Passed**] Function pointer
    * ⏹️ [**Resolved**] Function with `va_arg` are treated as builtin for now.
    * ✅ [**Done**] Insert/extract aggregate values.

* CoreDNS: [[Roadmap]](https://docs.qq.com/sheet/DREJmcE5ocllFTXRG?u=d51b0692120348bf944d58a537f59c17&tab=BB08J2)
    * ✅ [**Done**] Recompile the latest CoreDNS with GoLLVM, and collect all relevant code.
    * ⭐️ [**Worked-On**] `Tree.Elem` make use of `map`, which requires `runtime` support. How do we resolve related calls?

* Bind: 
    * ⭐️ [**TODO**] `ns_query_next()`
    