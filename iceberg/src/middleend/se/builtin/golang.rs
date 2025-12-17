//! Builtin functions for the Go language.
//!
//! Since Go has a runtime, much of the standard library calls in the
//! compiled GOLLVM IR are in fact linked to the runtime. This module
//! implements relevant runtime calls, so that Iceberg does not require
//! compiling the Go runtime into LLVM IR and analyzing it as well.
//!
//! The current emulation is based off Golang 1.21, drawing information
//! from the source code directly.

use super::*;
use crate::middleend::se::exec::ptr_to_desc;
use crate::middleend::se::WalkIterator;
use std::rc::Rc;

/// Maximal number of elements in a slice.
const GO_SLICE_CAP: usize = 32;

/// Type name for the Go runtime type struct.
const GO_TYPE: &'static str = "%_type.0";

// TODO: can we move these to SpIce code?
pub(super) const GOLANG_BUILTINS: [(&str, BuiltinFunc); 11] = [
    ("@runtime.typedmemmove", runtime_typedmemmove as BuiltinFunc),
    ("@runtime.typedmemclr", runtime_typedmemclr as BuiltinFunc),
    (
        "@runtime.typedslicecopy",
        runtime_typedslicecopy as BuiltinFunc,
    ),
    ("@runtime.memequal", runtime_memequal as BuiltinFunc),
    ("@runtime.newobject", runtime_newobject as BuiltinFunc),
    ("@runtime.makeslice", runtime_makeslice as BuiltinFunc),
    ("@runtime.growslice", runtime_growslice as BuiltinFunc),
    (
        "@runtime.stringtoslicebyte",
        runtime_stringtoslicebyte as BuiltinFunc,
    ),
    (
        "@runtime.concatstrings",
        runtime_concatstrings as BuiltinFunc,
    ),
    ("@runtime.mapaccess1", runtime_mapaccess1 as BuiltinFunc),
    ("@fmt.Errorf", fmt_errorf as BuiltinFunc),

    // ("@runtime.mapiterinit", runtime_mapiterinit as BuiltinFunc),
    // ("@context.WithValue", ctx_withvalue as BuiltinFunc),
    // ("@context.Value", ctx_value as BuiltinFunc),
];

/// From https://github.com/golang/go/blob/master/src/runtime/mbarrier.go#L152
/// ```go
/// func typedmemmove(typ *abi.Type, dst, src unsafe.Pointer) {
///	    if dst == src {
/// 		return
///     }
///	    memmove(dst, src, typ.Size_)
/// }
/// ```
fn runtime_typedmemmove(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    /* Emulate */
    let ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        ptr,
        throw_panic!("expected pointer, found {}", ptr),
        throw_panic!("expected pointer, found {}", ptr)
    );
    let sz = go_type_size(see, &tdesc);
    if sz == 0 {
        return Ok(true)
    }

    let dst = exec_spec!(see, node.args[2]);
    let src = exec_spec!(see, node.args[3]);
    let dst_desc = ptr_to_desc!(
        see,
        dst,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: dst }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", dst)
    );
    let src_desc = ptr_to_desc!(
        see,
        src,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: src }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", src)
    );

    builtin_memmove(see, conc, &dst_desc, &src_desc, sz)
}

