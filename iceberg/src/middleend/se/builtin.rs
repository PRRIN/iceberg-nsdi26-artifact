//! Builtin function implementations. The functions in this module replace matching
//! calls, which Iceberg do not analyze via symbolic execution. Instead, these
//! implementations provide delegated execution.
//!
//! The top-level file (this file) contains the `BuiltinManager` and the implementation
//! for LLVM instrinsic functions, which are shared across all target languages.
//! Language-specific builtin implementations are in their own files.

use crate::middleend::se::exec::ptr_to_desc;
use crate::middleend::se::{SolverImpl, WalkIterator};
use crate::middleend::*;
use crate::panic::*;
use std::collections::HashMap;
use std::rc::Rc;

pub mod c;
pub mod cpp;
pub mod golang;
pub mod isc;
pub mod rust;

type BuiltinFunc = fn(&mut See, CfgNodeRef, bool) -> Panicable<bool>;

/// Padding mode for builtin allocations.
#[derive(Clone)]
enum PaddingMode {
    /// The annotated type size must match the given size.
    Exact,
    /// The annotated type size must be no greater than the given size.
    ///
    /// If the given size is larger, the extra bytes are padded with `i8`s.
    Extend,
    /// The annotated type size must divide the given size.
    ///
    /// The allocation is effectively an array of the annotated type.
    Repeat,
}

/// The `BuiltinManager` encapsulates builtin functions.
pub struct BuiltinManager {
    builtin_funcs: HashMap<String, BuiltinFunc>,
    type_hints: HashMap<String, (Rc<Type>, PaddingMode)>,
}

const BUILTINS: [(&str, BuiltinFunc); 47] = [
    ("@llvm.lifetime.start.p0i8", builtin_no_op as BuiltinFunc),
    ("@llvm.lifetime.end.p0i8", builtin_no_op as BuiltinFunc),
    ("@llvm.lifetime.start.p0", builtin_no_op as BuiltinFunc),
    ("@llvm.lifetime.end.p0", builtin_no_op as BuiltinFunc),
    ("@llvm.memcpy.p0.p0.i64", llvm_memcpy as BuiltinFunc),
    ("@llvm.memcpy.p0i8.p0i8.i64", llvm_memcpy as BuiltinFunc),
    ("@llvm.memset.p0.i64", llvm_memset as BuiltinFunc),
    ("@llvm.memset.p0i8.i64", llvm_memset as BuiltinFunc),
    ("@llvm.memmove.p0.p0.i64", llvm_memmove as BuiltinFunc),
    ("@llvm.memmove.p0i8.p0i8.i64", llvm_memmove as BuiltinFunc),
    ("@llvm.abs.i32", llvm_abs as BuiltinFunc),
    ("@llvm.bswap.i16", llvm_bswap as BuiltinFunc),
    ("@llvm.bswap.i32", llvm_bswap as BuiltinFunc),
    ("@llvm.bswap.i64", llvm_bswap as BuiltinFunc),
    ("@llvm.ctlz.i32", llvm_ctlz as BuiltinFunc),
    ("@llvm.ctlz.i64", llvm_ctlz as BuiltinFunc),
    ("@llvm.ctpop.i64", llvm_ctpop as BuiltinFunc),
    ("@llvm.fshl.i32", llvm_fshl as BuiltinFunc),
    ("@llvm.fshl.i64", llvm_fshl as BuiltinFunc),
    ("@llvm.load.relative.i64", llvm_load_relative as BuiltinFunc),
    ("@llvm.prefetch.p0i8", builtin_no_op as BuiltinFunc),
    ("@llvm.smax.i32", llvm_smax as BuiltinFunc),
    ("@llvm.smin.i32", llvm_smin as BuiltinFunc),
    ("@llvm.smin.i64", llvm_smax as BuiltinFunc),
    (
        "@llvm.uadd.with.overflow.i32",
        llvm_uadd_overflow as BuiltinFunc,
    ),
    ("@llvm.umax.i32", llvm_umax as BuiltinFunc),
    ("@llvm.umax.i64", llvm_umax as BuiltinFunc),
    ("@llvm.umax.i8", llvm_umax as BuiltinFunc),
    ("@llvm.umin.i16", llvm_umin as BuiltinFunc),
    ("@llvm.umin.i32", llvm_umin as BuiltinFunc),
    ("@llvm.umin.i64", llvm_umin as BuiltinFunc),
    ("@llvm.umin.i8", llvm_umin as BuiltinFunc),
    (
        "@llvm.umul.with.overflow.i64",
        llvm_umul_overflow as BuiltinFunc,
    ),
    ("@llvm.usub.sat.i8", llvm_usub_sat as BuiltinFunc),
    ("@llvm.usub.sat.i32", llvm_usub_sat as BuiltinFunc),
    (
        "@llvm.usub.with.overflow.i32",
        llvm_usub_overflow as BuiltinFunc,
    ),
    ("@bcmp", bcmp as BuiltinFunc),

    ("@spice.panic", spice_panic as BuiltinFunc),
    ("@spice.debug", spice_debug as BuiltinFunc),
    ("@spice.len", spice_len as BuiltinFunc),
    ("@spice.specialize", spice_specialize as BuiltinFunc),
    ("@spice.values", spice_values as BuiltinFunc),
    ("@spice.ordered", spice_ordered as BuiltinFunc),
    ("@spice.alloc", spice_alloc as BuiltinFunc),
    ("@spice.free", spice_free as BuiltinFunc),
    ("@spice.store", spice_store as BuiltinFunc),
    ("@spice.throw", spice_throw as BuiltinFunc),
];

