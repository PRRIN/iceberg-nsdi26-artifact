//! Iceberg's Data-structure DUMPer, for the C++ language.
//! 
//! This tool generates code that dumps the memory content of any given
//! data structure, based on the typing information provided via the type
//! declarations in the LLVM IR.

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
    /// Perform polymorphic dispatch for these types.
    polymorphic_types: HashSet<&'static str>,
    /// These types are treated as C++ vectors when dumping.
    vector_types: HashSet<&'static str>,
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
    LoadI64(i32),
    /// The pointee spans until a certian address, which is loaded
    /// at the given relative offset.
    Until(i32),
    /// The pointee length is constant.
    Const(u32),
}

const DUMP_HEADER: &'static str = r#"
#include <unordered_map>
#include <set>
#include <cstdio>
#include <cstdint>
#include <signal.h>
#include <setjmp.h>
#include <elfio/elfio.hpp>

static FILE *f;
static sigjmp_buf jbuf;
static std::unordered_map<uint64_t, std::string> addr2name;
static std::unordered_map<std::string, uint64_t> name2addr;
static std::set<std::tuple<uint64_t, uint64_t>> dumped;
static ELFIO::elfio reader;
static uint64_t offset;

static void
deref_handler(int s) {
	if (s == SIGSEGV) {
		sigset_t sigset;
		sigemptyset(&sigset);
		sigaddset(&sigset, SIGSEGV);
		sigprocmask(SIG_UNBLOCK, &sigset, NULL); // Unblock SIGSEGV
		siglongjmp(jbuf, 1);
	}
}

int8_t __deref_error = 0;

static int
deref_error(const char *p) {
	static int installed = 0;
	if (!installed) {
		struct sigaction sa;
		sa.sa_handler = deref_handler;
		sigemptyset(&sa.sa_mask);
		sa.sa_flags = SA_RESTART; // Optionally use SA_SIGINFO for more
					  // detailed signal information
		sigaction(SIGSEGV, &sa, NULL);
		installed = 1;
	}

	if (!sigsetjmp(jbuf, 1)) { // Save the current signal mask
		__deref_error = *(int8_t *)(p);
		return 0;
	}
	return -1; // Error
}

static void
dump_start();

static void
dump_end();

static std::unordered_map<std::string, void(*)(const char *, int)> polydump;

static void
dump_polymorphic(const char *, int);
"#;

const DUMP_TAIL: &'static str = r#"

static void
dump_start() {
    f = fopen("/app/dump.json", "w");
    reader.load("/app/pdns/pdns_server");
    ELFIO::Elf_Half sec_num = reader.sections.size();
    for ( int i = 0; i < sec_num; ++i ) {
        ELFIO::section* psec = reader.sections[i]; 
        const char* p = reader.sections[i]->get_data();
        if ( psec->get_type() == ELFIO::SHT_SYMTAB ) { 
            const ELFIO::symbol_section_accessor symbols(reader, psec); 
            ELFIO::Elf_Xword symbols_num = symbols.get_symbols_num();
            for ( unsigned int j = 0; j < symbols_num; ++j ) { 
                std::string name;
                ELFIO::Elf64_Addr value;
                ELFIO::Elf_Xword size;
                unsigned char bind;
                unsigned char type;
                ELFIO::Elf_Half section_index;
                unsigned char other;
                symbols.get_symbol( j, name, value, size, bind, type, section_index, other );
                addr2name[value] = name;
                name2addr[name] = value;
            }
        }
    }
    offset = (uint64_t)(&jbuf) - name2addr["_ZL4jbuf"];

    // populate the polymorphic map
    polydump["_ZTV12Bind2Backend"] = dump_class_Bind2Backend;
}

static void
dump_end() {
    fclose(f);
}

static void
dump_polymorphic(const char *p, int rep) {
    uint64_t vtable = *(uint64_t *)(p);
    std::string type_name = addr2name[vtable - 16 - offset];
    printf("dumping actual type: %s\n", type_name.c_str());
    polydump[type_name](p, rep);
}
"#;