/// From https://github.com/golang/go/blob/de5b418bea70aaf27de1f47e9b5813940d1e15a4/src/runtime/mbarrier.go#L307
/// ```go
/// func reflect_typedslicecopy(elemType *_type, dst, src slice) int
/// ```
fn runtime_typedslicecopy(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bitvec(64)), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let dst_slice = exec_spec!(see, node.args[2]);
    let dst_slice = ptr_to_desc!(
        see,
        dst_slice,
        {
            see.sman.panic(
                SeError::PtrNull { ptr: dst_slice }.to_string(),
                &mut see.traces,
            );
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", dst_slice)
    );
    let src_slice = exec_spec!(see, node.args[3]);
    let src_slice = ptr_to_desc!(
        see,
        src_slice,
        {
            see.sman.panic(
                SeError::PtrNull { ptr: src_slice }.to_string(),
                &mut see.traces,
            );
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", src_slice)
    );

    let int_ty = Type::mk_bitvec(64);
    let ptr_ty = Type::mk_pointer();
    let slice_ty = Type::mk_tuple([ptr_ty.clone(), int_ty.clone(), int_ty.clone()]);

    let n = {
        let desc = see
            .mstate
            .get_elem_ptr(slice_ty.clone(), &dst_slice, 1)
            .unwrap();
        let dst_len = see
            .mstate
            .load(int_ty.clone(), &desc, Some(&mut see.sman))
            .unwrap();
        let dst_len = exp_as_data!(exec_spec!(see, dst_len), Exp::IntLiteral).value;

        let desc = see
            .mstate
            .get_elem_ptr(slice_ty.clone(), &src_slice, 1)
            .unwrap();
        let src_len = see
            .mstate
            .load(int_ty.clone(), &desc, Some(&mut see.sman))
            .unwrap();
        let src_len = exp_as_data!(exec_spec!(see, src_len), Exp::IntLiteral).value;

        if dst_len < src_len {
            dst_len
        } else {
            src_len
        }
    } as usize;
    let ty_ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        ty_ptr,
        throw_panic!("expected pointer, found {}", ty_ptr),
        throw_panic!("expected pointer, found {}", ty_ptr)
    );
    let elem_sz = go_type_size(see, &tdesc);
    let sz = n * elem_sz;

    if sz > 0 {
        let dst = {
            let ptr = Exp::pointer_literal(dst_slice);
            let dst_ptr = Exp::load(ptr_ty.clone(), ptr)?;
            let dst_ptr = exec_spec!(see, dst_ptr);
            ptr_to_desc!(
                see,
                dst_ptr,
                {
                    see.sman.panic(
                        SeError::PtrNull { ptr: dst_ptr }.to_string(),
                        &mut see.traces,
                    );
                    return Ok(false);
                },
                throw_panic!("expected pointer, found {}", dst_ptr)
            )
        };
        let src = {
            let ptr = Exp::pointer_literal(src_slice);
            let src_ptr = Exp::load(ptr_ty.clone(), ptr)?;
            let src_ptr = exec_spec!(see, src_ptr);
            ptr_to_desc!(
                see,
                src_ptr,
                {
                    see.sman.panic(
                        SeError::PtrNull { ptr: src_ptr }.to_string(),
                        &mut see.traces,
                    );
                    return Ok(false);
                },
                throw_panic!("expected pointer, found {}", src_ptr)
            )
        };

        if !builtin_memmove(see, conc, &dst, &src, sz)? {
            return Ok(false)
        }
    }

    // Bind return value
    see.vstate.put(
        &exp_as_data!(node.assign, Exp::Var).desc, 
        Exp::int_literal(n as i64, Some(64)).unwrap()
    );
    Ok(true)
}

/// Obtain the type size from a pointer to a Go runtime type descriptor.
fn go_type_size(see: &mut See, tdesc: &MemoryDesc) -> usize {
    // %_type.0 = type { i64, i64, i32, i8, i8, i8, i8, %__go_descriptor.2*, i8*, { i8*, i64 }*, %uncommonType.0*, %_type.0* }
    let size_ty = Type::mk_bitvec(64);
    let sz = see
        .mstate
        .load(size_ty, &tdesc, Some(&mut see.sman))
        .unwrap();
    exp_as_data!(sz, Exp::IntLiteral).value as usize
}

