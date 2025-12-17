//! Iceberg's Data-structure DUMPer, for the C language.
//! 
//! This tool generates code that dumps the memory content of any given
//! data structure, based on the typing information provided via the type
//! declarations in the LLVM IR.
//! 
//! ### Caveat
//! For now it is assumed that the provided typing definitions do not contain
//! *directly nested tuples*, i.e., a `Type::Tuple` directly containing a sub-`Tuple`.
//! The LLVM IR for C does satisfy such an assumption.

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
    /// Check the magic number for these types: (type) :-> (ofs, magic)
    magic_types: HashMap<&'static str, (u32, i32)>,
    /// Perform polymorphic dispatch for these types: (type) :-> (check code)
    polymorphic_types: HashMap<&'static str, &'static str>,
    /// These type fields are dynamically sized: 
    /// (type, pointer ofs) :-> (pointee length)
    dynamic_types: HashMap<(&'static str, u32), PointeeLength>,
    /// These type fields are interpreted as C Strings: (type, ofs)
    string_types: HashSet<(&'static str, u32)>,
    /// These types have an extended trailing data field that is variably sized,
    /// so specific dumping code is needed: (type) :-> (dump code)
    extended_types: HashMap<&'static str, &'static str>,
}

#[derive(Clone)]
enum DumpTask {
    Scalar {
        /// Instructs the dump function to check the field
        /// as a magic value.
        magic: Option<i32>,
    },
    Pointer { 
        pointee: Rc<TypeExt>,
        /// Instructs the dump function to use `length` as the length of pointee.
        length: PointeeLength,
    },
    /// Instructs the dump function to dump the field in hex.
    Hex,
    /// Instruct the dump function to dump the field as a C-string.
    String,
    /// Instruct the dump function to skip dumpping the field.
    Skip,
}

impl std::fmt::Debug for DumpTask {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            DumpTask::Scalar { magic } => {
                if let Some(magic) = magic {
                    write!(f, "Scalar({})", magic)
                } else {
                    write!(f, "Scalar")
                }
            }
            DumpTask::Pointer { pointee, .. } => {
                write!(f, "Pointer({:?})", pointee)
            }
            DumpTask::Hex => write!(f, "Hex"),
            DumpTask::String => write!(f, "String"),
            DumpTask::Skip => write!(f, "Skip"),
        }
    }
}

#[derive(Clone)]
enum PointeeLength {
    /// The pointee is a scalar.
    None,
    /// The pointee length is to be loaded at a relative offset as
    /// a 4-byte integer.
    LoadI32(i32),
    /// The pointee length is to be loaded at a relative offset as
    /// a 1-byte integer, then raised as a power of 2.
    LoadI8Pow(i32),
    /// The pointee length is constant.
    Const(u32),
}

const DUMP_HEADER: &'static str = r#"
#include <stdio.h>
#include <signal.h>
#include <setjmp.h>
#include <assert.h>
#include <string.h>

#include <dns/rdataslab.h>

static FILE *f;
static sigjmp_buf jbuf;
static const void *gtable[65536];
static int gindex = 0;

static char bt[65536][64];
static int bt_index = 0;
static void print_bt(const char *msg) {
    printf("%s\n", msg);
    for (int i=0;i<bt_index;i++) {
        printf("%s\n", bt[i]);
    }
}

static void deref_handler(int s) {
    if (s == SIGSEGV) {
        sigset_t sigset;
        sigemptyset(&sigset);
        sigaddset(&sigset, SIGSEGV);
        sigprocmask(SIG_UNBLOCK, &sigset, NULL); // Unblock SIGSEGV
        siglongjmp(jbuf, 1);
    }
}

int8_t __deref_error = 0;

static int deref_error(const void *p) {
    static int installed = 0;
    if (!installed) {
        struct sigaction sa;
        sa.sa_handler = deref_handler;
        sigemptyset(&sa.sa_mask);
        sa.sa_flags = SA_RESTART; // Optionally use SA_SIGINFO for more detailed signal information
        sigaction(SIGSEGV, &sa, NULL);
        installed = 1;
    }

    if (!sigsetjmp(jbuf, 1)) { // Save the current signal mask
        __deref_error = *(int8_t *)(p);
        return 0;
    }
    return -1; // Error
}

