//! Iceberg's Data-structure DUMPer, for the Rust language.
//! 
//! This tool generates code that dumps the memory content of any given
//! data structure, based on the typing information provided via the type
//! declarations in the LLVM IR.
//! 
//! ### Caveat
//! // XXX: revisit
//! For now it is assumed that the provided typing definitions do not contain
//! *directly nested tuples*, i.e., a `Type::Tuple` directly containing a sub-`Tuple`.
//! The LLVM IR for Rust does satisfy such an assumption.

use std::collections::{HashMap, HashSet};
use std::fs::File;
use std::rc::Rc;
use std::io::Write;
use iceberg::glue::llvm;
use iceberg::middleend::*;
use iceberg::util::StringRef;


/// Context for generating the dump functions.
struct Context {
    /// The symbolic execution engine.
    see: See,
    /// Generated dump functions, unique by the dumped types.
    dump_funcs: HashMap<String, String>,

    /* Configurable constants */

    /// Skip dumping the internals of these types.
    skipped_types: HashSet<&'static str>,
    /// These type fields are dynamically sized: 
    /// (type, pointer ofs) :-> (pointee length)
    dynamic_types: HashMap<(&'static str, u32), PointeeLength>,
}

#[derive(Clone)]
enum DumpTask {
    Scalar,
    Pointer { 
        pointee: Rc<TypeExt>,
        /// Instructs the dump function to use `length` as the length of pointee.
        length: PointeeLength,
    },
    /// Instructs the dump function to dump the field in hex.
    Hex,
    /// Instruct the dump function to skip dumpping the field.
    Skip,
}

impl std::fmt::Debug for DumpTask {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            DumpTask::Scalar => write!(f, "Scalar"),
            DumpTask::Pointer { pointee, .. } => {
                write!(f, "Pointer({:?})", pointee)
            }
            DumpTask::Hex => write!(f, "Hex"),
            DumpTask::Skip => write!(f, "Skip"),
        }
    }
}

#[derive(Clone)]
#[allow(unused)]
enum PointeeLength {
    /// The pointee is a scalar.
    None,
    /// The pointee length is to be loaded at a relative offset as
    /// a 8-byte integer.
    LoadI64(i64),
    /// The pointee length is constant.
    Const(u32),
}

const DUMP_HEADER: &'static str = r#"
// TODO
"#;

impl Context {
    fn new(see: See) -> Self {
        // TODO: make this externally configurable
        let skipped_types: HashSet<&'static str> = HashSet::from_iter([].iter().cloned());

        let dynamic_types: HashMap<_, _> = HashMap::from_iter([
        ].iter().cloned());
        
        Context {
            see,
            dump_funcs: HashMap::new(),
            skipped_types,
            dynamic_types,
        }
    }
}

/// Get the standardised name for `type_name`.
fn dump_name(type_name: StringRef) -> String {
    let name = type_name
        .as_bytes()
        .into_iter()
        .map(|byte| match byte {
            b'a'..=b'z' | b'A'..=b'Z' | b'0'..=b'9' => *byte,
            _ => b'_',
        })
        .collect();
    String::from_utf8(name).unwrap()
}

/// Generate dump tasks for the named type with `type_name`.
fn dump_gen_tasks_named(
    ctx: &mut Context, 
    type_name: StringRef,
) -> Vec<DumpTask> {
    let ty = Type::resolve(&type_name).unwrap();
    let layout = ty.get_layout(ctx.see.mstate_mut()).unwrap();
    let mut flattened = layout.flattened.iter().cloned().peekable();

    if ctx.skipped_types.contains(type_name.as_ref()) {
        return vec![DumpTask::Skip; flattened.len()];
    }

    let eta = ctx.see.ast().eta
        .get(&type_name)
        .cloned()
        .unwrap_or_else(|| panic!("missing eta for {type_name}"));
    let Type::Tuple(kind) = ty.as_ref() else {
        unreachable!()
    };
    assert!(kind.fields.len() == eta.len());

    let mut tasks = Vec::new();
    for (i, (field, ext)) in kind.fields.iter().zip(eta.into_iter()).enumerate() {
        let mut field = field.clone();
        let mut rep = 1;
        while let Type::Array(kind) = field.as_ref() {
            rep *= kind.len;
            field = kind.elem_ty.clone();
        };
        for _ in 0..rep {
            match (field.as_ref(), ext.as_ref()) {
                (Type::BitVec(_), _) => {
                    flattened.next().unwrap();
                    tasks.push(DumpTask::Scalar);
                },
                (Type::Tuple(_), None) => unimplemented!("tuple field (#{i}) {field} in {type_name} without an eta"),
                (Type::Tuple(_), Some(ext)) => {
                    let TypeExt::Named(field_name) = ext.as_ref() else {
                        unreachable!("tuple field {field} in {type_name} expects a named eta, found {ext}")
                    };
                    let sub_tasks = dump_gen_tasks_named(ctx, field_name.clone());
                    for _ in 0..sub_tasks.len() { flattened.next().unwrap(); }
                    tasks.extend(sub_tasks.into_iter());
                }
                (Type::Pointer(_), None) => {
                    flattened.next().unwrap();
                    tasks.push(DumpTask::Hex);
                }
                (Type::Pointer(_), Some(ext)) => {
                    let TypeExt::TypedPtr(pointee) = ext.as_ref() else {
                        unreachable!("tuple field (#{i}) {field} in {type_name} expects a type-pointer eta, found {ext}")
                    };
                    let (ofs, _) = flattened.next().unwrap();

                    let length = ctx.dynamic_types.get(&(type_name.as_ref(), ofs)).cloned().unwrap_or(PointeeLength::None);
                    tasks.push(DumpTask::Pointer { 
                        pointee: pointee.clone(),
                        length,
                    });
                }
                (Type::Array(_), _) => unreachable!(),
                (Type::Unit(_)|Type::Enum(_)|Type::Int(_)|Type::Lambda(_)|Type::List(_), _) => unreachable!("field without a layout"),
            }
        }
    }
    assert!(
        flattened.peek().is_none(), "flattened layout does not match the type for {type_name};\nexcessive: {:?}",
        flattened.collect::<Vec<_>>(),
    );
    tasks
}