/// Obtain a `Type` from a pointer to a Go runtime type descriptor.
///
/// A Go map type is represented as a tuple of the key type and the value type.
fn go_type(see: &mut See, tdesc: &MemoryDesc) -> Panicable<Rc<Type>> {
    // %_type.0 = type { i64, i64, i32, i8, i8, i8, i8, %__go_descriptor.2*, i8*, { i8*, i64 }*, %uncommonType.0*, %_type.0* }
    let ty = Type::resolve(GO_TYPE).unwrap();
    let ptr_ty = Type::mk_pointer();
    let int_ty = Type::mk_bitvec(64);
    let i8_ty = Type::mk_bitvec(8);
    let string_ty = Type::mk_tuple([ptr_ty.clone(), int_ty.clone()]);

    let str_desc = {
        let desc = see.mstate.get_elem_ptr(ty, &tdesc, 9).unwrap();
        let ptr = see.mstate.load(ptr_ty.clone(), &desc, None).unwrap();
        exp_as_data!(ptr, Exp::PointerLiteral).desc.clone()
    };

    let len = {
        let desc = see.mstate.get_elem_ptr(string_ty, &str_desc, 1).unwrap();
        let len = see
            .mstate
            .load(int_ty.clone(), &desc, Some(&mut see.sman))
            .unwrap();
        exp_as_data!(len, Exp::IntLiteral).value as usize
    };
    let str = String::from_utf8({
        let ptr = see.mstate.load(ptr_ty.clone(), &str_desc, None).unwrap();
        let desc = exp_as_data!(ptr, Exp::PointerLiteral).desc.clone();
        (0..len)
            .map(|idx| {
                let desc = see
                    .mstate
                    .get_ptr(i8_ty.clone(), &desc, idx as isize)
                    .unwrap();
                Ok(exp_as_data!(
                    see.mstate
                        .load(i8_ty.clone(), &desc, Some(&mut see.sman))
                        .unwrap(),
                    Exp::IntLiteral
                )
                .value as u8)
            })
            .collect::<Panicable<Vec<_>>>()?
    })
    .unwrap();

    // Obtain type from the type name
    go_parse_type(&str)
}

/// From https://github.com/golang/go/blob/6146a73d279d73b6138191929d2f1fad22188f51/src/runtime/mbarrier.go#L325
/// ```go
/// func typedmemclr(typ *_type, ptr unsafe.Pointer)
/// ```
fn runtime_typedmemclr(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    /* Emulate */
    let type_ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        type_ptr,
        throw_panic!("expected pointer, found {}", type_ptr),
        throw_panic!("expected pointer, found {}", type_ptr)
    );
    let sz = go_type_size(see, &tdesc);
    if sz == 0 {
        return Ok(true)
    }

    let ptr = exec_spec!(see, node.args[2]);
    let ptr_desc = ptr_to_desc!(
        see,
        ptr,
        {
            see.sman
                .panic(SeError::PtrNull { ptr }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", ptr)
    );

    builtin_memset(see, &ptr_desc, sz, 0)
}

/// From https://github.com/golang/go/blob/dacf1f1e10a6b1ed02b6b935e502ddf8585b3748/src/runtime/stubs.go#L211
/// ```go
/// func memequal(a, b unsafe.Pointer, size uintptr) bool
/// ```
fn runtime_memequal(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bitvec(8)), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64))
    ]);

    /* Emulate */
    let a = exec_spec!(see, node.args[1]);
    let b = exec_spec!(see, node.args[2]);
    let len = exec_spec!(see, node.args[3]);
    assert_or_throw!(
        exp_is_kind!(len, Exp::IntLiteral),
        "expected integer literal, found {}",
        len
    );
    let len = exp_as_data!(len, Exp::IntLiteral).value as usize;

    let gt_ret = Exp::int_literal(0, Some(8))?;
    let lt_ret = Exp::int_literal(0, Some(8))?;
    let eq_ret = Exp::int_literal(1, Some(8))?;
    builtin_memcmp(see, cur, a, b, len, gt_ret, lt_ret, eq_ret, conc)
}

