//! Builtin functions for the Rust language.

use super::*;

pub(super) const RUST_BUILTINS: [(&str, BuiltinFunc); 2] = [
    ("@__rust_alloc", rust_alloc as BuiltinFunc),
    ("@__rust_dealloc", rust_dealloc as BuiltinFunc),
];

fn rust_alloc(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [Some(Type::mk_bitvec(64)), Some(Type::mk_bitvec(64))]);

    let size = exp_as_data!(exec_spec!(see, node.args[0].clone()), Exp::IntLiteral).value as u32;
    let _align = exp_as_data!(exec_spec!(see, node.args[1].clone()), Exp::IntLiteral).value as u32;

    builtin_malloc(see, cur, size)
}

fn rust_dealloc(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [Some(Type::mk_pointer()), Some(Type::mk_bitvec(64)), Some(Type::mk_bitvec(64))]);

    let ptr = node.args[0].clone();
    builtin_free(see, cur, ptr)
}