impl BuiltinManager {
    /// Initialize a builtin manager with the type manager `tman` and
    /// configuration `config`.
    pub fn new(config: &Config) -> Self {
        let mut builtin_funcs = HashMap::new();

        for (func_name, func) in BUILTINS.iter().cloned() {
            builtin_funcs.insert(func_name.into(), func);
        }

        match config.builtin_target() {
            "golang" => {
                for (func_name, func) in golang::GOLANG_BUILTINS.iter().cloned() {
                    builtin_funcs.insert(func_name.into(), func);
                }
            }
            "c" => {
                for (func_name, func) in c::C_BUILTINS.iter().cloned() {
                    builtin_funcs.insert(func_name.into(), func);
                }
            }
            "isc" => {
                for (func_name, func) in isc::ISC_BUILTINS.iter().cloned() {
                    builtin_funcs.insert(func_name.into(), func);
                }
            }
            "cpp" => {
                for (func_name, func) in cpp::CPP_BUILTINS.iter().cloned() {
                    builtin_funcs.insert(func_name.into(), func);
                }
            }
            "rust" => {
                for (func_name, func) in rust::RUST_BUILTINS.iter().cloned() {
                    builtin_funcs.insert(func_name.into(), func);
                }
            }
            "" => { /* No specific target language*/ }
            _ => {
                panic!("unsupported target language {}", config.builtin_target());
            }
        }

        for func_name in config.builtin_nop() {
            builtin_funcs.insert(func_name.clone(), builtin_no_op as BuiltinFunc);
        }
        for func_name in config.builtin_panic() {
            builtin_funcs.insert(func_name.clone(), builtin_panic as BuiltinFunc);
        }

        let mut type_hints = HashMap::new();
        for (alloc_site, (hint, mode)) in config.builtin_type_hint().iter() {
            // Only handles BitVec/Pointer/Named here...
            let ty = match hint.as_str() {
                "i8" => Type::mk_bitvec(8),
                "i16" => Type::mk_bitvec(16),
                "i32" => Type::mk_bitvec(32),
                "i64" => Type::mk_bitvec(64),
                "ptr" => Type::mk_pointer(),
                _ => Type::resolve(hint).unwrap(),
            };
            let mode = match mode.as_str() {
                "!" => PaddingMode::Exact,
                "+" => PaddingMode::Extend,
                "*" => PaddingMode::Repeat,
                _ => panic!("unsupported padding mode {}", mode),
            };
            type_hints.insert(alloc_site.to_string(), (ty, mode));
        }

        BuiltinManager {
            builtin_funcs,
            type_hints,
        }
    }

    pub fn resolve(&self, func_name: &str) -> Option<&BuiltinFunc> {
        self.builtin_funcs.get(func_name)
    }
}

macro_rules! exec_spec {
    ($see: expr, $exp: expr) => {
        match $see.exec_spec($exp.clone()) {
            Some(exp) => exp,
            None => return Ok(false), // do not continue
        }
    };
}
pub(self) use exec_spec;

macro_rules! exec {
    ($see: expr, $exp: expr, $conc: expr) => {
        if $conc {
            match $see.exec_spec($exp.clone()) {
                Some(exp) => exp,
                None => return Ok(false), // do not continue
            }
        } else {
            match $see.exec($exp.clone()) {
                Some(exp) => exp,
                None => return Ok(false), // do not continue
            }
        }
    };
}
pub(self) use exec;

macro_rules! ensure {
    ($see: expr, $exp: expr) => {
        match $exp {
            Ok(exp) => exp,
            Err(SeError::Panic(panic)) => panic.panic($see.traces()),
            Err(err) => {
                $see.sman.panic(err.to_string(), &mut $see.traces);
                return Ok(false);
            }
        }
    };
}
pub(self) use ensure;

macro_rules! type_check {
    ($node:expr, $ret_ty:expr, $arg_ty:expr) => {
        #[cfg(debug_assertions)]
        {
            let ret_ty = &$ret_ty;
            let arg_ty: &[Option<Rc<Type>>] = &$arg_ty;
            assert_or_throw!(
                $node.args.len() == arg_ty.len(), 
                "expected {} arguments, found {}", 
                arg_ty.len(), 
                $node.args.len()
            );
            __type_check_one!($node.assign.ty(), ret_ty);
            for (i, arg_ty) in arg_ty.into_iter().enumerate() {
                __type_check_one!($node.args[i].ty(), arg_ty);
            }
        }
    };
}
pub(self) use type_check;
macro_rules! __type_check_one {
    ($given: expr, $expect: expr) => {
        let hinted: &Option<Rc<Type>> = $expect;
        if let Some(expect) = hinted {
            if !type_eq!($given, *expect) {
                throw_panic!(
                    "expect type {expect} for {}, found {}",
                    stringify!($given),
                    $given
                )
            }
        }
    };
}
#[allow(unused)]
pub(self) use __type_check_one;

/// A `BuiltinIterator` represents all possible branches when
/// executing a builtin function.
///
/// It provides a `next` method that iteratively yields and applies all
/// branches, properly mutating the given `See` internally.
///
/// Meanwhile, the form of the branching behavior is currently limited:
/// a builtin iterator is always a **flattened tree**, where there is only one
/// condition that guards the application of any branch.
/// For example, an iterator for the Golang `runtime.mapaccess1` (hashmap access)
/// would compare the given key against all keys in the map, yielding the value
/// in each branch (and there will be one final branch for the missing key);
/// an iterator for the `memcmp` operation would compress all the conditions
/// where `+1`/`0`/`-1` are returned into 3 large branching conditions, binding
/// the return value in each branch.
pub struct BuiltinIterator {
    /// The value descriptor for the return value.
    ret: ValueDesc,

    /// The remaining branches (branch condition, and the return value) to walk.
    branches: Vec<(Rc<Exp>, Rc<Exp>)>,

    /// Has this iterator taken one branch yet?
    taken: bool,
}

impl BuiltinIterator {
    /// Create a builtin iterator.
    pub fn new(ret: ValueDesc, branches: Vec<(Rc<Exp>, Rc<Exp>)>) -> Self {
        BuiltinIterator {
            ret,
            branches,
            taken: false,
        }
    }

    /// Advance to the next satisfiable and successfully executed branch.
    ///
    /// If all branches are drained, return `false`; otherwise, return `true`.
    pub fn next(&mut self, see: &mut See) -> bool {
        loop {
            if self.taken {
                see.vstate.pop();
                see.sman.regress(&mut see.solver).get(see.traces());
                see.solver.pop();
            }
            if let Some((cond, ret)) = self.branches.pop() {
                self.taken = true;
                see.solver.push();
                see.sman.branch().get(see.traces());
                let mut sat = matches!(exp_as_bool!(cond), Some(true));
                if !sat {
                    see.solver
                        .assert(cond.clone(), &mut see.mstate)
                        .get(see.traces());
                    sat = see.solver.check().into();
                }

                see.vstate.push();
                if sat {
                    see.sman.assume(cond.clone(), &mut see.traces);
                    // Bind the return value
                    // XXX: no throwing is supported here
                    see.vstate.put(&self.ret, ret);
                    break true;
                }
            } else {
                break false;
            }
        }
    }
}