/// From https://github.com/golang/go/blob/master/src/runtime/malloc.go#L1373
/// ```go
/// func newobject(typ *_type) unsafe.Pointer
/// ```
fn runtime_newobject(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    let ty_ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        ty_ptr,
        throw_panic!("expected pointer, found {}", ty_ptr),
        throw_panic!("expected pointer, found {}", ty_ptr)
    );
    let mut ty = go_type(see, &tdesc).get(see.traces());
    if let Type::Array(kind) = ty.as_ref() {
        // XXX: because of lazy growslice, array pointers must always have 
        // full `GO_SLICE_CAP` length here
        ty = Type::mk_array(GO_SLICE_CAP, kind.elem_ty.clone());
    }

    let mdesc = see.mstate.alloc_heap(ty.clone(), true)?;
    let rdesc = see.mstate.region_of(&mdesc);

    // Assign a symbolic region
    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, rdesc.clone())?;

    let ptr = Exp::symbolic_ptr(
        sdesc,
        see.mstate.layout_of(rdesc),
        0, /* The root node */
    );

    // Bind return value
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ptr);
    Ok(true)
}

/// From https://github.com/golang/go/blob/a27a525d1b4df74989ac9f6ad10394391fe3eb88/src/runtime/slice.go#L92
/// ```go
/// func makeslice(et *_type, len, cap int) unsafe.Pointer
/// ```
/// Note: for simplicity, we pre-allocate any slice with SLICE_CAP elements, and treat later "growslice" calls
/// as no-ops. This rules out any memory movement.
fn runtime_makeslice(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64)),
        Some(Type::mk_bitvec(64))
    ]);

    let ty_ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        ty_ptr,
        throw_panic!("expected pointer, found {}", ty_ptr),
        throw_panic!("expected pointer, found {}", ty_ptr)
    );
    let len = exp_as_data!(exec_spec!(see, node.args[2]), Exp::IntLiteral).value as usize;
    let ptr = builtin_makeslice(see, &tdesc, len)?;

    // Bind return value
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ptr);
    Ok(true)
}

/// From https://github.com/golang/go/blob/a27a525d1b4df74989ac9f6ad10394391fe3eb88/src/runtime/slice.go#L155
/// ```go
/// func growslice(oldPtr unsafe.Pointer, oldLen, oldCap, newLen int, et *_type) slice
/// ```
fn runtime_growslice(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64)),
        Some(Type::mk_bitvec(64)),
        Some(Type::mk_bitvec(64))
    ]);

    let old_ptr = exec_spec!(see, node.args[3]);
    let old_len = exp_as_data!(exec_spec!(see, node.args[4]), Exp::IntLiteral).value as usize;
    let old_cap = exp_as_data!(exec_spec!(see, node.args[5]), Exp::IntLiteral).value as usize;
    let new_len = exp_as_data!(exec_spec!(see, node.args[6]), Exp::IntLiteral).value as usize;
    assert_or_throw!(
        new_len <= GO_SLICE_CAP,
        "new slice length {}({}) exceeds GO_SLICE_CAP({})",
        node.args[6],
        new_len,
        GO_SLICE_CAP,
    );
    let new_cap = Exp::int_literal(GO_SLICE_CAP as i64, Some(64))?;

    let new_ptr = if let Exp::Null(_) = old_ptr.as_ref() {
        // If `oldptr` is `Exp::Null`, make a new slice
        let ty_ptr = exec_spec!(see, node.args[2]);
        let tdesc = ptr_to_desc!(
            see,
            ty_ptr,
            throw_panic!("expected pointer, found {}", ty_ptr),
            throw_panic!("expected pointer, found {}", ty_ptr)
        );
        builtin_makeslice(see, &tdesc, new_len)?
    } else if old_cap < GO_SLICE_CAP {
        // ..or, `oldLen` can be less than `GO_SLICE_CAP`, in which we do a memcpy
        let ty_ptr = exec_spec!(see, node.args[2]);
        let tdesc = ptr_to_desc!(
            see,
            ty_ptr,
            throw_panic!("expected pointer, found {}", ty_ptr),
            throw_panic!("expected pointer, found {}", ty_ptr)
        );
        let new_ptr = builtin_makeslice(see, &tdesc, new_len)?;
        if old_len > 0 {
            let src = ptr_to_desc!(
                see,
                old_ptr,
                {
                    see.sman.panic(
                        SeError::PtrNull { ptr: old_ptr }.to_string(),
                        &mut see.traces,
                    );
                    return Ok(false);
                },
                throw_panic!("expected pointer, found {}", old_ptr)
            );
            let dst = ptr_to_desc!(
                see,
                new_ptr,
                unreachable!(),
                throw_panic!("expected pointer, found {}", new_ptr)
            );
            let sz = go_type_size(see, &tdesc) * old_len;
            if !builtin_memmove(see, conc, &dst, &src, sz)? {
                return Ok(false);
            }
        }
        new_ptr
    } else {
        old_ptr
    };

    // Override with (newptr, newlen, newcap)
    let slice = exec_spec!(see, node.args[0]);
    let slice_desc = ptr_to_desc!(
        see,
        slice,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: slice }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", slice)
    );

    let new_slice = {
        let new_len = Exp::int_literal(new_len as i64, Some(64)).unwrap();
        Exp::tuple(vec![new_ptr, new_len, new_cap], false)
    };

    ensure!(see, see.mstate.store(&slice_desc, new_slice, false));
    Ok(true)
}