/// Generate dump tasks for the anonymous type `ty`.
fn dump_gen_tasks_anon(
    _: &mut Context, 
    ty: Rc<Type>,
) -> Vec<DumpTask> {
    let mut tasks = Vec::new();
    let mut queue = vec![ty];
    while let Some(ty) = queue.pop() {
        match ty.as_ref() {
            Type::Array(kind) => {
                for _ in 0..kind.len {
                    queue.push(kind.elem_ty.clone());
                }
            }
            Type::Tuple(kind) => {
                for field in kind.fields.iter().rev() {
                    queue.push(field.clone());
                }
            }
            Type::BitVec(_) => {
                tasks.push(DumpTask::Scalar);
            }
            Type::Pointer(_) => {
                tasks.push(DumpTask::Hex);
            }
            _ => unreachable!()
        }
    }
    tasks
}

/// Generate a dump function for the type with `type_name`.
fn dump_gen_named(ctx: &mut Context, type_name: StringRef) {
    if ctx.dump_funcs.contains_key(type_name.as_ref()) {
        // already generated
        return;
    }
    ctx.dump_funcs.insert(type_name.to_string(), String::new()); // placeholder to break recursion

    let ty = Type::resolve(&type_name).unwrap();
    let layout = ty.get_layout(ctx.see.mstate_mut()).unwrap();
    let all_size = layout.size;
    let mut writer = Vec::new();
    let mut writer2 = Vec::new();
    let suffix = dump_name(type_name.clone());
    
    _ = writeln!(writer, r#"
fn dump_{suffix}(p: *const u8, rep: usize, table: &mut HashSet<(usize, usize)>, dumper: &mut String) {{
    let mut len = 0;
    let mut size = 0;
    let mut ptr = 0usize;

    if !table.insert((p as usize, dump_{suffix} as *const fn() as usize)) {{
        return;
    }}

    dumper.push_str(&format!("\"{{:p}}\": {{\\n", p));
    for r in 0..rep 
{{"#);

    // Scan the type annotations for dump plans of each flattened fields
    let dump_tasks = dump_gen_tasks_named(ctx, type_name.clone());
    assert!(dump_tasks.len() == layout.flattened.len());

    for (task, (ofs, size)) in dump_tasks.into_iter().zip(layout.flattened.iter().cloned()) {
        _ = writeln!(writer, r#"    ptr = (p as usize)+{ofs}+r*{all_size};"#);
        match task {
            DumpTask::Skip => {},
            DumpTask::Hex => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"{{}}\": \"{{:p}}\",\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const *const u8) }}));"#);
            }
            DumpTask::Scalar => {
                _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"{{}}\": [ {{}}, {size} ],\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const i{}) }}));"#, size * 8);
            }
            DumpTask::Pointer { pointee, length } => {
                let len_string = match length {
                    PointeeLength::None => "1".to_string(),
                    PointeeLength::LoadI64(rel) => format!("unsafe {{ std::ptr::read((ptr+{rel}) as *const usize) }}"),
                    PointeeLength::Const(len) => len.to_string(),
                };
                _ = writeln!(writer2, r#"    dumper.push_str(&format!("\t\"{{}}\": \"{{:p}}\",\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const *const u8) }}));"#);

                _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"{{}}\": \"{{:p}}\",\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const *const u8) }}));"#);
                _ = writeln!(writer2, r#"    if unsafe {{ std::ptr::read(ptr as *const *const u8) }} != std::ptr::null() {{ 
        len = {len_string};"#);
                match pointee.as_ref() {
                    TypeExt::Named(pointee_name) => {
                        let suffix = dump_name(pointee_name.clone());
                        _ = writeln!(writer2, r#"       dump_{suffix}(unsafe {{ std::ptr::read(ptr as *const *const u8) }}, len, table, dumper);"#);
                        dump_gen_named(ctx, pointee_name.clone());
                    }
                    TypeExt::Type(pointee_ty) => {
                        let suffix = format!("anon_{:p}", *pointee_ty);
                        _ = writeln!(writer2, r#"       dump_{suffix}(unsafe {{ std::ptr::read(ptr as *const *const u8) }}, len, table, dumper);"#);
                        dump_gen_anon(ctx, pointee_ty.clone());
                    }
                    TypeExt::TypedPtr(pointee2) => {
                        // First dump the pointee as a pointer array
                        let suffix = format!("anon_{:p}", Type::mk_pointer());
                        _ = writeln!(writer2, r#"       dump_{suffix}(unsafe {{ std::ptr::read(ptr as *const *const u8) }}, len, table, dumper);"#);
                        dump_gen_anon(ctx, Type::mk_pointer());

                        // Then each pointer triggers a further dump
                        let suffix = match pointee2.as_ref() {
                            TypeExt::TypedPtr(_) => todo!("nested pointers for more than two levels is not supported yet"),
                            TypeExt::Named(name) => {
                                dump_gen_named(ctx, name.clone());
                                dump_name(name.clone())
                            },
                            TypeExt::Type(ty) => {
                                dump_gen_anon(ctx, ty.clone());
                                format!("anon_{:p}", *ty)
                            },
                        };
                        _ = writeln!(writer2, r#"       for j in 0..len {{
            let pp = unsafe {{ std::ptr::read((ptr + 8*j) as *const *const u8) }};
            if pp != std::ptr::null() {{
                dump_{suffix}(pp, 1, table, dumper);
            }}
        }}
    }}"#);
                    }
                }
            }
        }
    }
    
    _ = writeln!(writer, r#"}}"#);

    let dump_code = String::from_utf8(writer2).unwrap();
    _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"__size__\": {{size}},\n\t\"__type__\": \"%{type_name}\"}},\n"));
    for r in 0..rep {{
        {dump_code}
    }}
}}"#);

    ctx.dump_funcs.insert(type_name.to_string(), String::from_utf8(writer).unwrap());
}

/// Generate a dump function for the anonymous type `ty`.
fn dump_gen_anon(ctx: &mut Context, ty: Rc<Type>) {
    match ty.as_ref() {
        Type::Array(_) | Type::Tuple(_) => unimplemented!("dumping anonymous arrays and tuples is not supported"),
        _ => {},
    }
    
    let anon_name = format!("anon_{:p}", ty);
    if ctx.dump_funcs.contains_key(&anon_name) {
        // already generated
        return;
    }

    let layout = ty.get_layout(ctx.see.mstate_mut()).unwrap();
    let all_size = layout.size;
    let tasks = dump_gen_tasks_anon(ctx, ty.clone());
    assert!(tasks.len() == layout.flattened.len());
    let mut writer = Vec::new();

    _ = writeln!(writer, r#"
fn dump_{anon_name}(p: *const u8, rep: usize, table: &mut HashSet<(usize, usize)>, dumper: &mut String) {{
    let mut len = 0;
    let mut size = 0;
    let mut ptr = 0usize;

    if !table.insert((p as usize, dump_{anon_name} as *const fn() as usize)) {{
        return;
    }}

    dumper.push_str(&format!("\"{{:p}}\": {{\\n", p));
    for r in 0..rep 
{{"#);

    // Dump all fields as either Scalar or Hex
    for (task, (ofs, size)) in tasks.into_iter().zip(layout.flattened.iter().cloned()) {
        _ = writeln!(writer, r#"    ptr = (p as usize)+{ofs}+r*{all_size};"#);
        match task {
            DumpTask::Hex => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"{{}}\": \"{{:p}}\",\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const *const u8) }}));"#);
            }
            DumpTask::Scalar => {
                _ = writeln!(writer, r#"    dumper.push_str(&format!("\t\"{{}}\": [ {{}}, {size} ],\n", {ofs}+r*{all_size}, unsafe {{ std::ptr::read(ptr as *const i{}) }}));"#, size * 8);
            }
            _ => unreachable!()
        }
    }
    _ = writeln!(writer, r#"}}
    dumper.push_str(&format!("\t\"__size__\": {{}}\n}},\n", {all_size} * rep));
}}"#);

    ctx.dump_funcs.insert(anon_name, String::from_utf8(writer).unwrap());
}

fn main() {
    // Get command line arguments
    let args: Vec<String> = std::env::args().collect();

    // Check if enough arguments are provided
    if args.len() < 4 {
        panic!("Not enough arguments provided. Usage: cargo run --bin ddump-rust <input> <output> <types>..");
    }

    // Extract command line arguments
    let in_path = &args[1];
    let out_path =  &args[2];
    let (_, type_names) = args.split_at(3);
        
    let see = llvm::parse(in_path, None);
    let mut ctx = Context::new(see);

    for type_name in type_names {
        dump_gen_named(&mut ctx, type_name.as_str().into())
    }

    let output_file = File::create(out_path).unwrap();
    let mut writer = std::io::BufWriter::new(output_file);
    _ = writer.write(DUMP_HEADER.as_bytes());

    for (_, dump_func) in ctx.dump_funcs.iter() {
        _ = writer.write(dump_func.as_bytes());
    }
}

