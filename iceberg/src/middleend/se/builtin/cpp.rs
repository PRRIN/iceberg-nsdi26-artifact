//! Builtin functions for the C++ language.
//!
//! Notably, Iceberg simulates an entire exception handling system for C++,
//! by modelling the `__cxa` ABI functions. The targeted exception handling
//! system is the Itanium C++ ABI (https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html).
//!
//! Here is a rundown of the exception system design:
//!
//! *   The EH control flow is integrated into the Iceberg CFG, where each function
//!     call is followed by a check for exceptions. Functions that throw will have
//!     the `ExFlag` set, so that the check will lead to the exception flow.
//!
//! *   `__cxa_throw`, and a bunch of other C++ error functions, are the ultimate
//!     source of exceptions: they always set the `ExFlag` to true.
//!
//! *   All exception objects are allocated on the heap. They are then passed around
//!     using the normal `ValueState` interface, and passed through function boundaries
//!     with `Effect::Ret` (if you think about it, throwing a exception isn't far off
//!     from returning it on the spot).
//!
//! *   Exception objects are destroyed when they get handled, resulting in a heap free,
//!     and also a call to the destructor function.
//!
//! To implement this system efficiently, certain care must be taken, in that **exceptions
//! occur only in the effects of a function summary, not in its path constraints**.
//!
//! The key challenge for this is the exception stack. Section 2.2.2 of the ABI
//! (https://itanium-cxx-abi.github.io/cxx-abi/abi-eh.html) speaks of a "caught exception stack",
//! which is needed for proper rethrowing. This stack MUST NOT be put to the global region
//! in Iceberg, as it will "leak" `Specialize` effects to the path constraints of any
//! throwing function. Suppose a function throws when the stack globally has one exception
//! already - or two, or three, and the summary will not be reused.
//!
//! Instead, the exception stack is **split up to each function's local stack region**.
//! Each function allocates an extra `ExStk` (Exception Stack) region upon entry, which
//! stores the caught exceptions within the function scope. Everything about the EH operates
//! the same, except that working with the `ExStk` will not affect any path constrainst.
//!
//! See each of the `__cxa` ABI function for more details on how the design above
//! maps into the Itanium C++ ABI endpoints.

use super::*;
use crate::glue::llvm;

pub(super) const CPP_BUILTINS: [(&str, BuiltinFunc); 14] = [
    ("@__cxa_allocate_exception", __cxa_alloc as BuiltinFunc),
    ("@__cxa_free_exception", __cxa_free as BuiltinFunc),
    ("@__cxa_throw", __cxa_throw as BuiltinFunc),
    ("@__cxa_rethrow", __cxa_rethrow as BuiltinFunc),
    ("@__cxa_begin_catch", __cxa_begin_catch as BuiltinFunc),
    ("@__cxa_end_catch", __cxa_end_catch as BuiltinFunc),
    ("@llvm.eh.typeid.for", __cxa_typeid as BuiltinFunc),

    ("@_Znwm", new as BuiltinFunc),
    ("@_ZnwmRKSt9nothrow_t", new as BuiltinFunc),
    ("@_ZnwmSt11align_val_t", new as BuiltinFunc),
    ("@_ZdlPv", delete as BuiltinFunc),
    ("@_ZdlPvSt11align_val_t", delete as BuiltinFunc),
    ("@_Znam", new_slice as BuiltinFunc),
    ("@_ZdaPv", delete_slice as BuiltinFunc),
];

/// Flag indicating an exception has been rethrown.
const CXA_FLAG_RETHROWN: i64 = 0xffffffff80000000u64 as i64;

