# The Backend Design

### APIs

* A `Solver` struct that the middleend interacts with
    * `solver.interpret(exp: Rc<Exp>)` will encode `exp` with backend specific representation. For `z3`, we may be calling `z3::mkXX` here. *What should it return?*
    * `solver.push(cond: Rc<Exp>)` and `solver.pop()`, which adds and removes assertions to the constraints.
    `cond` must have `type_is_bool!(cond.ty()) == true`.
    Optimization: solver incremental mode (check `z3`).
    * Solver should support multiple backends (i.e. not only Z3).
    * **TBA**: the solver may also provide pruning insights (future work)

### Postponed

* SPEC generation (`backend/spec` in MeissaDNS).
* Built-in function (`backend/builtin` in MeissaDNS), and generally anything concerning `Exp::FuncCall`.

### Supported `Exp`s

In fact, the backend, for now, only needs to support:

* `Arith`
* `Boolean`
* `Compare`
* `EnumLiteral`
* `Ext`
* `Havoc` (panic if part of path condition; arbirary value otherwise)
* `IntLiteral`
* `Not`
* `Symbolic` (`z3` consts)

(**Caveat**: currently, `Symbolic` and `Havoc` may be arbitrary types, which may not map to a `z3` type. Those that cannot may be neglected for now.)

The other `Exp`s either will not be supported, or is WIP:
* `Alloca`
Will not support. Middle-end only.
* `BitCast`
Unsure. Real type casting is being considered.
* `ExtractValue`
Should be evaluated in middle-end. If not, it's likely because of a **symbolic index**, which we do not handle for now.
* `FuncCall`
Will support in other ways.
* `GetPtr`
Symbolic index issue.
* `GetElemPtr`
Symbolic index issue.
* `Index`
Only for SPEC frontend. Future work.
* `InsertValue`
Symbolic index issue.
* `Lambda`
Will not support. Middle-end only.
* `Load`
Symbolic index issue.
* `Nil`
Only for SPEC frontend. Future work.
* `None`
It means a `void` value; so really should not happen. Can mark as `unreachable!()`.
* `Null` and `PointerLiteral`
Pointer analysis is currently resolved in middle-end. To be considered.
* `Range`
Only for SPEC frontend. Future work.
* `Store`
Symbolic index issue.
* `Struct` and `Vector`
TBA: they may just be a bunch of individual values, so we could support them?
* `Var`
Will not support. Middle-end only.