/// Implements the `llvm.memcpy` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-memcpy-intrinsic.
fn llvm_memcpy(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()), 
        Some(Type::mk_pointer()), 
        Some(Type::mk_bitvec(64)), 
        Some(Type::mk_bool())
    ]);

    /* Emulate */
    let dest = exec_spec!(see, node.args[0]);
    let src = exec_spec!(see, node.args[1]);
    let len = exec_spec!(see, node.args[2]);

    let dest_desc = ptr_to_desc!(
        see,
        dest,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: dest }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", dest)
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

    assert_or_throw!(
        exp_is_kind!(len, Exp::IntLiteral),
        "expected integer literal, found {}",
        len
    );

    let mut src_descs = Vec::new();
    let mut dest_descs = Vec::new();
    let range = exp_as_data!(len, Exp::IntLiteral).value;
    assert_or_throw!(range >= 0, "negative range {range}");
    see.mstate
        .walk_range(&src_desc, range as u32, |desc, node| {
            src_descs.push((desc, node.size(), node.is_ptr()))
        })
        .unwrap();
    see.mstate
        .walk_range(&dest_desc, range as u32, |desc, node| {
            dest_descs.push((desc, node.size()))
        })
        .unwrap();

    let src_ofs_start = src_desc.offset();
    let dst_ofs_start = dest_desc.offset();

    let mut src_iter = src_descs.iter();
    let mut dest_iter = dest_descs.iter();

    loop {
        let Some((src_desc, src_size, is_ptr)) = src_iter.next() else {
            assert_or_throw!(
                dest_iter.next().is_none(),
                "mismatch size between src region and dst region"
            );
            break;
        };
        let (dest_desc, dest_size) = dest_iter.next().unwrap();

        assert_or_throw!(
            src_desc.offset() - src_ofs_start == dest_desc.offset() - dst_ofs_start,
            "mismatch alignment between src region and dst region"
        );

        let ty = if *is_ptr {
            Type::mk_pointer()
        } else {
            Type::mk_bitvec(8 * src_size)
        };
        let exp = see
            .mstate
            .load(ty, src_desc, if conc { None } else { Some(&mut see.sman) })
            .unwrap();
        
        match src_size.cmp(dest_size) {
            std::cmp::Ordering::Equal => {
                see.mstate.store(dest_desc, exp, false).unwrap();
            }
            std::cmp::Ordering::Greater => {
                let is_havoc = match &*exp {
                    Exp::Havoc(_) => {
                        see.mstate.store(dest_desc, Exp::havoc(Type::mk_bitvec(8 * dest_size)), false).unwrap();    
                        true
                    },
                    Exp::Null(_) => {
                        see.mstate.store(dest_desc, Exp::int_literal(0, Some(8 * dest_size)).unwrap(), false).unwrap();    
                        false
                    },
                    Exp::IntLiteral(data) if data.value == 0 => {
                        see.mstate.store(dest_desc, Exp::int_literal(0, Some(8 * dest_size)).unwrap(), false).unwrap();    
                        false
                    }
                    Exp::BitCast(data) if exp_is_kind!(data.value, Exp::Havoc) => {
                        see.mstate.store(dest_desc, Exp::havoc(Type::mk_bitvec(8 * dest_size)), false).unwrap();    
                        true
                    },
                    _ => throw_panic!("mismatch type between src region and dst region, and src {exp} is not either havoc or null")
                };

                let mut total_size = *dest_size;
                while total_size < *src_size {
                    let (dest_desc, dest_size) = dest_iter.next().unwrap();
                    let inner_exp = if is_havoc {
                        Exp::havoc(Type::mk_bitvec(8 * dest_size))
                    } else {
                        // println!("dest_offset={}, desc={}", dest_desc.offset() - dst_ofs_start, dest_desc);
                        Exp::int_literal(0, Some(8 * dest_size)).unwrap()
                    };
                    total_size += *dest_size;
                    see.mstate.store(dest_desc, inner_exp, false).unwrap();    
                }
                assert_or_throw!(
                    total_size == *src_size,
                    "mismatch alignment between src region and dst region"
                );
            }
            std::cmp::Ordering::Less => {
                let is_havoc = match &*exp {
                    Exp::Havoc(_) => true,
                    Exp::IntLiteral(data) if data.value == 0 => false,
                    _ => throw_panic!("mismatch type between src region and dst region, and src is not either havoc or 0")
                };

                let mut total_size = *src_size;
                while total_size < *dest_size {
                    let (src_desc, src_size, _) = src_iter.next().unwrap();
                    total_size += src_size;
                    let exp = see
                        .mstate
                        .load(Type::mk_bitvec(8 * src_size), src_desc, if conc { None } else { Some(&mut see.sman) })
                        .unwrap();

                    if is_havoc {
                        assert_or_throw!(
                            exp_is_kind!(exp, Exp::Havoc),
                            "mismatch type between src region and dst region, and src is not havoc"
                        );
                    } else {
                        assert_or_throw!(
                            exp_is_kind!(exp, Exp::IntLiteral),
                            "mismatch type between src region and dst region, and src {exp} is not 0"
                        );
                        assert_or_throw!(
                            exp_as_data!(exp, Exp::IntLiteral).value == 0,
                            "mismatch type between src region and dst region, and src is not 0"
                        );
                    }
                }
                assert_or_throw!(
                    total_size == *dest_size,
                    "mismatch alignment between src region and dst region"
                );

                let inner_exp = if is_havoc {
                    Exp::havoc(Type::mk_bitvec(8 * dest_size))
                } else {
                    Exp::int_literal(0, Some(8 * dest_size)).unwrap()
                };

                see.mstate.store(dest_desc, inner_exp, false).unwrap();
            }
        }
    }

    Ok(true)
}

