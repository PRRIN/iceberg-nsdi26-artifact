pub mod bind;
pub mod coredns;
pub mod pdns;
pub mod hickory_dns;

pub fn get_summary_outfile(testname: &str, filename: &str) -> std::fs::File {
    let mut file_path = std::env::current_dir().expect("failed to get current directory");
    file_path.push("test");
    file_path.push(testname);
    file_path.push(filename);
    std::fs::OpenOptions::new()
        .create(true)
        .truncate(true)
        .write(true)
        .open(file_path)
        .expect("cannot open summary outfile")
}

pub fn verify(target: &str, test_suite: &str, test_id: &str) {
    let test_path = format!("test/{target}/json/{test_suite}/{test_id}");
    match target {
        "coredns" => {
            if !std::path::Path::new(&test_path).exists() {
                return;
            }
            let mut see = crate::glue::llvm::parse(coredns::IR_FILE, Some(coredns::CONFIG_FILE));
            see.sman().add_scope("verify_coredns".into()).unwrap();
            coredns::verify(&mut see, test_suite, test_id).get(see.traces());
        }
        "bind" => {
            if !std::path::Path::new(&test_path).exists() {
                return;
            }
            let mut see = crate::glue::llvm::parse(bind::IR_FILE, Some(bind::CONFIG_FILE));
            see.sman().add_scope("verify_bind".into()).unwrap();
            bind::verify(&mut see, test_suite, test_id).get(see.traces());
        }
        "pdns" => {
            if !std::path::Path::new(&test_path).exists() {
                return;
            }
            let mut see = crate::glue::llvm::parse(pdns::IR_FILE, Some(pdns::CONFIG_FILE));
            see.sman().add_scope("verify_pdns".into()).unwrap();
            pdns::verify(&mut see, test_suite, test_id).get(see.traces());
        }
        "hickory-dns" => {
            if !std::path::Path::new(&test_path).exists() {
                return;
            }
            let mut see = crate::glue::llvm::parse(hickory_dns::IR_FILE, Some(hickory_dns::CONFIG_FILE));
            see.sman().add_scope("verify_hickory_dns".into()).unwrap();
            see.sman().add_scope("test_hickory_dns".into()).unwrap();
            hickory_dns::verify(&mut see, test_suite, test_id).get(see.traces());
        }
        _ => panic!("unsupported target {target}"),
    };
}

// --- Target-independent Utilities ---
use crate::middleend::*;
use crate::panic::*;
use crate::util::StringRef;
use std::rc::Rc;

/// Make a pointer value from `pointee`, allocating a global memory region.
fn make_pointer(see: &mut See, pointee: Rc<Exp>, alloc_name: StringRef, constant: bool) -> Rc<Exp> {
    let mdesc = see
        .alloc_global(pointee.clone(), alloc_name, constant)
        .get(see.traces());

    Exp::pointer_literal(mdesc)
}

/// Make a heap pointer from `pointee`, allocating a heap memory region.
#[allow(unused)]
fn make_heap_pointer(see: &mut See, pointee: Rc<Exp>) -> Rc<Exp> {
    let mdesc = see.alloc_heap(pointee.ty(), false).get(see.traces());
    if pointee.ty().get_layout(see.mstate_mut()).unwrap().size > 0 {
        see.mstate_mut().store(&mdesc, pointee, true).unwrap();
    }
    Exp::pointer_literal(mdesc)
}

/// Make a truly symbolic value using `ty` and `name`.
fn make_symbolic(see: &mut See, ty: Rc<Type>, name: &str) -> Rc<Exp> {
    let vdesc = see.vstate_mut().global(name);
    SymbolicDesc::from_vdesc(see, &vdesc, ty).get(see.traces())
}

/// Make a character array with `with`.
fn make_char_array(see: &mut See, with: &[u8]) -> Rc<Exp> {
    let bytes = with;
    let len = bytes.len();
    let cty = Type::mk_bitvec(8);
    let elems = (0..len)
        .map(|i| Exp::int_literal(bytes[i] as i64, Some(8)))
        .collect::<Panicable<Vec<_>>>()
        .get(see.traces());
    let ty = Type::mk_array(len, cty.clone());
    Exp::vector(ty, elems).get(see.traces())
}

/// Make a symbolic character array.
fn make_symbolic_char_array(see: &mut See, len: usize, alloc_name: StringRef) -> Rc<Exp> {
    let cty = Type::mk_bitvec(8);
    let elems: Vec<_> = (0..len)
        .map(|i| make_symbolic(see, cty.clone(), format!("{alloc_name}::{i}").as_str()))
        .collect();
    let ty = Type::mk_array(len, cty.clone());
    Exp::vector(ty, elems).get(see.traces())
}