/// Allocates memory to hold the exception to be thrown. 
/// `thrown_size` is the size of the exception object.
/// ```c++
/// void *__cxa_allocate_exception(size_t thrown_size);
/// ```
/// The actual allocation have a prepended header, which stores the typeinfo,
/// caught count, and destructor of the exception object. This design is in
/// fact similar to the actual implementation in the Itanium C++ ABI, albeit 
/// we do not claim full compatibility with its details.
fn __cxa_alloc(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_bitvec(64))
    ]);

    let thrown_size = exp_as_data!(exec_spec!(see, node.args[0].clone()), Exp::IntLiteral).value as u32;
    
    // special allocation with header 
    let assign = &exp_as_data!(node.assign, Exp::Var).desc;
    let ValueDesc::Local(alloc_site, _) = assign else { unreachable!() };
    let (ty, mode) = see
        .bman
        .type_hints
        .get(alloc_site.as_ref())
        .cloned()
        .ok_or_else(|| make_panic!("allocation site {alloc_site} is not registered"))?;
    let sz = ty.get_layout(see.mstate_mut()).unwrap().size;

    let ty = match mode {
        PaddingMode::Exact => {
            assert_or_throw!(
                sz == thrown_size,
                "{alloc_site} is annotated to be {ty} (exact), but the allocated size is {thrown_size} bytes"
            );
            // header of (type_id, caught count, destructor)
            Type::mk_tuple([
                Type::mk_bitvec(32), 
                Type::mk_bitvec(32), 
                Type::mk_pointer(), 
                ty
            ])
        },
        _ => throw_panic!("padding mode other than \"!\"(exact) for exception {alloc_site} is not supported"),
    };
    let mdesc = see.mstate.alloc_heap(ty, false)?;

    // Assign a symbolic region
    let actual = see.mstate.region_of(&mdesc);
    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())?;
    let ret = Exp::symbolic_ptr(sdesc, see.mstate.layout_of(actual), 16 /* the actual object */);

    // Bind return value
    see.vstate.put(&assign, ret);
    Ok(true)
}

/// Free the memory for the exception object.
/// ```c++
/// void __cxa_free_exception(void *thrown_exception);
/// ```
/// This routine ONLY frees the memory, and does not call the destructor, nor
/// updates the exception stack.
fn __cxa_free(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer())
    ]);

    let ptr = exec!(see, node.args[0].clone(), conc);
    builtin_free(see, cur, ptr)
}

/// Throws an exception object, registering its typeinfo and a desctructor.
/// ```c++
/// void __cxa_throw (void *thrown_exception, std::type_info *tinfo, void (*dest) (void *) );
/// ```
/// `tinfo` and `dest` are stored in a header prepending the `thrown_exception`
/// object.
fn __cxa_throw(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    
    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let ex = exec_spec!(see, node.args[0]);
    let tinfo = exec_spec!(see, node.args[1]);
    let dest = exec_spec!(see, node.args[2]);

    let ex_desc = ptr_to_desc!(
        see,
        ex,
        throw_panic!("expected pointer, found {}", ex),
        throw_panic!("expected pointer, found {}", ex)
    );
    let tinfo_desc = ptr_to_desc!(
        see,
        tinfo,
        throw_panic!("expected pointer, found {}", tinfo),
        throw_panic!("expected pointer, found {}", tinfo)
    );

    // ..use the region ID as type ID
    let type_id = Exp::int_literal(tinfo_desc.region_id().get() as i64, Some(32)).unwrap();
    let ex = Exp::tuple(vec![ex, type_id.clone()], false);

    // ..initialize the type ID, caught count, and destructor
    {
        let desc = see.mstate.get_ptr(Type::mk_bitvec(8), &ex_desc, -16).unwrap();
        see.mstate.store(&desc, type_id, false).unwrap();
    }
    {
        let desc = see.mstate.get_ptr(Type::mk_bitvec(8), &ex_desc, -12).unwrap();
        see.mstate.store(&desc, Exp::int_literal(0, Some(32)).unwrap(), false).unwrap();
    }
    {
        let desc = see.mstate.get_ptr(Type::mk_bitvec(8), &ex_desc, -8).unwrap();
        see.mstate.store(&desc, dest, false).unwrap();
    }

    // Bind the exception value
    see.vstate.put(cur.func.throwval(), ex);
    see.vstate.put(cur.func.ex_flag(), Exp::true_exp());
    Ok(true)
}