/// Perform `memset` of `sz` bytes at `ptr`, with `byte`.
fn builtin_memset(see: &mut See, ptr: &MemoryDesc, sz: usize, byte: i8) -> Panicable<bool> {
    let mut descs = Vec::new();
    let range = sz as u32;
    see.mstate
        .walk_range(ptr, range as u32, |desc, node| {
            descs.push((desc, node.size(), node.is_ptr()));
        })
        .get(see.traces());

    for (desc, width, is_ptr) in descs.into_iter() {
        let bitwidth = width * 8;
        let value = {
            let mut v = 0u64;
            for i in 0..16 {
                if i * 8 < bitwidth {
                    v |= (byte as u8 as u64).wrapping_shl(i as u32 * 8);
                } else {
                    v |= if byte < 0 { 0xffu64 } else { 0u64 }.wrapping_shl(i as u32 * 8);
                }
            }
            v as i64
        };

        let value = match (is_ptr, value) {
            (false, _) => Exp::int_literal(value, Some(bitwidth)).unwrap(),
            (true, 0) => Exp::null(),
            (true, _) => {
                let v = Exp::int_literal(value, Some(TYPE_POINTER_WIDTH)).unwrap();
                let ptr_ty = Type::mk_pointer();
                Exp::bitcast(ptr_ty, v).unwrap()
            }
        };
        see.mstate
            .store(&desc, value, false)
            .unwrap_or_else(|err| match err {
                SeError::Panic(panic) => panic.panic(see.traces()),
                _ => unreachable!(),
            });
    }

    Ok(true)
}

/// Implements the `llvm.memset` intrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-memset-intrinsics.
fn llvm_memset(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()), 
        Some(Type::mk_bitvec(8)), 
        Some(Type::mk_bitvec(64)), 
        Some(Type::mk_bool())
    ]);

    /* Emulate */
    let dest = exec_spec!(see, node.args[0]);
    let value = exec_spec!(see, node.args[1]);
    let len = exec_spec!(see, node.args[2]);

    let dest_desc = ptr_to_desc!(
        see,
        dest,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: dest }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", dest)
    );
    assert_or_throw!(
        exp_is_kind!(len, Exp::IntLiteral),
        "expected integer literal, found {}",
        len
    );

    builtin_memset(
        see,
        &dest_desc,
        exp_as_data!(len, Exp::IntLiteral).value as usize,
        exp_as_data!(value, Exp::IntLiteral).value as i8,
    )
}

/// Perform `memmove` of `sz` bytes from `src` to `dst`.
fn builtin_memmove(
    see: &mut See,
    conc: bool,
    dst: &MemoryDesc,
    src: &MemoryDesc,
    sz: usize,
) -> Panicable<bool> {
    let mut src_descs = Vec::new();
    let mut dest_descs = Vec::new();
    let range = sz;
    see.mstate
        .walk_range(src, range as u32, |desc, node| {
            src_descs.push((desc, node.size(), node.is_ptr()))
        })
        .unwrap();
    see.mstate
        .walk_range(dst, range as u32, |desc, _| dest_descs.push(desc))
        .unwrap();

    let src_ofs_start = src.offset();
    let dst_ofs_start = dst.offset();
    assert_or_throw!(
        src_descs.len() == dest_descs.len(),
        "mismatch between src region and dest region"
    );
    for ((src, _, _), dst) in src_descs.iter().zip(dest_descs.iter()) {
        assert_or_throw!(
            src.offset() - src_ofs_start == dst.offset() - dst_ofs_start,
            "mismatch between src region and dest region"
        );
    }

    let mut values = Vec::new();
    for (src_desc, size, is_ptr) in src_descs.into_iter() {
        let ty = if is_ptr {
            Type::mk_pointer()
        } else {
            Type::mk_bitvec(8 * size)
        };
        let loaded = see
            .mstate
            .load(ty, &src_desc, if conc { None } else { Some(&mut see.sman) })
            .unwrap();
        values.push(loaded);
    }
    for (dest_desc, value) in dest_descs.into_iter().zip(values.into_iter()) {
        see.mstate.store(&dest_desc, value, false).unwrap();
    }

    Ok(true)
}