impl Context {
    fn new(see: See) -> Self {
        // TODO: make this externally configurable
        let skipped_types: HashSet<&'static str> = HashSet::from_iter([
            "%struct.__locale_data",
            "%struct.lua_State",
            "%struct._IO_marker",
            "%struct._IO_codecvt",
            "%struct._IO_wide_data",
            "%struct.evp_md_st",
            "%struct.engine_st",
            "%struct.bio_method_st",
            "%struct.bio_st",
            "%struct.ossl_lib_ctx_st",
            "%struct.evp_cipher_st",
            
            // "%\"class.boost::multi_index::multi_index_container\"",
            // "%\"class.boost::multi_index::multi_index_container.704\"",
            // "%\"class.boost::multi_index::multi_index_container.4\"",
            // "%\"class.boost::multi_index::multi_index_container.14\"",
            // "%\"class.boost::multi_index::multi_index_container.175\"",
            // "%\"class.boost::multi_index::multi_index_container.5858\"",
            // "%\"class.boost::multi_index::multi_index_container.20\"",
            // "%\"struct.std::less\"",
            "%\"class.std::map\"",
            "%\"class.std::unordered_map\"",
            "%\"class.std::basic_ostream\"",
            "%\"class.std::basic_istream\"",
            "%\"class.std::basic_ifstream\"",
            "%\"class.std::basic_ofstream\"",
            "%\"class.std::basic_ostream.base\"",
            "%\"class.std::shared_lock\"",
            "%\"class.std::lock_guard\"",
            "%\"class.std::lock_guard.242\"",
        ].iter().cloned());

        let polymorphic_types: HashSet<_> = HashSet::from_iter([
            "%class.DNSBackend",
        ].iter().cloned());

        let dynamic_types: HashMap<_, _> = HashMap::from_iter([
            (("%\"class.std::__cxx11::basic_string\"", 0), PointeeLength::LoadI64(8)),
        ].iter().cloned());

        let vector_types: HashSet<&'static str> = HashSet::from_iter([
            "%\"struct.std::_Vector_base<std::__cxx11::basic_string<char>, std::allocator<std::__cxx11::basic_string<char>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<pollfd, std::allocator<pollfd>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<Distributor<DNSPacket, DNSPacket, PacketHandler> *, std::allocator<Distributor<DNSPacket, DNSPacket, PacketHandler> *>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::shared_ptr<UDPNameserver>, std::allocator<std::shared_ptr<UDPNameserver>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<ComboAddress, std::allocator<ComboAddress>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<BindDomainInfo, std::allocator<BindDomainInfo>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char>>, std::allocator<std::pair<std::__cxx11::basic_string<char>, std::__cxx11::basic_string<char>>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<boost::io::detail::format_item<char, std::char_traits<char>, std::allocator<char>>, std::allocator<boost::io::detail::format_item<char, std::char_traits<char>, std::allocator<char>>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<std::__cxx11::basic_string<char>, boost::variant<int, std::vector<std::pair<std::__cxx11::basic_string<char>, int>>, timeval *>>, std::allocator<std::pair<std::__cxx11::basic_string<char>, boost::variant<int, std::vector<std::pair<std::__cxx11::basic_string<char>, int>>, timeval *>>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSZoneRecord, std::allocator<DNSZoneRecord>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSBackend *, std::allocator<DNSBackend *>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<AuthPacketCache::MapCombo, std::allocator<AuthPacketCache::MapCombo>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<UeberBackend *, std::allocator<UeberBackend *>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<AuthQueryCache::MapCombo, std::allocator<AuthQueryCache::MapCombo>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<pdns::AtomicBucket, std::allocator<pdns::AtomicBucket>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<AuthZoneCache::MapCombo, std::allocator<AuthZoneCache::MapCombo>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::tuple<DNSName, int, bool>, std::allocator<std::tuple<DNSName, int, bool>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<char, std::allocator<char>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<unsigned short, std::allocator<unsigned short>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<DNSRecord, unsigned short>, std::allocator<std::pair<DNSRecord, unsigned short>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<DNSSECPrivateKey, DNSSECKeeper::KeyMetaData>, std::allocator<std::pair<DNSSECPrivateKey, DNSSECKeeper::KeyMetaData>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSBackend::KeyData, std::allocator<DNSBackend::KeyData>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSResourceRecord, std::allocator<DNSResourceRecord>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<unsigned short, std::__cxx11::basic_string<char>>, std::allocator<std::pair<unsigned short, std::__cxx11::basic_string<char>>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSZoneRecord *, std::allocator<DNSZoneRecord *>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::unique_ptr<DNSCryptoKeyEngine> (*)(unsigned int), std::allocator<std::unique_ptr<DNSCryptoKeyEngine> (*)(unsigned int)>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<RRSIGRecordContent, std::allocator<RRSIGRecordContent>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DomainInfo, std::allocator<DomainInfo>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<std::__cxx11::basic_string<char>, const bignum_st *>, std::allocator<std::pair<std::__cxx11::basic_string<char>, const bignum_st *>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<unsigned long, std::allocator<unsigned long>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<DNSName, std::allocator<DNSName>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<const DNSRecord *, std::allocator<const DNSRecord *>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<std::pair<unsigned long, SOAData>, std::allocator<std::pair<unsigned long, SOAData>>>::_Vector_impl_data\"",
            "%\"struct.std::_Vector_base<AutoPrimary, std::allocator<AutoPrimary>>::_Vector_impl_data\"",
        ].iter().cloned());
        
        Context {
            see,
            dump_funcs: HashMap::new(),
            skipped_types,
            dynamic_types,
            polymorphic_types,
            vector_types,
        }
    }
}