fn builtin_makeslice(see: &mut See, tdesc: &MemoryDesc, len: usize) -> Panicable<Rc<Exp>> {
    let elem_ty = go_type(see, &tdesc).get(see.traces());
    assert_or_throw!(
        len <= GO_SLICE_CAP,
        "slice length {} exceeds GO_SLICE_CAP({})",
        len,
        GO_SLICE_CAP,
    );

    let slice_ty = Type::mk_array(GO_SLICE_CAP, elem_ty);
    let mdesc = see.mstate.alloc_heap(slice_ty.clone(), true)?;
    let rdesc = see.mstate.region_of(&mdesc);

    // Assign a symbolic region
    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, rdesc.clone())?;
    Ok(Exp::symbolic_ptr(
        sdesc,
        see.mstate.layout_of(rdesc),
        0, /* The first field */
    ))
}

/// https://github.com/golang/go/blob/6146a73d279d73b6138191929d2f1fad22188f51/src/runtime/string.go#L166
/// ```go
/// func stringtoslicebyte(buf *tmpBuf, s string) []byte
/// ```
fn runtime_stringtoslicebyte(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64))
    ]);

    let tmp_buf = exec_spec!(see, node.args[2]);
    let str_ptr = exec_spec!(see, node.args[3]);
    let str_len = exec_spec!(see, node.args[4]);

    let str_len = exp_as_data!(str_len, Exp::IntLiteral).value as usize;

    let dst = match tmp_buf.as_ref() {
        Exp::PointerLiteral(data) if str_len <= 32 => data.desc.clone(),
        _ => {
            let ty = Type::mk_bitvec(8);
            let ty = Type::mk_array(str_len, ty);
            see.mstate.alloc_heap(ty, true).unwrap()
        }
    };

    if str_len > 0 {
        // str may be empty..
        let src = ptr_to_desc!(
            see,
            str_ptr,
            {
                see.sman.panic(
                    SeError::PtrNull { ptr: str_ptr }.to_string(),
                    &mut see.traces,
                );
                return Ok(false);
            },
            throw_panic!("expected pointer, found {}", str_ptr)
        );
        builtin_memmove(see, conc, &dst, &src, str_len)?;
    }

    // Return via sret
    let sret = exec_spec!(see, node.args[0]);
    let sret = ptr_to_desc!(
        see,
        sret,
        throw_panic!("expected pointer, found {}", sret),
        throw_panic!("expected pointer, found {}", sret)
    );

    // ptr: try to assign a symbolic region
    let region = see.mstate.region_of(&dst);
    let ptr = if region.is_global() {
        Exp::pointer_literal(dst)
    } else {
        let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, region.clone())?;
        Exp::symbolic_ptr(
            sdesc,
            see.mstate.layout_of(region),
            0, /* The first field */
        )
    };

    // len:
    let len = Exp::int_literal(str_len as i64, Some(64))?;

    // cap:
    let cap = Exp::int_literal(GO_SLICE_CAP as i64, Some(64))?;

    let slice = Exp::tuple(vec![ptr, len, cap], false);
    ensure!(see, see.mstate.store(&sret, slice, false));

    Ok(true)
}