/// Implements the `llvm.memmove` intrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-memmove-intrinsic.
fn llvm_memmove(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()), 
        Some(Type::mk_pointer()), 
        Some(Type::mk_bitvec(64)), 
        Some(Type::mk_bool())
    ]);

    /* Emulate */
    let dest = exec_spec!(see, node.args[0]);
    let src = exec_spec!(see, node.args[1]);
    let len = exec_spec!(see, node.args[2]);

    let dest_desc = ptr_to_desc!(
        see,
        dest,
        {
            see.sman
                .panic(SeError::PtrNull { ptr: dest }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", dest)
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

    assert_or_throw!(
        exp_is_kind!(len, Exp::IntLiteral),
        "expected integer literal, found {}",
        len
    );

    builtin_memmove(
        see,
        conc,
        &dest_desc,
        &src_desc,
        exp_as_data!(len, Exp::IntLiteral).value as usize,
    )
}

/// Implements the `llvm.abs.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-abs-intrinsic.
fn llvm_abs(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [
        None,
        Some(Type::mk_bool())
    ]);

    let width = type_as_kind!(node.args[0].ty(), Type::BitVec).width;

    /*
       From http://graphics.stanford.edu/~seander/bithacks.html#IntegerAbs.
       int v;           // we want to find the absolute value of v
       unsigned int r;  // the result goes here
       int const mask = v >> sizeof(int) * CHAR_BIT - 1;

       r = (v + mask) ^ mask;
    */
    let shamt = Exp::int_literal(width as i64 - 1, Some(width)).unwrap();
    let mask = Exp::arith(op::ArithOp::Ashr, node.args[0].clone(), shamt).unwrap();
    let res = Exp::arith(
        op::ArithOp::Xor,
        Exp::arith(op::ArithOp::Add, node.args[0].clone(), mask.clone()).unwrap(),
        mask,
    )
    .unwrap();

    let ret = if exp_as_bool!(node.args[1]).unwrap() {
        // is_int_min_poison
        throw_panic!("llvm.abs.*(_, true) is not implemented yet")
    } else {
        exec!(see, res, conc)
    };

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// Implements the `llvm.bswap.*` instrinsic (byte swap).
/// From https://llvm.org/docs/LangRef.html#llvm-bswap-intrinsics.
fn llvm_bswap(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None]);

    let ty = node.args[0].ty();
    let width = type_as_kind!(ty, Type::BitVec).width;
    let nbyte = width / 8;
    assert_or_throw!(nbyte % 2 == 0, "llvm_bswap_* is not implemented for {ty}");

    let mut bytes = (0..nbyte).map(|i| {
        let shifted = if i < nbyte / 2 {
            let shamt = Exp::int_literal((nbyte - 1 - 2 * i) as i64, Some(width)).unwrap();
            Exp::arith(op::ArithOp::Lshr, node.args[0].clone(), shamt).unwrap()
        } else {
            let shamt = Exp::int_literal((2 * i + 1 - nbyte) as i64, Some(width)).unwrap();
            Exp::arith(op::ArithOp::Shl, node.args[0].clone(), shamt).unwrap()
        };
        let mask = Exp::int_literal(0xff << (i as i64), Some(width)).unwrap();
        Exp::arith(op::ArithOp::And, shifted, mask).unwrap()
    });
    let first = bytes.next().unwrap();
    let res = bytes.fold(first, |acc, b| Exp::arith(op::ArithOp::Or, acc, b).unwrap());
    let ret = exec!(see, res, conc);

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// Implements the `llvm.ctlz.*` instrinsic (count leading zero).
/// From https://llvm.org/docs/LangRef.html#llvm-ctlz-intrinsic.
fn llvm_ctlz(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// Implements the `llvm.ctpop.*` instrinsic (count pop, aka. count bits set).
/// From https://llvm.org/docs/LangRef.html#llvm-ctpop-intrinsic.
fn llvm_ctpop(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!()
}

/// Implements the `llvm.fshl.*` instrinsic (funnel shift left).
/// From https://llvm.org/docs/LangRef.html#llvm-fshl-intrinsic.
fn llvm_fshl(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None, None]);

    let width = type_as_kind!(node.assign.ty(), Type::BitVec).width;
    let shamt =
        exp_as_data!(exec_spec!(see, node.args[2].clone()), Exp::IntLiteral).value as u32 % width;

    let a0 = Exp::arith(
        op::ArithOp::Shl,
        node.args[1].clone(),
        Exp::int_literal(shamt as i64, Some(width)).unwrap(),
    )
    .unwrap();
    let a1 = Exp::arith(
        op::ArithOp::Lshr,
        node.args[1].clone(),
        Exp::int_literal((width - shamt) as i64, Some(width)).unwrap(),
    )
    .unwrap();
    let res = Exp::arith(op::ArithOp::Or, a0, a1).unwrap();

    let ret = exec!(see, res, conc);

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// Implements the `llvm.load.relative.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-load-relative-intrinsic.
fn llvm_load_relative(_: &mut See, _: CfgNodeRef, _: bool) -> Panicable<bool> {
    todo!("llvm.load.relative.* is not implemented yet")
}

/// Implements the `llvm.smax.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-smax-intrinsic.
fn llvm_smax(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_maxmin(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        true,
        true,
        cur,
        conc,
    )
}

/// Implements the `llvm.smin.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-smin-intrinsic.
fn llvm_smin(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_maxmin(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        false,
        true,
        cur,
        conc,
    )
}

/// Implements the `llvm.umax.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-umax-intrinsic.
fn llvm_umax(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_maxmin(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        true,
        false,
        cur,
        conc,
    )
}

/// Implements the `llvm.umin.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-umin-intrinsic.
fn llvm_umin(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_maxmin(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        false,
        false,
        cur,
        conc,
    )
}

fn builtin_maxmin(
    see: &mut See,
    a: Rc<Exp>,
    b: Rc<Exp>,
    max: bool,
    signed: bool,
    cur: CfgNodeRef,
    conc: bool,
) -> Panicable<bool> {
    let a = exec!(see, a, conc);
    let b = exec!(see, b, conc);
    let (op_a, op_b) = match (max, signed) {
        (true, true) => (op::CompareOp::Sgt, op::CompareOp::Sle),
        (false, true) => (op::CompareOp::Slt, op::CompareOp::Sge),
        (true, false) => (op::CompareOp::Ugt, op::CompareOp::Ule),
        (false, false) => (op::CompareOp::Ult, op::CompareOp::Uge),
    };

    let branches = vec![
        (Exp::compare(op_a, a.clone(), b.clone()).unwrap(), a.clone()),
        (Exp::compare(op_b, a.clone(), b.clone()).unwrap(), b.clone()),
    ];

    // Make the builtin iterator..
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    let it = BuiltinIterator::new(exp_as_data!(node.assign, Exp::Var).desc.clone(), branches);

    // Let `walk_iter` handle the rest..
    see.walk_iter(cur.clone(), Box::new(WalkIterator::Builtin(it)));
    Ok(false)
}

/// Implements the `llvm.uadd.with.overflow.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-uadd-with-overflow-intrinsics.
fn llvm_uadd_overflow(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Add,
        false,
        cur,
        conc,
    )
}

/// Implements the `llvm.uadd.sat.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-uadd-sat-intrinsics.
#[allow(unused)]
fn llvm_uadd_sat(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Add,
        true,
        cur,
        conc,
    )
}

/// Implements the `llvm.usub.with.overflow.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-usub-with-overflow-intrinsics.
fn llvm_usub_overflow(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Sub,
        false,
        cur,
        conc,
    )
}

/// Implements the `llvm.usub.sat.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-usub-sat-intrinsics.
fn llvm_usub_sat(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Sub,
        true,
        cur,
        conc,
    )
}

/// Implements the `llvm.umul.with.overflow.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-umul-with-overflow-intrinsics.
fn llvm_umul_overflow(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Mul,
        false,
        cur,
        conc,
    )
}

/// Implements the `llvm.umul.sat.*` instrinsic.
/// From https://llvm.org/docs/LangRef.html#llvm-umul-sat-intrinsics.
#[allow(unused)]
fn llvm_umul_sat(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None, None]);

    builtin_checked_uop(
        see,
        node.args[0].clone(),
        node.args[1].clone(),
        op::ArithOp::Mul,
        true,
        cur,
        conc,
    )
}