/// Get the standardised name for `type_name`.
fn dump_name(type_name: StringRef) -> String {
    let name = type_name.trim_start_matches('%');
    name
        .as_bytes()
        .iter()
        .map(|&c| {
            if c.is_ascii_digit() || c.is_ascii_alphabetic() {
                c as char
            } else {
                '_'
            }
        })
        .collect()
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

    if ctx.vector_types.contains(type_name.as_ref()) {
        assert!(flattened.len() == 3);
        // { begin, begin + len * elem_size, begin + cap * elem_size }
        let ext = eta[0].as_ref().unwrap();
        let TypeExt::TypedPtr(pointee) = ext.as_ref() else { 
            unreachable!("vector {type_name} expects a type-pointer eta, found {ext}")
        };
        return vec![
            DumpTask::Pointer { pointee: pointee.clone(), length: PointeeLength::Until(8) },
            // ..these two pointers are not chased
            DumpTask::Hex,
            DumpTask::Hex,
        ]
    }
    
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
    let mut label = 0;
    let suffix = dump_name(type_name.clone());

    if ctx.polymorphic_types.contains(type_name.as_ref()) {
        // polymorphic dispatch
        _ = writeln!(writer, r#"
static void dump_{suffix}(const char *p, int rep) {{
    if (dumped.find({{(uint64_t)p, (uint64_t)dump_{suffix}}}) != dumped.end()) return;
    dumped.insert({{(uint64_t)p, (uint64_t)dump_{suffix}}});
    dump_polymorphic(p, rep);
}}"#);
        ctx.dump_funcs.insert(type_name.to_string(), String::from_utf8(writer).unwrap());
        return;
    }
    
    _ = writeln!(writer, r#"
static void dump_{suffix}(const char *p, int rep) {{
    int len; int size = 0;
    if (dumped.find({{(uint64_t)p, (uint64_t)dump_{suffix}}}) != dumped.end()) return;
    dumped.insert({{(uint64_t)p, (uint64_t)dump_{suffix}}});
    fprintf(f, "\"%p\": {{\n", p);
    int r = 0;
self_start:
    if (r >= rep) goto self_end;"#);

    // Scan the type annotations for dump plans of each flattened fields
    let dump_tasks = dump_gen_tasks_named(ctx, type_name.clone());
    assert!(dump_tasks.len() == layout.flattened.len());

    for (task, (ofs, size)) in dump_tasks.into_iter().zip(layout.flattened.iter().cloned()) {
        match task {
            DumpTask::Skip => {},
            DumpTask::Hex => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const char **)(p+{ofs}+r*{all_size}));"#);
            }
            DumpTask::Scalar => {
                match size {
                    1 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int8_t *)(p+{ofs}+r*{all_size}));"#),
                    2 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int16_t *)(p+{ofs}+r*{all_size}));"#),
                    4 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int32_t *)(p+{ofs}+r*{all_size}));"#),
                    8 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %lld, {size} ],\n", {ofs}+r*{all_size},  *(int64_t *)(p+{ofs}+r*{all_size}));"#),
                    _ => unreachable!(),
                };
            }
            DumpTask::Pointer { pointee, length } => {
                let len_string = match length {
                    PointeeLength::None => "1".to_string(),
                    PointeeLength::LoadI64(rel) => format!("*(int64_t *)(p+{ofs}+r*{all_size}+{rel})"),
                    PointeeLength::Until(rel) => { 
                        let pointee_size = match pointee.as_ref() {
                            TypeExt::Type(ty) => ty.get_layout(ctx.see.mstate_mut()).unwrap().size,
                            TypeExt::Named(name) => Type::resolve(name).unwrap().get_layout(ctx.see.mstate_mut()).unwrap().size,
                            TypeExt::TypedPtr(_) => (TYPE_POINTER_WIDTH / 8) as u32,
                        };
                        format!("(*(int64_t *)(p+{ofs}+r*{all_size}+{rel}) - *(int64_t *)(p+{ofs}+r*{all_size})) / {pointee_size}")
                    }
                    PointeeLength::Const(len) => len.to_string(),
                };
                label += 1;
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const char **)(p+{ofs}+r*{all_size}));"#);
                _ = writeln!(writer2, r#"    if (deref_error(*(const char **)(p+{ofs}+r*{all_size}))) {{ goto skip_{label}; }}
    len = {len_string};"#);
                match pointee.as_ref() {
                    TypeExt::Named(pointee_name) => {
                        let suffix = dump_name(pointee_name.clone());
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const char **)(p+{ofs}+r*{all_size}), len);"#);
                        dump_gen_named(ctx, pointee_name.clone());
                    }
                    TypeExt::Type(pointee_ty) => {
                        let suffix = format!("anon_{:p}", *pointee_ty);
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const char **)(p+{ofs}+r*{all_size}), len);"#);
                        dump_gen_anon(ctx, pointee_ty.clone());
                    }
                    TypeExt::TypedPtr(pointee2) => {
                        // First dump the pointee as a pointer array
                        let suffix = format!("anon_{:p}", Type::mk_pointer());
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const char **)(p+{ofs}+r*{all_size}), len);"#);
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
                        _ = writeln!(writer2, r#"    for (int j=0; j<len; j++) {{
        const char *pp = *(const char **)(*(const char **)(p+{ofs}+r*{all_size}) + 8*j);
        if (!deref_error(pp)) dump_{suffix}(pp, 1);
    }}"#);
                    }
                }
                _ = writeln!(writer2, r#"skip_{label}:"#);
            }
        }
    }
    
    _ = writeln!(writer, r#"    r++; 
    size += {all_size};
    goto self_start;
self_end:"#);

    let dump_code = String::from_utf8(writer2).unwrap();
    if type_name.ends_with("\"") {
        _ = writeln!(
            writer, 
            r#"    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%%\\\"{}\\\"\"}},\n", size);"#,
            &type_name[2..type_name.len()-1]
        );
    } else {
        _ = writeln!(writer, r#"    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%{type_name}\"}},\n", size);"#);
    }
    
    _ = writeln!(writer, r#"    r = 0;
field_start:
    if (r >= rep) goto field_end;
{dump_code}
    r++;
    goto field_start;
field_end:
    return;
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
static void dump_{anon_name}(const char *p, int rep) {{
    if (dumped.find({{(uint64_t)p, (uint64_t)dump_{anon_name}}}) != dumped.end()) return;
    dumped.insert({{(uint64_t)p, (uint64_t)dump_{anon_name}}});
    fprintf(f, "\"%p\": {{\n", p);
    int r = 0;
again:
    if (r >= rep) goto exit;"#);

    // Dump all fields as either Scalar or Hex
    for (task, (ofs, size)) in tasks.into_iter().zip(layout.flattened.iter().cloned()) {
        match task {
            DumpTask::Hex => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const char **)(p+{ofs}+r*{all_size}));"#);
            }
            DumpTask::Scalar => {
                match size {
                    1 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int8_t *)(p+{ofs}+r*{all_size}));"#),
                    2 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int16_t *)(p+{ofs}+r*{all_size}));"#),
                    4 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int32_t *)(p+{ofs}+r*{all_size}));"#),
                    8 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %lld, {size} ],\n", {ofs}+r*{all_size},  *(int64_t *)(p+{ofs}+r*{all_size}));"#),
                    _ => unreachable!(),
                };
            }
            _ => unreachable!()
        }
    }
    _ = writeln!(writer, r#"    r++; goto again;
exit:
    assert(rep >= 0);
    fprintf(f, "\t\"__size__\": %d\n}},\n", {all_size} * rep);
}}"#);

    ctx.dump_funcs.insert(anon_name, String::from_utf8(writer).unwrap());
}

fn main() {
    // Get command line arguments
    let args: Vec<String> = std::env::args().collect();

    // Check if enough arguments are provided
    if args.len() < 4 {
        panic!("Not enough arguments provided. Usage: cargo run --bin ddump-cpp <input> <output> <types>..");
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
        let def = dump_func.split_once("{").unwrap().0;
        _ = writer.write(def.as_bytes());
        _ = writer.write(";\n".as_bytes());
    }

    for (_, dump_func) in ctx.dump_funcs.iter() {
        _ = writer.write(dump_func.as_bytes());
    }

    _ = writer.write(DUMP_TAIL.as_bytes());
}

