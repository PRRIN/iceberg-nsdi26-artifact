//! Builtin functions for the C library, as implemented by the
//! Internet Systems Consortium (ISC).

use super::*;

pub(super) const ISC_BUILTINS: [(&str, BuiltinFunc); 10] = [
    ("@isc__mem_get", isc_mem_get as BuiltinFunc),
    ("@isc__mempool_get", isc_mempool_get as BuiltinFunc),
    ("@isc__mem_put", isc_mem_put as BuiltinFunc),
    ("@isc__mem_free", isc_mem_free as BuiltinFunc),
    ("@isc__mempool_put", isc_mempool_put as BuiltinFunc),
    ("@rcu_dereference_sym", rcu_dereference as BuiltinFunc),
    ("@rcu_xchg_pointer_sym", rcu_xchg_pointer as BuiltinFunc),
    (
        "@rcu_cmpxchg_pointer_sym",
        rcu_cmpxchg_pointer as BuiltinFunc,
    ),
    ("@pthread_mutex_lock", builtin_ok as BuiltinFunc),
    ("@pthread_mutex_unlock", builtin_ok as BuiltinFunc),
];

/// Memory allocation.
/// ```llvm
/// i8* @isc__mem_get(%struct.isc_mem* noundef %0, i64 noundef %1, i32 noundef %2)
/// ```
fn isc_mem_get(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64)),
        Some(Type::mk_bitvec(32))
    ]);

    let size = exp_as_data!(exec_spec!(see, node.args[1].clone()), Exp::IntLiteral).value as u32;
    builtin_malloc(see, cur, size)
}

/// Pool-ed memory allocation.
/// ```llvm
/// i8* @isc__mempool_get(%struct.isc_mempool* noalias noundef %0)
/// ```
fn isc_mempool_get(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
    ]);

    let mempool = exec_spec!(see, node.args[0].clone());
    let desc = ptr_to_desc!(
        see,
        mempool,
        {
            let err = SeError::PtrNull {
                ptr: node.args[0].clone(),
            };
            see.sman.panic(err.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected ptr, found {}", mempool)
    );
    let desc = see
        .mstate_mut()
        .get_elem_ptr(Type::resolve("%struct.isc_mempool").unwrap(), &desc, 4)
        .unwrap();
    let size = see
        .mstate
        .load(Type::mk_bitvec(64), &desc, Some(&mut see.sman))
        .unwrap();
    let size = exp_as_data!(exec_spec!(see, size), Exp::IntLiteral).value as u32;

    builtin_malloc(see, cur, size)
}

/// Memory deallocation.
/// ```llvm
/// void @isc__mem_put(%struct.isc_mem* noundef %0, i8* nocapture noundef %1, i64 noundef %2)
/// ```
fn isc_mem_put(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64))
    ]);

    let ptr = node.args[1].clone();
    builtin_free(see, cur, ptr)
}

/// Memory deallocation.
/// ```llvm
/// void @isc__mem_free(%struct.isc_mem* noundef %0, i8* noundef %1)
/// ```
fn isc_mem_free(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let ptr = node.args[1].clone();
    builtin_free(see, cur, ptr)
}

/// Pool-ed memory deallocation.
/// ```llvm
/// void @isc__mempool_put(%struct.isc_mempool* noalias noundef %0, i8* noundef %1)
/// ```
fn isc_mempool_put(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let ptr = node.args[1].clone();
    builtin_free(see, cur, ptr)
}

/// LibUrcu pointer dereference.
/// From https://github.com/flatzo/liburcu/blob/master/urcu/static/urcu-pointer.h#L67.
fn rcu_dereference(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer())
    ]);

    // Bind return value
    let ret = exec!(see, node.args[0].clone(), conc);
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// LibUrcu exchange pointer.
/// From https://github.com/flatzo/liburcu/blob/0e1efa0e8c7961fc3eca21d0268c07f44eb572e5/urcu-pointer.c#L47.
fn rcu_xchg_pointer(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let mdesc = ptr_to_desc!(
        see,
        node.args[0].clone(),
        {
            let err = SeError::PtrNull {
                ptr: node.args[0].clone(),
            };
            see.sman.panic(err.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected ptr, found {}", node.args[0])
    );
    let new = exec!(see, node.args[1].clone(), conc);
    let old = ensure!(
        see,
        see.mstate
            .load(Type::mk_pointer(), &mdesc, Some(&mut see.sman))
    );
    ensure!(see, see.mstate_mut().store(&mdesc, new, false));

    // Bind return value
    let ret = exec!(see, old, conc);
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// LibUrcu compare and exchange pointer.
/// From https://github.com/flatzo/liburcu/blob/master/urcu/uatomic/generic.h#L86.
fn rcu_cmpxchg_pointer(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}