fn builtin_checked_uop(
    see: &mut See,
    a: Rc<Exp>,
    b: Rc<Exp>,
    op: op::ArithOp,
    sat_or_overflow: bool,
    cur: CfgNodeRef,
    conc: bool,
) -> Panicable<bool> {
    let a = exec!(see, a, conc);
    let b = exec!(see, b, conc);
    let res = exec!(see, Exp::arith(op, a.clone(), b.clone()).unwrap(), conc);
    let width = type_as_kind!(res.ty(), Type::BitVec).width;

    let (overflow, sat) = match op {
        op::ArithOp::Add => {
            // result is smaller than either operand?
            let overflow = Exp::compare(op::CompareOp::Ult, res.clone(), a.clone()).unwrap();
            (overflow, Exp::int_literal(-1, Some(width)).unwrap())
        }
        op::ArithOp::Sub => {
            let overflow = Exp::compare(op::CompareOp::Ult, a.clone(), b.clone()).unwrap();
            (overflow, Exp::int_literal(0, Some(width)).unwrap())
        }
        op::ArithOp::Mul => {
            // XXX: checking for overflow requires specialization
            let b = exp_as_data!(exec_spec!(see, b.clone()), Exp::IntLiteral).value as u64;
            let overflow = if b == 0 {
                Exp::false_exp()
            } else {
                let res = exp_as_data!(exec_spec!(see, res.clone()), Exp::IntLiteral).value as u64;
                let a = exp_as_data!(exec_spec!(see, a.clone()), Exp::IntLiteral).value as u64;
                if res / b != a {
                    Exp::true_exp()
                } else {
                    Exp::false_exp()
                }
            };
            (overflow, Exp::int_literal(-1, Some(width)).unwrap())
        }
        _ => todo!(),
    };

    let branches = if sat_or_overflow {
        // sat
        vec![(overflow.clone(), sat), (Exp::not(overflow).unwrap(), res)]
    } else {
        // overflow
        vec![
            (
                overflow.clone(),
                Exp::tuple(vec![res.clone(), Exp::true_exp()], false),
            ),
            (
                Exp::not(overflow).unwrap(),
                Exp::tuple(vec![res.clone(), Exp::false_exp()], false),
            ),
        ]
    };

    // Make the builtin iterator..
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    let it = BuiltinIterator::new(exp_as_data!(node.assign, Exp::Var).desc.clone(), branches);

    // Let `walk_iter` handle the rest..
    see.walk_iter(cur.clone(), Box::new(WalkIterator::Builtin(it)));

    Ok(false)
}

/// LIBC `bcmp()`; for some reason LLVM generates this even not for C.
/// From https://man7.org/linux/man-pages/man3/bcmp.3.html.
fn bcmp(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bitvec(32)), [
        Some(Type::mk_pointer()), 
        Some(Type::mk_pointer()), 
        Some(Type::mk_bitvec(64))
    ]);

    /* Emulate */
    let a = exec_spec!(see, node.args[0]);
    let b = exec_spec!(see, node.args[1]);
    let len = exec_spec!(see, node.args[2]);

    let len = exp_as_data!(len, Exp::IntLiteral).value as usize;

    let gt_ret = Exp::int_literal(1, Some(32))?;
    let lt_ret = Exp::int_literal(-1, Some(32))?;
    let eq_ret = Exp::int_literal(0, Some(32))?;
    builtin_memcmp(see, cur.clone(), a, b, len, gt_ret, lt_ret, eq_ret, conc)
}

/// Emulates `memcmp`, returning 0 if the compared regions are equal up to
/// `len` bytes, or +/- 1 according to the first difference.
fn builtin_memcmp(
    see: &mut See,
    cur: CfgNodeRef,
    a: Rc<Exp>,
    b: Rc<Exp>,
    len: usize,
    gt_ret: Rc<Exp>,
    lt_ret: Rc<Exp>,
    eq_ret: Rc<Exp>,
    conc: bool,
) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    let assign = &exp_as_data!(node.assign, Exp::Var).desc;

    if len > 0 {
        let a_mdesc = ptr_to_desc!(
            see,
            a,
            {
                see.sman
                    .panic(SeError::PtrNull { ptr: a }.to_string(), &mut see.traces);
                return Ok(false);
            },
            throw_panic!("expected pointer, found {}", a)
        );
        let b_mdesc = ptr_to_desc!(
            see,
            b,
            {
                see.sman
                    .panic(SeError::PtrNull { ptr: b }.to_string(), &mut see.traces);
                return Ok(false);
            },
            throw_panic!("expected pointer, found {}", b)
        );
        let mut a_descs = Vec::new();
        let mut b_descs = Vec::new();
        let range = len as u32;

        see.mstate
            .walk_range(&a_mdesc, range as u32, |desc, node| {
                a_descs.push((desc, node.size(), node.is_ptr()));
            })
            .unwrap();
        see.mstate
            .walk_range(&b_mdesc, range as u32, |desc, node| {
                b_descs.push((desc, node.size(), node.is_ptr()));
            })
            .unwrap();
        let src_ofs_start = a_mdesc.offset();
        let dst_ofs_start = b_mdesc.offset();
        assert_or_throw!(
            a_descs.len() == b_descs.len(),
            "mismatch between src region and dest region"
        );
        for ((src, _, _), (dst, _, _)) in a_descs.iter().zip(b_descs.iter()) {
            assert_or_throw!(
                src.offset() - src_ofs_start == dst.offset() - dst_ofs_start,
                "mismatch between src region and dest region"
            );
        }

        let mut gt = Exp::false_exp();
        let mut lt = Exp::false_exp();
        let mut eq = Exp::true_exp();
        // Enumerate all comparison results.
        // XXX: for simplicity, all values are pre-executed here,
        // while the actual semantics of `memcmp` should only never reach the
        // values beyond the first difference.
        // Consequently, if the execution produces a recoverable `SeError`, we
        // throw a `Panic` instead of silently backtracking, because that error
        // should not happen with the precise semantics. The hope is that such a
        // case never happens..
        for ((a_desc, asize, aptr), (b_desc, bsize, bptr)) in
            a_descs.into_iter().zip(b_descs.into_iter())
        {
            let aty = if aptr {
                Type::mk_pointer()
            } else {
                Type::mk_bitvec(8 * asize)
            };
            let bty = if bptr {
                Type::mk_pointer()
            } else {
                Type::mk_bitvec(8 * bsize)
            };

            assert_or_throw!(
                type_eq!(aty, bty),
                "compared values have different types: {aty}, {bty}"
            );
            let a = see
                .mstate
                .load(aty, &a_desc, if conc { None } else { Some(&mut see.sman) })
                .unwrap();
            let b = see
                .mstate
                .load(bty, &b_desc, if conc { None } else { Some(&mut see.sman) })
                .unwrap();

            let Some(a) = (if conc {
                see.exec_spec(a.clone())
            } else {
                see.exec(a.clone())
            }) else {
                make_panic!("error when executing compared value {a}").panic(&see.traces)
            };
            let Some(b) = (if conc {
                see.exec_spec(b.clone())
            } else {
                see.exec(b.clone())
            }) else {
                make_panic!("error when executing compared value {b}").panic(&see.traces)
            };

            let cur_gt = Exp::compare(op::CompareOp::Ugt, a.clone(), b.clone())?;
            let cur_lt = Exp::compare(op::CompareOp::Ult, a.clone(), b.clone())?;
            let cur_eq = Exp::compare(op::CompareOp::Eq, a.clone(), b.clone())?;

            let cur_gt = Exp::boolean(op::BoolOp::And, cur_gt, eq.clone())?;
            gt = Exp::boolean(op::BoolOp::Or, gt, cur_gt)?;

            let cur_lt = Exp::boolean(op::BoolOp::And, cur_lt, eq.clone())?;
            lt = Exp::boolean(op::BoolOp::Or, lt, cur_lt)?;

            eq = Exp::boolean(op::BoolOp::And, eq, cur_eq)?;
        }

        let branches = vec![(gt, gt_ret), (lt, lt_ret), (eq, eq_ret)];

        // Make the builtin iterator..
        let it = BuiltinIterator::new(assign.clone(), branches);

        // Let `walk_iter` handle the rest..
        see.walk_iter(cur.clone(), Box::new(WalkIterator::Builtin(it)));
        Ok(false)
    } else {
        // Always equal
        see.vstate.put(assign, eq_ret);
        Ok(true)
    }
}