static bool check_magic(const void *p, int32_t magic) {
    int32_t m = *(int32_t *)(p);
    if (m != magic) {
        print_bt("check_magic failed");
        printf(
            "magic: %c%c%c%c, expected: %c%c%c%c\n",
            (m >> 24) & 0xFF, (m >> 16) & 0xFF, (m >> 8) & 0xFF, m & 0xFF,
            (magic >> 24) & 0xFF, (magic >> 16) & 0xFF, (magic >> 8) & 0xFF, magic & 0xFF
        );
        return false;
    }
    return true;
}

static void dump_string(const void *p) {
    if (deref_error(p)) { return; }
    sprintf(bt[bt_index++], "string\t%p", p);
    fprintf(f, "\"%p\": {\n", p);

    char *ptr = (char *)p;
    char ch;
    int size = 0;
    do {
        ch = *ptr;
        fprintf(f, "\t\"%d\": [%d, 1], \n", size, ch);
        ptr = ptr + 1;
        size++;
    } while(ch != '\0');
    fprintf(f, "\t\"__size__\": %d\n},\n", size);
    bt_index--;
}
"#;

const RDATASET_POLY_CHECK: &str = r#"
{
    // polymorphism check
    const void **methods = (*(const void ***)(p + 8));
    char bytemap[16];
    for (int i=0;i<16;i++) {
        if (methods[i] == NULL) bytemap[i] = '0';
        else bytemap[i] = '1';
    }
    if (memcmp(bytemap, "0110100000000000", 16) == 0) {
        // question
        print_bt("question");
        assert(false);
    } else if (memcmp(bytemap, "1111110000100000", 16) == 0) {
        // ncache
        print_bt("ncache");
        assert(false);
    } else if (memcmp(bytemap, "1111110000000000", 16) == 0) {
        // rps
        print_bt("rps");
        assert(false);
    } else if (memcmp(bytemap, "1111111111000110", 16) == 0) {
        // rdlist
        dump_struct_dns_rdataset_rdlist(p, rep);
        return;
    } else if (memcmp(bytemap, "1111110101111110", 16) == 0) {
        // slab
        print_bt("slab");
        assert(false);
    } else if (memcmp(bytemap, "1111111100000000", 16) == 0) {
        // sdlz
        print_bt("sdlz");
        assert(false);
    } else if (memcmp(bytemap, "1111100000000000", 16) == 0) {
        // keytable
        print_bt("keytable");
        assert(false);
    } else {
        print_bt("invalid rdataset type");
        assert(false);
    }
}
"#;

const DB_POLY_CHECK: &str = r#"
{
    // polymorphism check
    int imp = *(int *)(p + 4);
    switch (imp) {
        case 1380074548: // "RBD4"
        dump_struct_dns_rbtdb(p, rep);
        return;
        case 1111769645: // "BDB-"
        dump_struct_bdb(p, rep);
        return;
        default:
        print_bt("unknown db implementation");
        assert(false);
    } 
}
"#;

const SLABHEADER_EXT: &str = r#"
{
    // dump extended data

#if DNS_RDATASET_FIXED
    printf("dumping with DNS_RDATASET_FIXED=1 is not implemented\n");
    assert(false);
#endif

    const char *raw = dns_slabheader_raw(p);
    unsigned int extsize = dns_rdataslab_size(p, sizeof(dns_slabheader_t)) - sizeof(dns_slabheader_t);
    fprintf(f, "\t\"%d\": [", size);
    for (int i=0;i<extsize;i++) {
        fprintf(f, "%d, ", raw[i]);
    }
    fprintf(f, "\"ext\"],\n");
    size += extsize;
}
"#;