/// Rethrows the exception on top of the exception stack.
/// ```c++
/// void __cxa_rethrow ();
/// ```
/// Rethrowing does not pop an exception from the stack, but rather tags it
/// as being rethrown (`CXA_FLAG_RETHROWN`), which prevents it from being
/// destructed even when its caught count drops to zero.
fn __cxa_rethrow(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), []);

    let ex_stk_top = {
        let ptr = see.vstate.get(&cur.func.ex_stk_top()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let exp = see.mstate.load(Type::mk_bitvec(8), &data.desc, None).unwrap();
        let ex_stk_top = exp_as_data!(exp, Exp::IntLiteral).value;
        assert_or_throw!(ex_stk_top >= 0, "empty exception stack");
        ex_stk_top
    };
    
    let ex = {
        let ptr = see.vstate.get(&cur.func.ex_stk()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let slot = see
            .mstate
            .get_ptr(Type::mk_pointer(), &data.desc, ex_stk_top as isize)
            .unwrap();
        see.mstate.load(Type::mk_pointer(), &slot, None).unwrap()
    };

    // ..get type_id, and tag as rethrown
    let type_id = {
        let desc = ptr_to_desc!(
            see,
            ex,
            throw_panic!("expected pointer, found {}", ex),
            throw_panic!("expected pointer, found {}", ex)
        );
        let cnt_desc = see.mstate.get_ptr(Type::mk_bitvec(8), &desc, -12).unwrap();
        let cnt = see.mstate.load(Type::mk_bitvec(32), &cnt_desc, None).unwrap();
        see.mstate.store(
            &cnt_desc, 
            Exp::int_literal(exp_as_data!(cnt, Exp::IntLiteral).value | CXA_FLAG_RETHROWN, Some(32)).unwrap(), 
            false
        ).unwrap();

        let type_id_desc = see.mstate.get_ptr(Type::mk_bitvec(8), &desc, -16).unwrap();
        see.mstate.load(Type::mk_bitvec(32), &type_id_desc, None).unwrap()
    };

    // Bind return value
    let throw_exp = Exp::tuple(vec![ex, type_id], false);
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, throw_exp);
    see.vstate.put(cur.func.ex_flag(), Exp::true_exp());
    Ok(true)
}

/// Marks the entry of a `catch` block, where the exception object is pushed
/// onto the local exception stack.
/// ```c++
/// void *__cxa_begin_catch ( void *exceptionObject );
/// ```
/// The caught count is incremented, and the rethrown flag is cleared.
fn __cxa_begin_catch(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer())
    ]);

    let ex = exec_spec!(see, node.args[0]);

    // ..update the exception stack
    let ex_stk_top = {
        let ptr = see.vstate.get(&cur.func.ex_stk_top()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let exp = see.mstate.load(Type::mk_bitvec(8), &data.desc, None).unwrap();
        let prev_top = exp_as_data!(exp, Exp::IntLiteral).value;
        assert_or_throw!(prev_top + 1 < llvm::EX_STK_SZ as i64, "full exception stack");
        see
            .mstate
            .store(
                &data.desc, 
                Exp::int_literal((prev_top + 1) as i64, Some(8)).unwrap(), 
                false
            )
            .unwrap();
        prev_top + 1
    };
    
    {
        let ptr = see.vstate.get(&cur.func.ex_stk()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let slot = see
            .mstate
            .get_ptr(Type::mk_pointer(), &data.desc, ex_stk_top as isize).unwrap();
        see.mstate.store(&slot, ex.clone(), false).unwrap()
    };

    // ..update the caught count
    {
        let desc = ptr_to_desc!(
            see,
            ex,
            throw_panic!("expected pointer, found {}", ex),
            throw_panic!("expected pointer, found {}", ex)
        );
        let cnt_desc = see.mstate.get_ptr(Type::mk_bitvec(8), &desc, -12).unwrap();
        let cnt = see.mstate.load(Type::mk_bitvec(32), &cnt_desc, None).unwrap();
        see.mstate.store(
            &cnt_desc, 
            Exp::int_literal((exp_as_data!(cnt, Exp::IntLiteral).value+1) & !CXA_FLAG_RETHROWN, Some(32)).unwrap(), 
            false
        ).unwrap();
    };

    // Bind return value
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ex);
    Ok(true)
}