/// No-op.
fn builtin_no_op(_: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(_) = cur.as_ref() else {
        unreachable!()
    };

    Ok(true)
}

/// Panic.
fn builtin_panic(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };
    see.sman
        .panic(format!("panic at {}", node.funct), &mut see.traces);
    /* Panic */
    Ok(false)
}

fn builtin_malloc(see: &mut See, cur: CfgNodeRef, size: u32) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    let assign = &exp_as_data!(node.assign, Exp::Var).desc;
    let ValueDesc::Local(alloc_site, _) = assign else {
        unreachable!()
    };
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
                sz == size,
                "{alloc_site} is annotated to be {ty} (exact), but the allocated size is {size} bytes"
            );
            ty
        }
        PaddingMode::Extend => {
            assert_or_throw!(
                sz <= size,
                "{alloc_site} is annotated to be {ty} (extend), but the allocated size is {size} bytes"
            );
            if size > sz {
                Type::mk_tuple([ty, typ!([i8; (size - sz) as usize])])
            } else {
                ty
            }
        }
        PaddingMode::Repeat => {
            assert_or_throw!(
                size % sz == 0,
                "{alloc_site} is annotated to be {ty} (repeat), but the allocated size is {size} bytes"
            );
            if size != sz {
                Type::mk_array((size / sz) as usize, ty)
            } else {
                ty
            }
        }
    };
    let mdesc = see.mstate.alloc_heap(ty, false)?;

    // Assign a symbolic region
    let actual = see.mstate.region_of(&mdesc);
    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())?;
    let ret = Exp::symbolic_ptr(sdesc, see.mstate.layout_of(actual), 0);

    // Bind return value
    see.vstate.put(&assign, ret);
    Ok(true)
}

fn builtin_free(see: &mut See, cur: CfgNodeRef, ptr: Rc<Exp>) -> Panicable<bool> {
    let CfgNode::FuncCall(_) = cur.as_ref() else {
        unreachable!()
    };

    let ptr = exec_spec!(see, ptr);
    let desc = ptr_to_desc!(
        see,
        ptr,
        {
            see.sman
                .panic(SeError::PtrNull { ptr }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", ptr)
    );
    let rdesc = see.mstate().region_of(&desc);
    ensure!(see, see.mstate_mut().free_heap(rdesc));
    Ok(true)
}

fn builtin_ok(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    assert_or_throw!(
        type_eq!(node.assign.ty(), Type::mk_bitvec(32)),
        "expected to return i32, found {}",
        node.assign.ty(),
    );

    let ret = Exp::int_literal(0, Some(32)).unwrap();

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// Perform a memory store through a pointer.
/// ```txt
/// let _ = store(p, 1234w32);
/// p |> *Int<32>
///
/// >>> 1234w32
/// ```
#[allow(unused)]
fn spice_store(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        Some(Type::mk_pointer()), 
        None,
    ]);

    let exp = exec!(see, node.args[1], conc);
    let ptr = exec_spec!(see, node.args[0]);
    let desc = ptr_to_desc!(
        see,
        ptr,
        {
            see.sman
                .panic(SeError::PtrNull { ptr }.to_string(), &mut see.traces);
            return Ok(false);
        },
        throw_panic!("expected pointer, found {}", ptr)
    );
    ensure!(see, see.mstate.store(&desc, exp, false));

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, Exp::none());
    Ok(true)
}

/// Panic the function.
/// ```txt
/// panic("whoops!")
///
/// >>> ! // unreachable; an `Effect::Panic` with message "whoops!" is produced
/// ````
fn spice_panic(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bool()), [None]);

    let msg = exec!(see, node.args[0], false);
    see.sman
        .panic(format!("[spice.panic] {}", msg), &mut see.traces);
    Ok(false)
}

/// Print the argument to the debugging output.
/// ```txt
/// let x = 1 + 2;
/// debug(x)
///
/// >>> (); // `3` is printed
/// ````
fn spice_debug(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None]);

    let exp = exec!(see, node.args[0], conc);
    println!("[spice.debug] {exp}");

    // Bind return value
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, Exp::none());
    Ok(true)
}

/// Get the length of an `Exp::List`.
/// ```txt
/// let list := [1, 2, 3];
/// len(list)
///
/// >>> 3
/// ```
fn spice_len(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_int()), [None]);

    /* Emulate */
    let src = exec!(see, node.args[0], conc);

    assert_or_throw!(
        exp_is_kind!(src, Exp::Vector),
        "expected List, found {}",
        src
    );
    let exp = exp_as_data!(src, Exp::Vector);

    let retval = Exp::int_literal(exp.elems.len() as i64, None).unwrap();
    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, retval);
    Ok(true)
}