/// From https://github.com/golang/go/blob/a27a525d1b4df74989ac9f6ad10394391fe3eb88/src/runtime/string.go#L25
/// ```go
/// func concatstrings(buf *tmpBuf, a []string) string
/// ```
fn runtime_concatstrings(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_tuple([Type::mk_pointer(), Type::mk_bitvec(64)])), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_bitvec(64))
    ]);

    let tmp_buf = exec_spec!(see, node.args[1]);
    let p_strings = exec_spec!(see, node.args[2]);
    let n_strings = exp_as_data!(exec_spec!(see, node.args[3]), Exp::IntLiteral).value as usize;

    assert_or_throw!(n_strings > 0, "n_strings is 0, not yet implemented");

    let p_desc = &ptr_to_desc!(
        see,
        p_strings,
        {
            see.sman.panic(
                SeError::PtrNull { ptr: p_strings }.to_string(),
                &mut see.traces,
            );
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", p_strings)
    );

    let mut bytes = Vec::new();
    let string_ty = {
        let ptr_ty = Type::mk_pointer();
        let int_ty = Type::mk_bitvec(64);
        Type::mk_tuple([ptr_ty, int_ty])
    };
    for idx in 0..n_strings {
        let string_desc = see
            .mstate
            .get_ptr(string_ty.clone(), p_desc, idx as isize)
            .unwrap();
        let string = see
            .mstate
            .load(string_ty.clone(), &string_desc, Some(&mut see.sman))
            .unwrap();
        let [ref ptr, ref len, ..] = Exp::flatten(string).unwrap()[..] else {
            unreachable!()
        };

        let data = ptr_to_desc!(
            see,
            ptr.clone(),
            {
                see.sman.panic(
                    SeError::PtrNull { ptr: ptr.clone() }.to_string(),
                    &mut see.traces,
                );
                return Ok(false);
            },
            throw_panic!("expected pointer, found {}", ptr)
        );
        let len = exp_as_data!(*len, Exp::IntLiteral).value as usize;
        let data = {
            let byte = Type::mk_bitvec(8);
            let ty = Type::mk_array(len, byte);
            see.mstate.load(ty, &data, Some(&mut see.sman)).unwrap()
        };
        bytes.extend(Exp::flatten(data).unwrap().into_iter());
    }

    let new_len = bytes.len();
    let dst = match tmp_buf.as_ref() {
        Exp::PointerLiteral(data) if new_len <= 32 => data.desc.clone(),
        _ => {
            let ty = Type::mk_bitvec(8);
            let ty = Type::mk_array(new_len, ty);
            see.mstate.alloc_heap(ty, true).unwrap()
        }
    };

    for (idx, byte) in bytes.into_iter().enumerate() {
        let ty = Type::mk_bitvec(8);
        let dst = see.mstate.get_ptr(ty, &dst, idx as isize).unwrap();
        ensure!(see, see.mstate.store(&dst, byte, false));
    }

    // Bind return value
    let ret = {
        let region = see.mstate.region_of(&dst);
        let ptr = if region.is_global() {
            Exp::pointer_literal(dst)
        } else {
            let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, region.clone())?;
            Exp::symbolic_ptr(sdesc, see.mstate().layout_of(region), 0)
        };
        let len = Exp::int_literal(new_len as i64, Some(64))?;
        Exp::tuple(vec![ptr, len], false)
    };
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// From https://github.com/golang/go/blob/1d45a7ef560a76318ed59dfdb178cecd58caf948/src/runtime/map.go#L396
/// ```go
/// func mapaccess1(t *maptype, h *hmap, key unsafe.Pointer) unsafe.Pointer
/// ```
fn runtime_mapaccess1(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer()),
        Some(Type::mk_pointer())
    ]);

    // The hashmap is assumed to be a properly initiated `Exp::Ident`
    let hmap = exec_spec!(see, node.args[2]);
    assert_or_throw!(exp_is_kind!(hmap, Exp::Ident), "found {hmap} for hmap");
    let Some(map) = see
        .vstate
        .get_abstract_map(exp_as_data!(hmap, Exp::Ident).ident.as_ref())
    else {
        make_panic!("{hmap} is not an abstract map").panic(&see.traces)
    };
    let map = (&*map).borrow();

    let ty_ptr = exec_spec!(see, node.args[1]);
    let tdesc = ptr_to_desc!(
        see,
        ty_ptr,
        throw_panic!("expected pointer, found {}", ty_ptr),
        throw_panic!("expected pointer, found {}", ty_ptr)
    );
    let map_ty = go_type(see, &tdesc).get(see.traces());
    let [ref key_ty, ref value_ty, ..] = type_as_kind!(map_ty, Type::Tuple).fields.as_ref() else {
        unreachable!()
    };

    let key = {
        let pkey = exec_spec!(see, node.args[3].clone());
        let desc = ptr_to_desc!(
            see,
            pkey,
            throw_panic!("expected pointer, found {}", pkey),
            throw_panic!("expected pointer, found {}", pkey)
        );
        see.mstate
            .load(key_ty.clone(), &desc, Some(&mut see.sman))
            .unwrap()
    };

    // Access the hashmap
    let key_width = type_as_kind!(*key_ty, Type::BitVec).width;
    let mut map = map.iter();
    let mut done = false;
    let mut any = Exp::false_exp();
    let mut branches = Vec::new();
    while !done {
        let (cond, value) = match map.next() {
            Some((k, value)) => {
                let k = Exp::int_literal(k.parse().unwrap(), Some(key_width))?;
                let cond = Exp::compare(op::CompareOp::Eq, key.clone(), k)?;
                let cond = exec!(see, cond, conc);
                (cond, value.clone())
            }
            None => {
                done = true;
                let cond = Exp::not(any.clone())?;
                let cond = exec!(see, cond, conc);
                // Zero value
                let zero_val = Exp::zero_val(value_ty.clone()).unwrap();
                let See { mstate, .. } = see;
                let zdesc = mstate
                    .alloc_global(zero_val, format!("Zero({value_ty})").into(), true)
                    .get(see.traces());
                let value = Exp::pointer_literal(zdesc);
                (cond, value)
            }
        };

        // Branch operation
        branches.push((
            cond.clone(), // branch condition
            value,
        ));
        if !done {
            any = Exp::boolean(op::BoolOp::Or, any, cond)?;
        }
    }

    // Make the builtin iterator..
    let it = BuiltinIterator::new(
        exp_as_data!(node.assign, Exp::Var).desc.clone(), 
        branches
    );

    // Let `walk_iter` handle the rest..
    see.walk_iter(cur.clone(), Box::new(WalkIterator::Builtin(it)));
    Ok(false)
}