const RBTNODE_EXT: &str = r#"
{
/*%
* The variable length stuff stored after the node has the following
* structure.
*
*	NAME_DATA{1..255} OLDOFFSETLEN{1} OFFSETS{1..128}
*
* NAME_DATA contains the name of the node when it was created.
* OLDOFFSETLEN contains the length of OFFSETS when the node was created.
* OFFSETS contains the offsets into name for each label when the node
* was created.
*/
    const dns_rbtnode_t *node = p;
    const char *raw = (const char *)(node + 1);
    unsigned int extsize = node->oldnamelen + (raw + node->oldnamelen)[0] + 1;
    fprintf(f, "\t\"%d\": [", size);
    for (int i=0;i<extsize;i++) {
        fprintf(f, "%d, ", raw[i]);
    }
    fprintf(f, "\"ext\"],\n");
    size += extsize;
}
"#;

const HTNODE_EXT: &str = r#"
{
    const char *raw = (const char *)(p + 32);
    int64_t extsize = *(int64_t *)(p + 24);
    fprintf(f, "\t\"%d\": [", size);
    for (int i=0;i<extsize;i++) {
        fprintf(f, "%d, ", raw[i]);
    }
    fprintf(f, "\"ext\"],\n");
    size += extsize;
}
"#;


impl Context {
    fn new(see: See) -> Self {
        // TODO: make this externally configurable
        let skipped_types: HashSet<&'static str> = HashSet::from_iter([
            "%struct.isc_mem",
            "%union.pthread_mutex_t",
            "%struct.isc_quota",
            "%struct.isc_histomulti",
            "%struct.isc_loop",
            "%struct.dns_aclenv",
            "%struct.dns_acl",
            "%struct.isc_rwlock",
            "%struct.dns_qpmulti",
            "%struct.dns_qp",
            "%struct.dns_resolver", // TODO: this limits us to +norec and no RPZ
            "%struct.dns_adb",
            "%struct.dns_requestmgr",
            "%struct.dns_dispatchmgr",
            "%struct.dns_transport_list",
            
            "%struct.bio_st",
            "%struct.ssl_st",
            "%struct.ssl_ctx_st",
            "%struct.ssl_session_st",
            "%struct.isc_nm_http_session",
            "%struct.isc_nm_timer",
            "%struct._IO_marker",
            "%struct._IO_codecvt",
            "%struct._IO_wide_data",
            "%struct.dns_dtenv",
            "%struct.librpz_client",
            "%struct.cds_lfht",
            "%struct.evp_md_ctx_st",
            "%struct.evp_md_st",
            "%struct.__dirstream",
            "%struct.engine_st",
            "%struct.asn1_object_st",
            "%struct.x509_store_st",
            "%struct.evp_cipher_ctx_st",
            "%struct.evp_cipher_st",
            "%struct.ossl_lib_ctx_st",
            "%struct.ossl_init_settings_st",
            "%struct.ssl_method_st",
            "%struct.X509_VERIFY_PARAM_st",
            "%struct.x509_store_ctx_st",
    
            "%struct.dns_tsigkeyring", // TODO: let's not worry about DNSSEC for now
    
            "%struct.dns_nametree",
            "%struct.dns_fwdtable",
            "%struct.dns_keytable",
            "%struct.dns_ntatable", // these use QP-Trie so we cannot handle anyway
    
            "%struct.dns_remote",
            "%struct.isc_nmhandle",
            "%struct.isc_sockaddr",
            "%struct.isc_netaddr", // netmgr

            "%struct.dns_zonemgr", // zone should be fixed
    
            "%struct.dns_rrl", // rate limiting

            "%struct.isc_time",
            "%struct.isc_timer", // timing

            "%struct._IO_FILE", // IO
            
            "%struct.dns_xfrin", // zone transfer

            "%struct.bdb",

            // "%struct.dns_db", // debug only
        ].iter().cloned());

        let magic_types: HashMap<&'static str, (u32, i32)> = HashMap::from_iter([
            ("%struct.dns_rdataset", (0, 1145983826)), // "DNSR"
            ("%struct.dns_rdataset.1559", (0, 1145983826)), // "DNSR"
            ("%struct.dns_rdataset.2205", (0, 1145983826)), // "DNSR"
            ("%struct.dns_rdataset.2416", (0, 1145983826)), // "DNSR"
            ("%struct.dns_rdataset.2616", (0, 1145983826)), // "DNSR"
            ("%struct.dns_rdataset.2687", (0, 1145983826)), // "DNSR"
            ("%struct.dns_db", (0, 1145983812)), // "DNSD"
            ("%struct.dns_db.1555", (0, 1145983812)), // "DNSD"
            ("%struct.dns_db.2228", (0, 1145983812)), // "DNSD"
            ("%struct.dns_db.2412", (0, 1145983812)), // "DNSD"
            ("%struct.dns_db.2683", (0, 1145983812)), // "DNSD"
            ("%struct.dns_zone", (0, 1515146821)), // "ZONE"
        ].iter().cloned());

        let polymorphic_types: HashMap<&'static str, &'static str> = HashMap::from_iter([
            ("%struct.dns_rdataset", RDATASET_POLY_CHECK),
            ("%struct.dns_rdataset.1559", RDATASET_POLY_CHECK),
            ("%struct.dns_rdataset.2205", RDATASET_POLY_CHECK),
            ("%struct.dns_rdataset.2416", RDATASET_POLY_CHECK),
            ("%struct.dns_rdataset.2616", RDATASET_POLY_CHECK),
            ("%struct.dns_rdataset.2687", RDATASET_POLY_CHECK),
            ("%struct.dns_db", DB_POLY_CHECK),
            ("%struct.dns_db.1555", DB_POLY_CHECK), 
            ("%struct.dns_db.2228", DB_POLY_CHECK),
            ("%struct.dns_db.2412", DB_POLY_CHECK),
            ("%struct.dns_db.2683", DB_POLY_CHECK),
        ].iter().cloned());

        let dynamic_types: HashMap<_, _> = HashMap::from_iter([
            (("%struct.isc_buffer", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name", 32), PointeeLength::LoadI32(-12)),
            (("%struct.dns_name.1561", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name.1561", 32), PointeeLength::LoadI32(-12)),
            (("%struct.dns_name.2207", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name.2207", 32), PointeeLength::LoadI32(-12)),
            (("%struct.dns_name.2359", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name.2359", 32), PointeeLength::LoadI32(-12)),
            (("%struct.dns_name.2590", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name.2590", 32), PointeeLength::LoadI32(-12)),
            (("%struct.dns_name.2646", 8), PointeeLength::LoadI32(8)),
            (("%struct.dns_name.2646", 32), PointeeLength::LoadI32(-12)),
            (("%struct.isc_stats", 32), PointeeLength::LoadI32(-8)),
            (("%struct.isc_region", 0), PointeeLength::LoadI32(8)),
            (("%struct.dns_rbtdb", 712), PointeeLength::LoadI32(-8)),
            (("%struct.dns_rbtdb", 848), PointeeLength::LoadI32(-144)),
            (("%struct.dns_rbtdb", 872), PointeeLength::LoadI32(-168)),
            (("%struct.dns_rbtdb.2432", 712), PointeeLength::LoadI32(-8)),
            (("%struct.dns_rbtdb.2432", 848), PointeeLength::LoadI32(-144)),
            (("%struct.dns_rbtdb.2432", 872), PointeeLength::LoadI32(-168)),
            (("%struct.dns_rbt", 48), PointeeLength::LoadI8Pow(-4)),
            (("%struct.dns_rbt", 56), PointeeLength::LoadI8Pow(-11)),
            (("%struct.ns_client", 104), PointeeLength::Const(4096)),
            (("%struct.ns_client.6057", 104), PointeeLength::Const(4096)),
            (("%struct.ns_client.6494", 104), PointeeLength::Const(4096)),
        ].iter().cloned());

        let string_types: HashSet<_> = HashSet::from_iter([
            ("%struct.dns_cache", 64),
            ("%struct.dns_view", 24),
            ("%struct.dns_view", 416),
            ("%struct.dns_view.1614", 24),
            ("%struct.dns_view.1614", 416),
            ("%struct.dns_view.5463", 24),
            ("%struct.dns_view.5463", 416),
            ("%struct.dns_zone", 528),
            ("%struct.dns_zone", 592),
            ("%struct.dns_zone", 768),
            ("%struct.dns_zone", 2576),
            ("%struct.dns_zone", 2584),
            ("%struct.dns_zone", 2592),
            ("%struct.dns_zone", 2600),
            ("%struct.dns_indent_t", 0),
            // ("%struct.bdb", 152),
            // ("%struct.bdb", 160),
            ("%struct.dns_kasp", 16),
            // ("%struct.dns_dbimplementation", 0),
        ].iter().cloned());

        let extended_types: HashMap<_, _> = HashMap::from_iter([
            ("%struct.dns_slabheader", SLABHEADER_EXT),
            ("%struct.dns_rbtnode", RBTNODE_EXT),
            ("%struct.isc_ht_node", HTNODE_EXT),
            // ("%struct.msgblock.rdata", MSGBLOCK_RDATA_EXT),
            // ("%struct.msgblock.rdatalist", MSGBLOCK_RDATALIST_EXT),
            // ("%struct.msgblock.offset", MSGBLOCK_OFFSET_EXT),
        ].iter().cloned());
        
        Context {
            see,
            dump_funcs: HashMap::new(),
            skipped_types,
            magic_types,
            polymorphic_types,
            dynamic_types,
            string_types,
            extended_types,
        }
    }
}

/// Get the standardised name for `type_name`.
fn dump_name(type_name: StringRef) -> String {
    let name = type_name.trim_start_matches('%');
    let name = name.replace(".", "_");
    name.to_string()
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
                    let (ofs, _) = flattened.next().unwrap();
                    let magic = ctx.magic_types
                        .get(type_name.as_ref())
                        .and_then(|(ofs2, value)| {
                            if ofs == *ofs2 { Some(*value) } else { None }
                        });
                    tasks.push(DumpTask::Scalar { magic });
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

                    if ctx.string_types.contains(&(type_name.as_ref(), ofs)) {
                        tasks.push(DumpTask::String);
                    } else {
                        let length = ctx.dynamic_types.get(&(type_name.as_ref(), ofs)).cloned().unwrap_or(PointeeLength::None);
                        tasks.push(DumpTask::Pointer { 
                            pointee: pointee.clone(),
                            length,
                        });
                    }
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
                tasks.push(DumpTask::Scalar { magic: None });
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

    if let Some(code) = ctx.polymorphic_types.get(type_name.as_ref()) {
        _ = writeln!(writer, r#"
static void dump_{suffix}(const void *p, int rep) {{
{code}
}}"#);
        // Done for polymorphic types
        ctx.dump_funcs.insert(type_name.to_string(), String::from_utf8(writer).unwrap());
        return;
    }
    
    _ = writeln!(writer, r#"
static void dump_{suffix}(const void *p, int rep) {{
    static const void *table[4096]; static int index = 0;
    int len; int size = 0;
    if (index >= 4095) {{ print_bt("overflow in {suffix}"); assert(false); }}
    sprintf(bt[bt_index++], "{suffix}\t%p", p);
    for (int i = 0; i < index; i++) if (p == table[i]) return;
    table[index++]=p;
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
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const void **)(p+{ofs}+r*{all_size}));"#);
            }
            DumpTask::Scalar { magic } => {
                match size {
                    1 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int8_t *)(p+{ofs}+r*{all_size}));"#),
                    2 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int16_t *)(p+{ofs}+r*{all_size}));"#),
                    4 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %d, {size} ],\n", {ofs}+r*{all_size},  *(int32_t *)(p+{ofs}+r*{all_size}));"#),
                    8 => _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": [ %lld, {size} ],\n", {ofs}+r*{all_size},  *(int64_t *)(p+{ofs}+r*{all_size}));"#),
                    _ => unreachable!(),
                };
                
                if let Some(magic) = magic {
                    assert!(size == 4);
                    _ = writeln!(writer, r#"    check_magic(p+{ofs}+r*{all_size}, {magic});"#);
                }
            }
            DumpTask::String => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const void **)(p+{ofs}+r*{all_size}));"#);
                _ = writeln!(writer2, r#"    dump_string(*(const void **)(p+{ofs}+r*{all_size}));"#);
            }
            DumpTask::Pointer { pointee, length } => {
                let len_string = match length {
                    PointeeLength::None => "1".to_string(),
                    PointeeLength::LoadI32(rel) => format!("*(int *)(p+{ofs}+r*{all_size}+{rel})"),
                    PointeeLength::LoadI8Pow(rel) => format!("1<<(*(unsigned char *)(p+{ofs}+r*{all_size}+{rel}))"),
                    PointeeLength::Const(len) => len.to_string(),
                };
                label += 1;
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const void **)(p+{ofs}+r*{all_size}));"#);
                _ = writeln!(writer2, r#"    if (deref_error(*(const void **)(p+{ofs}+r*{all_size}))) {{ goto skip_{label}; }}
    len = {len_string};"#);
                match pointee.as_ref() {
                    TypeExt::Named(pointee_name) => {
                        let suffix = dump_name(pointee_name.clone());
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const void **)(p+{ofs}+r*{all_size}), len);"#);
                        dump_gen_named(ctx, pointee_name.clone());
                    }
                    TypeExt::Type(pointee_ty) => {
                        let suffix = format!("anon_{:p}", *pointee_ty);
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const void **)(p+{ofs}+r*{all_size}), len);"#);
                        dump_gen_anon(ctx, pointee_ty.clone());
                    }
                    TypeExt::TypedPtr(pointee2) => {
                        // First dump the pointee as a pointer array
                        let suffix = format!("anon_{:p}", Type::mk_pointer());
                        _ = writeln!(writer2, r#"    dump_{suffix}(*(const void **)(p+{ofs}+r*{all_size}), len);"#);
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
        const void *pp = *(const void **)(*(const void **)(p+{ofs}+r*{all_size}) + 8*j);
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
    if let Some(code) = ctx.extended_types.get(type_name.as_ref()) {
        _ = writeln!(writer, r#"    assert(rep == 1);
{code}"#);
    }

    let dump_code = String::from_utf8(writer2).unwrap();
    _ = writeln!(writer, r#"    fprintf(f, "\t\"__size__\": %d,\n\t\"__type__\": \"%{type_name}\"}},\n", size);
r = 0;
field_start:
    if (r >= rep) goto field_end;
{dump_code}
    r++;
    goto field_start;
field_end:
    bt_index--;
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
static void dump_{anon_name}(const void *p, int rep) {{
    static const void *table[4096]; static int index = 0;
    if (index >= 4095) {{ print_bt("overflow in {anon_name}"); assert(false); }}
    sprintf(bt[bt_index++], "{anon_name}\t%p", p);
    for (int i = 0; i < index; i++) if (p == table[i]) return;
    table[index++]=p;
    fprintf(f, "\"%p\": {{\n", p);
    int r = 0;
    if (rep <= 0) {{ rep = 0; print_bt("zero sized anonymous"); }}
again:
    if (r >= rep) goto exit;"#);

    // Dump all fields as either Scalar or Hex
    for (task, (ofs, size)) in tasks.into_iter().zip(layout.flattened.iter().cloned()) {
        match task {
            DumpTask::Hex => {
                assert_eq!(size, TYPE_POINTER_WIDTH / 8);
                _ = writeln!(writer, r#"    fprintf(f, "\t\"%d\": \"%p\",\n", {ofs}+r*{all_size}, *(const void **)(p+{ofs}+r*{all_size}));"#);
            }
            DumpTask::Scalar { magic: None } => {
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
    bt_index--;
}}"#);

    ctx.dump_funcs.insert(anon_name, String::from_utf8(writer).unwrap());
}

fn main() {
    // Get command line arguments
    let args: Vec<String> = std::env::args().collect();

    // Check if enough arguments are provided
    if args.len() < 4 {
        panic!("Not enough arguments provided. Usage: cargo run --bin ddump-c <input> <output> <types>..");
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
}