/// Specialize on the argument; returns `true`.
/// ```txt
/// specialize(x)
///
/// >>> true; // `x` is specialized
/// ````
fn spice_specialize(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_bool()), [None]);

    let _ = exec_spec!(see, node.args[0]);

    see.vstate.put(
        &exp_as_data!(node.assign, Exp::Var).desc,
        Exp::int_literal(-1, Some(1)).unwrap(),
    );
    Ok(true)
}

/// Get the values of an abstract map as a `List`.
/// ```txt
/// values(*elem.m)
///
/// >>> [ /* Pointers to RRs */ ]
/// ````
fn spice_values(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None]);

    let exp = exec_spec!(see, node.args[0]);

    assert_or_throw!(
        exp_is_kind!(exp, Exp::Ident),
        "expected Ident, found {}",
        exp
    );
    let Some(map) = see
        .vstate
        .get_abstract_map(exp_as_data!(exp, Exp::Ident).ident.as_ref())
    else {
        make_panic!("{exp} is not an abstract map").panic(&see.traces)
    };

    let map = (&*map).borrow();
    let values = map.values().cloned().collect();
    let list_ty = node.assign.ty();
    let list = Exp::vector(list_ty, values).get(see.traces());

    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, list);
    Ok(true)
}

/// Construct a ordered copy of the given list.
///
/// The ordering is UNSPECIFIED for any type (internally it simply uses the string format
/// of the elements to sort), but is guaranteed to be the same for the same input.
/// This function is thus most useful for comparing two orderless sets, by ordering them
/// first, and then doing a list comparison.
/// ```txt
/// let l = [3, 2, 1];
/// ordered(l)
///
/// >>> [1, 2, 3]
/// ````
fn spice_ordered(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, None, [None]);

    let list = exec_spec!(see, node.args[0]);

    /* Emulate */
    assert_or_throw!(
        exp_is_kind!(list, Exp::Vector),
        "expected List, found {}",
        list,
    );
    let data = exp_as_data!(list, Exp::Vector);
    let mut sorted = data.elems.clone();
    sorted.sort_by_cached_key(|exp| exp.to_string());
    let retval = Exp::vector(data.ty.clone(), sorted).get(see.traces());

    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, retval);
    Ok(true)
}

/// Allocate a heap region, initializing it with the given value.
/// ```txt
/// let p = alloc(0w64);
/// p |> *Int<64>
///
/// >>> 0w64
/// ```
fn spice_alloc(see: &mut See, cur: CfgNodeRef, conc: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_pointer()), [None]);

    let exp = exec!(see, node.args[0].clone(), conc);
    let ty = exp.ty();
    let mdesc = see
        .mstate_mut()
        .alloc_heap(ty.clone(), false)
        .get(see.traces());
    if ty.get_layout(see.mstate_mut()).unwrap().size > 0 {
        see.mstate_mut().store(&mdesc, exp, false).unwrap();
    }

    let rdesc = see.mstate.region_of(&mdesc);
    // Assign a symbolic region
    let sdesc = SymbolicRegionDesc::from_actual(see.sman(), rdesc.clone()).get(see.traces());
    let ret = Exp::symbolic_ptr(sdesc, see.mstate.layout_of(rdesc), 0);

    see.vstate
        .put(&exp_as_data!(node.assign, Exp::Var).desc, ret);
    Ok(true)
}

/// Free a heap region.
/// ```txt
/// let p = alloc(0w64);
/// free(p)
///
/// >>> () /* `p` is freed */
/// ```
fn spice_free(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [Some(Type::mk_pointer())]);

    let ptr = node.args[0].clone();
    builtin_free(see, cur, ptr)
}

/// Throw a exception.
/// ```txt
/// let ex: OutOfRangeException = havoc;
/// throw(ex, "@OutOfRange")
///
/// >>> ! // unreachable; an exception is thrown
/// ```
fn spice_throw(see: &mut See, cur: CfgNodeRef, _: bool) -> Panicable<bool> {
    let CfgNode::FuncCall(node) = cur.as_ref() else {
        unreachable!()
    };

    type_check!(node, Some(Type::mk_unit()), [
        None,
        Some(Type::mk_pointer())
    ]);

    // ..get the exception object
    let obj = exec_spec!(see, node.args[0]);

    // ..get the type_id
    let arg = exec_spec!(see, node.args[1]);
    let ex_name = exp_as_data!(arg, Exp::Ident).ident.clone();
    let type_info_desc = see
        .mstate()
        .get_global(&ex_name, true)
        .ok_or_else(|| make_panic!("{ex_name} is not a exception"))?;
    let type_id = Exp::int_literal(type_info_desc.region_id().get().into(), Some(32)).unwrap();

    // ..allocate memory for the exception (plus the header)
    let ex_desc = see
        .mstate
        .alloc_heap(
            Type::mk_tuple([
                Type::mk_bitvec(32), 
                Type::mk_bitvec(32), 
                Type::mk_pointer(), 
                obj.ty(),
            ]), 
            false,
        ).unwrap();
    let actual = see.mstate.region_of(&ex_desc);
    let sdesc = SymbolicRegionDesc::from_actual(&mut see.sman, actual.clone())?;
    let ex = Exp::symbolic_ptr(sdesc, see.mstate.layout_of(actual), 16 /* the actual object */);

    // ..initialize the type ID, caught count, and the object
    // TODO: add destructor once we solve the __cxa_end_catch issue
    {
        let desc = &ex_desc;
        see.mstate.store(&desc, type_id, false).unwrap();
    }
    {
        let desc = see.mstate.get_ptr(Type::mk_bitvec(8), &ex_desc, 4).unwrap();
        see.mstate.store(&desc, Exp::int_literal(0, Some(32)).unwrap(), false).unwrap();
    }
    {
        let desc = see.mstate.get_ptr(Type::mk_bitvec(8), &ex_desc, 16).unwrap();
        see.mstate.store(&desc, obj, false).unwrap();
    }

    // Bind the exception value
    see.vstate.put(cur.func.throwval(), ex);
    see.vstate.put(cur.func.ex_flag(), Exp::true_exp());
    Ok(true)
}