/// From https://github.com/golang/go/blob/1d45a7ef560a76318ed59dfdb178cecd58caf948/src/runtime/map.go#L816
/// ```go
/// func mapiterinit(t *maptype, h *hmap, it *hiter)
/// ```
#[allow(unused)]
fn runtime_mapiterinit(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// From https://github.com/golang/go/blob/a27a525d1b4df74989ac9f6ad10394391fe3eb88/src/fmt/errors.go#L22
/// ```go
/// func Errorf(format string, a ...any) error
/// ```
/// (We don't actually care about the formatting itself..)
fn fmt_errorf(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    let nonnull = {
        let nonzero = Exp::int_literal(0xeeeeeeee, Some(TYPE_POINTER_WIDTH))?;
        let ty = Type::mk_pointer();
        Exp::bitcast(ty, nonzero)?
    };

    let ret = Exp::tuple(vec![nonnull.clone(), nonnull], false);

    // Bind return value
    see.vstate.put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// From https://github.com/golang/go/blob/446a5dcf5a3230ce9832682d8f521071d8a34a2b/src/context/context.go#L713
/// ```go
/// func WithValue(parent Context, key, val any) Context
/// ```
/// Modelled as no-op for now.
///
/// *** The documentation below is deprecated ***
/// Note: there are currently two restrictions on the supported usage of "context.WithValue":
/// (1) Contexts that it creates must not be leaked; namely a function calling "context.WithValue"
///     must not return the context, or store it in reachable memory. Go contexts are not intended
///     to be used like this anyway, and supporting it would require Iceberg to emulate it with heap
///     allocation, which adds overhead.
/// (2) Context keys must be unit structs with no fields (like "LoopKey{}"). Iceberg can then use
///     the (constant) Go type pointer to differentiate keys. Otherwise, custom equality checks must
///     be involved. While this is a true limitation, the Go documentation does suggest that context
///     keys should be unit structs.
#[allow(unused)]
fn ctx_withvalue(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// From https://github.com/golang/go/blob/446a5dcf5a3230ce9832682d8f521071d8a34a2b/src/context/context.go#L752
/// ```go
/// func (c *valueCtx) Value(key any) any
/// ```
#[allow(unused)]
fn ctx_value(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// Parse a `Type` from a description string `str`.
pub fn go_parse_type(str: &str) -> Panicable<Rc<Type>> {
    let str = str.trim();
    let base = str.trim_start_matches('*');
    let ptr_level = str.len() - base.len();

    if ptr_level > 0 {
        return Ok(Type::mk_pointer());
    }

    let ty = if base.starts_with("func") {
        // Function type
        throw_panic!("parsing function type {str} is not supported");
    } else if base.starts_with("[]") {
        // Slice type
        let ptr_ty = Type::mk_pointer();
        let int_ty = Type::mk_bitvec(64);
        Type::mk_tuple([ptr_ty, int_ty.clone(), int_ty])
    } else if base.starts_with("[") {
        // Array type
        let (len, elem) = base.split_once("]").unwrap();
        let len = &len[1..].parse().unwrap();
        let elem_ty = go_parse_type(elem)?;
        Type::mk_array(*len, elem_ty)
    } else if base.starts_with("map[") {
        // Map type
        let (key, value) = base.split_once("]").unwrap();
        let key_ty = go_parse_type(&key[4..])?;
        let value_ty = go_parse_type(value)?;
        assert_or_throw!(
            type_is_kind!(key_ty, Type::BitVec),
            "unsupported key type {key_ty} for {str}"
        );
        Type::mk_tuple([key_ty, value_ty])
    } else {
        match base {
            "bool" => Type::mk_bool(),
            "int8" => Type::mk_bitvec(8),
            "int16" => Type::mk_bitvec(16),
            "int32" => Type::mk_bitvec(32),
            "int64" => Type::mk_bitvec(64),
            "int" => Type::mk_bitvec(64),
            "uint8" => Type::mk_bitvec(8),
            "uint16" => Type::mk_bitvec(16),
            "uint32" => Type::mk_bitvec(32),
            "uint64" => Type::mk_bitvec(64),
            "uint" => Type::mk_bitvec(64),
            "uintptr" => Type::mk_bitvec(TYPE_POINTER_WIDTH),
            "string" => {
                let ptr = Type::mk_pointer();
                let len = Type::mk_bitvec(64);
                Type::mk_tuple([ptr, len])
            }
            _ => {
                // Uncommon type
                base.split('.')
                    .last()
                    .and_then(|str| {
                        let name = format!("%{}.0", str.trim_matches('_') /* _Zone */);
                        Some(Type::resolve(name.as_str()).unwrap())
                    })
                    .unwrap()
            }
        }
    };
    Ok(ty)
}
