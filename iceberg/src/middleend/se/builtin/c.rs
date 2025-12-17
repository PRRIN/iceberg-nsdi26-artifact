//! Builtin functions for the C language.
//!
//! Notably, the `malloc` builtin for C demands extra type annotations
//! to work, since the C language does not provide any runtime type
//! information.

use super::*;

pub(super) const C_BUILTINS: [(&str, BuiltinFunc); 5] = [
    ("@malloc", malloc as BuiltinFunc),
    ("@memcmp", memcmp as BuiltinFunc),
    ("@free", free as BuiltinFunc),
    ("@pthread_mutex_lock", builtin_ok as BuiltinFunc),
    ("@pthread_mutex_unlock", builtin_ok as BuiltinFunc),
];

/// LIBC `malloc()`.
fn malloc(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [Some(Type::mk_bitvec(64))]);

    let size = exp_as_data!(exec_spec!(see, node.args[0].clone()), Exp::IntLiteral).value as u32;
    builtin_malloc(see, cur, size)
}

/// LIBC `memcmp()`.
fn memcmp(see: &mut See, node: CfgNodeRef, conc: bool) -> Panicable<bool> {
    // Alias to `bcmp`
    bcmp(see, node, conc)
}

/// LIBC `free()`.
fn free(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [Some(Type::mk_pointer())]);

    let ptr = node.args[0].clone();
    builtin_free(see, cur, ptr)
}