/// Marks the exit of a `catch` block, where the local exception stack is
/// popped, and cleanup is made.
/// ```c++
/// void __cxa_end_catch ();
/// ``` 
/// If the caught count of the popped exception drops to zero, and it
/// is not marked as rethrown, then it is destructed and freed.
fn __cxa_end_catch(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    #[allow(unused)]
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), []);

    // ..update the exception stack
    let ex_stk_top = {
        let ptr = see.vstate.get(&cur.func.ex_stk_top()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let exp = see.mstate.load(Type::mk_bitvec(8), &data.desc, None).unwrap();
        let prev_top = exp_as_data!(exp, Exp::IntLiteral).value;
        assert_or_throw!(prev_top >= 0, "empty exception stack");
        see
            .mstate
            .store(
                &data.desc, 
                Exp::int_literal((prev_top - 1) as i64, Some(8)).unwrap(), 
                false
            )
            .unwrap();
        prev_top
    };
    
    let ex = {
        let ptr = see.vstate.get(&cur.func.ex_stk()).unwrap();
        let Exp::PointerLiteral(data) = ptr.as_ref() else { unreachable!() };
        let slot = see
            .mstate
            .get_ptr(Type::mk_pointer(), &data.desc, ex_stk_top as isize)
            .unwrap();
        see.mstate.load(Type::mk_pointer(), &slot, None).unwrap()
    };

    // ..update the caught count
    {
        let desc = ptr_to_desc!(
            see,
            ex,
            throw_panic!("expected pointer, found {}", ex),
            throw_panic!("expected pointer, found {}", ex)
        );
        let cnt_desc = see.mstate.get_ptr(Type::mk_bitvec(8), &desc, -12).unwrap();
        let cnt = exp_as_data!(see.mstate.load(Type::mk_bitvec(32), &cnt_desc, None).unwrap(), Exp::IntLiteral).value;
        assert!(cnt & !CXA_FLAG_RETHROWN > 0, "negative caught count");
        see.mstate.store(
            &cnt_desc, 
            Exp::int_literal(
                cnt - 1,
                Some(32)
            ).unwrap(), 
            false
        ).unwrap();

        if cnt - 1 == 0 {
            // done for this exception; destruct and free
            let dest_desc = see.mstate.get_ptr(Type::mk_bitvec(8), &desc, -8).unwrap();
            let _ = see.mstate.load(Type::mk_pointer(), &dest_desc, None).unwrap();
            
            // TODO: unfortunately, calling a destructor that branches can be tricky,
            // as the builtin iterator cannot be used here.
            // A new (better) way to integrate builtins that branch is likely needed.
            // For now we just skip the destructor call.

            return builtin_free(see, cur, ex);
        }
    };

    Ok(true)
}

/// From https://llvm.org/docs/ExceptionHandling.html#llvm-eh-typeid-for.
/// ```llvm
/// i32 @llvm.eh.typeid.for(i8* %type_info)
/// ```
fn __cxa_typeid(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bitvec(32)), [
        Some(Type::mk_pointer())
    ]);

    let type_info = exec_spec!(see, node.args[0]);
    let type_info_desc = ptr_to_desc!(
        see,
        type_info,
        throw_panic!("expected pointer, found {}", type_info),
        throw_panic!("expected pointer, found {}", type_info)
    );
    // ..use the region ID as type ID
    see.vstate.put(
        &exp_as_data!(node.assign, Exp::Var).desc, 
        Exp::int_literal(type_info_desc.region_id().get().into(), Some(32)).unwrap(),
    );
    Ok(true)
}

/// C++ `new` operator.
fn new(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer())
    ]);

    let size = exp_as_data!(exec_spec!(see, node.args[0].clone()), Exp::IntLiteral).value;
    builtin_malloc(see, cur, size as u32)
}

/// C++ `new[]` operator.
fn new_slice(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// C++ `delete` operator.
fn delete(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer())
    ]);

    let ptr = node.args[0].clone();
    builtin_free(see, cur, ptr)
}

/// C++ `delete[]` operator.
fn delete_slice(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}
