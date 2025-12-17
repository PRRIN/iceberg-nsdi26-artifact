// ——————————
// Library
// ——————————

fn fold<E, I>(list: List<E>, f: (I, E)->I, init: I) -> I {
    if len(list) == 0 {
        init
    } else {
        fold::<E, I>(list[1..], f, f(init, list[0]))
    }
}

fn map<S, T>(list: List<S>, f: (S)->T) -> List<T> {
    fold::<S, List<T>>(
        list, 
        |mapped, elem| {
            mapped ++ [f(elem)]
        },
        [],
    )
}

fn filter<E>(list: List<E>, f: (E)->Bool) -> List<E> {
    fold::<E, List<E>>(
        list, 
        |filtered, elem| {
            filtered ++ if f(elem) { [elem] } else { [] }
        },
        [],
    )
}

fn max<E>(list: List<E>, f: (E)->Int) -> Int {
    fold::<E, Int>(
        list, 
        |res, elem| {
            let new = f(elem);
            if new >s res { new } else { res }
        },
        0,
    )
}

fn any<E>(list: List<E>, f: (E)->Bool) -> Bool {
    fold::<E, Bool>(
        list,
        |res, elem| { res || f(elem) },
        false,
    )
}

fn all<E>(list: List<E>, f: (E)->Bool) -> Bool {
    fold::<E, Bool>(
        list,
        |res, elem| { res && f(elem) },
        true,
    )
}

fn rev<E>(list: List<E>) -> List<E> {
    fold::<E, List<E>>(
        list,
        |res, elem| { [elem] ++ res },
        [],
    )
}

struct ListFind {
    found: Bool,
    idx: Int,
}

// len(list) for not found
fn find<E>(list: List<E>, pred: (E) -> Bool) -> ListFind {
    fold::<E, ListFind>(
        list,
        |res, elem| { 
            if res.found { 
                ListFind {
                    found: true,
                    idx: res.idx,
                } 
            } else { 
                if pred(elem) { 
                    ListFind {
                        found: true,
                        idx: res.idx,
                    } 
                } else { 
                    ListFind {
                        found: false,
                        idx: res.idx + 1,
                    } 
                }
            } 
        },
        ListFind {
            found: false,
            idx: 0,
        }
    )
}

fn fold2<A, B, I>(
    l0: List<A>,
    l1: List<B>,
    f: (I, A, B) -> I,
    init: I,
) -> I {
    let len0 = len(l0);
    let len1 = len(l1);
    if len0 == 0 || len1 == 0 {
        init
    } else {
        fold2::<A, B, I>(l0[1..], l1[1..], f, f(init, l0[0], l1[0]))
    }
}

fn list_eq<E>(l0: List<E>, l1: List<E>) -> Bool {
    let len0 = len(l0);
    let len1 = len(l1);
    len0 == len1
    && fold2::<E, E, Bool>(
        l0,
        l1,
        |eq, elem0, elem1| { eq && elem0 == elem1 },
        true,
    )
}

fn list_eq_by<E>(l0: List<E>, l1: List<E>, cmp: (E, E)->Bool) -> Bool {
    let len0 = len(l0);
    let len1 = len(l1);
    len0 == len1
    && fold2::<E, E, Bool>(
        l0,
        l1,
        |eq, elem0, elem1| { eq && cmp(elem0, elem1) },
        true,
    )
}

struct ListCmp {
    cnt: Int,
    diff: Bool,
}
fn list_cmp<E>(l0: List<E>, l1: List<E>) -> Int {
    fold2::<E, E, ListCmp>(
        l0,
        l1,
        |cmp, elem0, elem1| {
            if !cmp.diff && elem0 == elem1 {
                ListCmp {
                    cnt: cmp.cnt + 1,
                    diff: false,
                }
            } else {
                ListCmp {
                    cnt: cmp.cnt,
                    diff: true,
                }
            }
        },
        ListCmp {
            cnt: 0,
            diff: false,
        },
    ).cnt
}


// ——————————
// Type Definitions
// ——————————

use %"class.std::__cxx11::basic_string" as struct String {
    data: StringPtr,
    len: Int<64>,
    sso: StringSso,
}

use %"class.std::vector.52" as struct Vector52

use %union.anon as struct StringSso

use %"struct.std::__cxx11::basic_string<char>::_Alloc_hider" as struct StringPtr {
    ptr: Ptr,
}

use %class.PDNSException as struct DnsName {
    name: String,
}

struct Vector {
    begin: Ptr,
    end: Ptr,
    cap: Ptr,
}

use %"class.std::map" as struct Map
use %"struct.std::pair.13" as struct Pair13
use %class.LookButDontTouch as struct LookButDontTouch
use %"class.std::unique_ptr.9" as struct UniquePtr9
use %class.NSEC3PARAMRecordContent as struct NSEC3PARAMRecordContent
use %"class.boost::optional" as struct BoostOptional
use %class.DTime as struct DTime
use %class.TSIGRecordContent as packed struct TSIGRecordContent
use %union.ComboAddress as struct ComboAddress
use %"class.std::optional" as struct Optional
use %struct.QClass as struct QClass
use %"class.std::vector.33" as struct Vector33
use %struct.EDNSSubnetOpts as struct EDNSSubnetOpts
use %"class.std::shared_ptr" as struct SharedPtr
use %struct.SOAData as packed struct SOAData
use %class.DNSSECKeeper as packed struct DNSSECKeeper
use %"class.std::vector.387" as struct Vector387
use %"class.UeberBackend::handle" as struct UeberBackendHandle
use %"class.__gnu_cxx::__normal_iterator.95" as struct Iter95
use %"struct.UeberBackend::Question" as struct UeberBackendQuestion

use %class.BB2DomainInfo as struct DomainInfo {
    d_name: DnsName,
    d_kind: Int<8>,
    d_filename: String,
    d_status: String,
    d_masters: Vector52,
    d_also_notify: Map,
    d_records: LookButDontTouch,
    d_ctime: Int<64>,
    d_lastcheck: Int<64>,
    d_lastnotified: Int<32>,
    d_id: Int<32>,
    d_checknow: Int<8>,
    d_loaded: Int<8>,
    d_was_rejected_last_reload: Int<8>,
    d_nsec3zone: Int<8>,
    d_nsec3param: NSEC3PARAMRecordContent,
    d_checkinterval: Int<64>,
}

use %class.PacketHandler as struct PacketHandler {
    d_log_dns_details: Int<8>,
    d_do_dname: Int<8>,
    d_do_expand_alias: Int<8>,
    d_dnssec: Int<8>,
    _: [Int<8>; 4],
    d_sd: SOAData,
    d_pdl: UniquePtr9,
    d_update_policy_lua: UniquePtr9,
    s_lua: UniquePtr9,
    b: UeberBackend,
    d_dk: DNSSECKeeper,
}

use %class.UeberBackend as packed struct UeberBackend {
    backends: Vector387,
    d_handle: UeberBackendHandle,
    d_answers: Vector33,
    d_cachehandleiter: Iter95,
    d_question: UeberBackendQuestion,
    d_cache_ttl: Int<32>,
    d_negcache_ttl: Int<32>,
    d_qtype: Int<16>,
    d_negcached: Int<8>,
    d_cached: Int<8>,
    d_stale: Int<8>,
    _: [Int<8>; 3],
}

use %struct.Bind2DNSRecord as packed struct Bind2DNSRecord {
    qname: DnsName,
    content: String,
    nsec3hash: String,
    ttl: Int<32>,
    qtype: Int<16>,
    auth: Int<8>,
    _: Int<8>,
}

use %struct.DNSZoneRecord as struct DnsZoneRecord {
    domain_id: Int<32>,
    scope_mask: Int<8>,
    signttl: Int<32>,
    wildcardname: DnsName,
    auth: Int<8>,
    disabled: Int<8>,
    _: [Int<8>; 6],
    dr: DnsRecord,
}

use %struct.DNSRecord as packed struct DnsRecord {
    d_name: DnsName,
    d_content: SharedPtr,
    d_type: Int<16>,
    d_class: Int<16>,
    d_ttl: Int<32>,
    d_clen: Int<16>,
    d_place: Int<8>,
    _: [Int<8>; 5],
}

use %class.DNSPacket as struct DnsPacket {
    d_any_local: BoostOptional,
    d_dt: DTime,
    qdomain: DnsName,
    qdomainwild: DnsName,
    qdomainzone: DnsName,
    d_peer_principal: String, 
    d: DnsHeader,
    _: [Int<8>; 4],
    d_trc: TSIGRecordContent,
    d_remote: ComboAddress,
    d_inner_remote: Optional,
    d_tsig_algo: Int<32>,
    d_edns_raw_packet_size_limit: Int<32>,
    qclass: Int<16>,
    qtype: QClass, // this type is strangely declared this way...
    d_tcp: Int<8>,
    d_dnssec_ok: Int<8>,
    d_havetsig: Int<8>,
    d_tsigsecret: String,
    d_tsigkeyname: DnsName,
    d_tsigprevious: String,
    d_rrs: Vector33,
    d_rawpacket: String,
    d_eso: EDNSSubnetOpts,
    d_eco: Pair13,
    d_maxreplylen: Int<32>,
    d_socket: Int<32>,
    d_hash: Int<32>,
    d_ednsrcode: Int<16>,
    d_ednsversion: Int<8>,
    d_wrapped: Int<8>,
    d_compress: Int<8>,
    d_tsigtimersonly: Int<8>,
    d_wantsnsid: Int<8>,
    d_haveednssubnet: Int<8>,
    d_haveednscookie: Int<8>,
    d_ednscookievalid: Int<8>,
    d_haveednssection: Int<8>,
    d_is_query: Int<8>,
}

use %struct.dnsheader as struct DnsHeader {
    flags: Int<32>,
    qdcount: Int<16>,
    ancount: Int<16>,
    nscount: Int<16>,
    arcount: Int<16>,
}

// ——————————
// PowerDNS SPECs
// ——————————

fn qtype_precond(qtype: Int<16>) -> Bool {
    qtype != 0w16  // EMPTY
    & qtype != 25w16 // KEY
    & qtype != 41w16 // OPT
    & qtype != 43w16 // DS
    & qtype != 46w16 // RRSIG
    & qtype != 47w16 // NSEC
    & qtype != 48w16 // DNSKEY
    & qtype != 50w16 // NSEC3
    & qtype != 51w16 // NSEC3PARAM
    & qtype != 59w16 // CDS
    & qtype != 60w16 // CDNSKEY
    & qtype != 64w16 // SVCB
    & qtype != 65w16 // HTTPS
    & qtype < 249w16  // not META
}

fn handler_precond(handler: Ptr) -> Bool {
    specialize(handler |> PacketHandler.d_log_dns_details |> *Int<8>)
    && specialize(handler |> PacketHandler.d_do_dname |> *Int<8>)
    && specialize(handler |> PacketHandler.d_do_expand_alias |> *Int<8>)
    && specialize(handler |> PacketHandler.d_dnssec |> *Int<8>)
}

fn packet_precond(packet: Ptr) -> Bool {
    specialize(packet |> DnsPacket.d |> DnsHeader.flags |> *Int<32>)
    && specialize(packet |> DnsPacket.qclass |> *Int<16>)
    && specialize(packet |> DnsPacket.d_havetsig |> *Int<8>)
    && specialize(packet |> DnsPacket.d_haveednssection |> *Int<8>)
    && specialize(packet |> DnsPacket.d_is_query |> *Int<8>)
    && specialize(packet |> DnsPacket.d_dnssec_ok |> *Int<8>)
    && specialize(packet |> DnsPacket.d_any_local |> *Int<8>)
}

fn dns_name_precond(dns_name: Ptr) -> Bool {
    specialize(dns_name |> DnsName.name |> String.len |> *Int<64>)
}

fn ueber_backend_precond(ub: Ptr) -> Bool {
    specialize(ub |> UeberBackend.d_cache_ttl |> *Int<32>)
    && specialize(ub |> UeberBackend.d_negcache_ttl |> *Int<32>)
    && specialize(ub |> UeberBackend.d_cached |> *Int<8>)
    && specialize(ub |> UeberBackend.d_negcached |> *Int<8>)
    && specialize(ub |> UeberBackend.d_stale |> *Int<8>)
}

// --- function preconds ---

fn do_question_precond(sret: Ptr, handler: Ptr, packet: Ptr) -> Bool {
    let qtype = packet |> DnsPacket.qtype |> *Int<16>;
    let qname = packet |> DnsPacket.qdomain;
    qtype_precond(qtype)
    && dns_name_precond(qname)
    && handler_precond(handler)
    && packet_precond(packet)
}

fn make_nxdomain_precond(handler: Ptr, packet: Ptr, r: Ptr, target: Ptr, wildcard: Ptr) -> Bool {
    handler_precond(handler)
}

fn make_noerror_precond(handler: Ptr, packet: Ptr, r: Ptr, target: Ptr, wildcard: Ptr, mode: Int<32>) -> Bool {
    handler_precond(handler)
}

fn ueber_backend_get_auth_precond(ub: Ptr, target: Ptr, qtype: Ptr, soadata: Ptr) -> Bool {
    ueber_backend_precond(ub)
    && dns_name_precond(target)
}

fn ueber_backend_get_precond(ub: Ptr, rr: Ptr) -> Bool {
    ueber_backend_precond(ub)
}

fn ueber_backend_lookup_precond(ub: Ptr, qtype: Ptr, qname: Ptr, zone_id: Int<32>, packet: Ptr) -> Bool {
    ueber_backend_precond(ub)
}

fn bind_backend_lookup_precond(backend: Ptr, qtype: Ptr, qname: Ptr, zone_id: Int<32>, packet: Ptr) -> Bool {
    specialize(zone_id)
    && dns_name_precond(qname)
}

fn bind_backend_get_precond(backend: Ptr, rr: Ptr) -> Bool {
    specialize(backend |> Int<8>[454] |> *Int<8>)
    && specialize(backend |> Int<8>[455] |> *Int<8>)
}

fn bind_backend_handle_get_precond(handle: Ptr, rr: Ptr) -> Bool {
    specialize(handle |> Int<8>[454-336] |> *Int<8>)
    && specialize(handle |> Int<8>[455-336] |> *Int<8>)
}

fn multi_index_equal_range_precond(hash_index: Ptr, qname: Ptr) -> Bool {
    dns_name_precond(qname)
}

fn bucket_array_position_precond(hash: Int<64>, index: Int<64>) -> Bool {
    specialize(hash) && specialize(index)
}

fn is_part_of_precond(self: Ptr, parent: Ptr) -> Bool {
    dns_name_precond(self)
    && dns_name_precond(parent)
}

// --- oracles --- 

// Allow 8-bit DNS queries.
fn valid_dns_name(_: Ptr) -> Bool {
    true
}

// Disable EDNS.
fn has_edns(_: Ptr) -> Bool {
    false
}

// Disable cache.
fn cache_has(backedn: Ptr, question: Ptr, rrs: Ptr) -> Int<32> {
    -1w32
}

// Never perform lowering.
fn dns_tolower(ch: Int<8>) -> Int<8> {
    ch
}

// Read an abstract map.
fn safe_get_bbdomaininfo(target: Ptr, bbd: Ptr) -> Bool {
    let info_key: Ptr = "DOMAIN_INFO";
    let info: List<Ptr> = values(info_key);
    let info = info[0];

    // vvv This solves the refcount issue of the shared pointer vvv
    let _ = specialize(info |> DomainInfo.d_records |> Ptr[1] |> *Ptr |> Int<8>[8] |> *Int<32>);
    if string_compare(target, info |> DomainInfo.d_name) == 0w32 {
        let _ = store(bbd, info |> *DomainInfo);
        true
    } else {
        false
    }
}

// Read an abstract map.
fn safe_get_bbdomaininfo2(id: Int<32>, bbd: Ptr) -> Bool {
    // ..there is only one zone for now
    if id == 1w32 {
        let info_key: Ptr = "DOMAIN_INFO";
        let info: List<Ptr> = values(info_key);
        let _ = store(bbd, info[0] |> *DomainInfo);
        true
    } else {
        false
    }
}


// Never stale.
fn bbdomaininfo_current(_: Ptr) -> Bool {
    true
}

// DNSSEC is not in scope.
fn is_presigned(keeper: Ptr, name: Ptr, use_cache: Bool) -> Bool {
    false
}

// SOA serial is not modeled.
fn calculate_edit_soa(serial: Int<32>, keeper: Ptr, name: Ptr) -> Int<32> {
    serial
}

// AuthPacketCache is disabled.
fn auth_packet_cache_enabled() -> Bool {
    false
}


// --- mastermake begin ---

use @_ZNSt10shared_ptrIK16DNSRecordContentEC2Ev as fn shared_ptr_new(Ptr); 

fn master_make(sret: Ptr, qtype: Int<16>, qclass: Int<16>, content: Ptr) {
    let _ = specialize(qtype);
    if qtype == 2w16 {
        master_make_ns(sret, content)
    } else { if qtype == 5w16 {
        master_make_ns(sret, content) //..layout's the same
    } else { if qtype == 15w16 {
        master_make_mx(sret, content)
    } else { if qtype == 33w16 {
        master_make_srv(sret, content)
    } else { if qtype == 39w16 {
        master_make_ns(sret, content) //..layout's the same
    } else {
        shared_ptr_new(sret) // don't parse the content
    }}}}}
}

struct Parsed {
    name: List<Int<8>>,
    label: List<Int<8>>,
    llen: Int<8>,
}
fn master_make_dns_name(content: Ptr, p: Ptr) {
    let rdlen = content |> String.len |> *Int<64>;
    let _ = specialize(rdlen);
    let rdata = into_dns_rdata(
        content |> String.data |> *Ptr |> Int<8>[rdlen-1w64], 
        rdlen,
    ); // ..this is a dot-separated list
    let name = fold::<Int<8>, Parsed>(
        rdata ++ [46w8],
        |acc, ch| {
            let _ = specialize(ch);
            if ch == 46w8 {
                Parsed {
                    name: acc.name ++ [acc.llen] ++ acc.label,
                    label: [],
                    llen: 0w8,
                }
            } else {
                Parsed {
                    name: acc.name,
                    label: acc.label ++ [ch],
                    llen: acc.llen + 1w8,
                }
            }
        },
        Parsed {
            name: [],
            label: [],
            llen: 0w8,
        },
    ).name; // ..this is an octet-form DNS name

    let length = fold::<Int<8>, Int<64>>(
        if name[len(name)-1] == 0w8 { name } else { name ++ [0w8] },
        |cnt, ch| {
            let _ = store(p |> String.sso |> Int<8>[cnt], ch);
            cnt + 1w64
        },
        0w64
    );
    let _ = store(p |> String.sso |> Int<8>[length], 0w8);
    let _ = store(p |> String.len, length);
    store(p |> String.data, p |> String.sso)
}

use %class.PTRRecordContent as struct NSRecordContent // unfortunately the type is merged..
fn master_make_ns(sret: Ptr, content: Ptr) {
    let ns_content: NSRecordContent = havoc;
    let ns_content = alloc(ns_content);
    let ns_name = ns_content |> Int<8>[8];

    let _ = master_make_dns_name(content, ns_name);
    let _ = shared_ptr_new(sret);
    store(sret, ns_content)
}

use %class.MXRecordContent as struct MXRecordContent 
fn master_make_mx(sret: Ptr, content: Ptr) {
    let mx_content: MXRecordContent = havoc;
    let mx_content = alloc(mx_content);
    let mx_name = mx_content |> Int<8>[16];

    let _ = master_make_dns_name(content, mx_name);
    let _ = shared_ptr_new(sret);
    store(sret, mx_content)
}

use %class.SRVRecordContent as struct SRVRecordContent 
fn master_make_srv(sret: Ptr, content: Ptr) {
    let srv_content: SRVRecordContent = havoc;
    let srv_content = alloc(srv_content);
    let srv_name = srv_content |> Int<8>[16];

    let _ = master_make_dns_name(content, srv_name);
    let _ = shared_ptr_new(sret);
    store(sret, srv_content)
}

// --- mastermake end ---


// DNSSEC is not in scope.
fn is_secured_zone(keeper: Ptr, zone: Ptr, use_cache: Bool) -> Bool {
    false
}

// ——————————
// C++ Standard Library
// ——————————

// Set a range of memory to `ch`.
fn __memset(p: Ptr, len: Int<64>, ch: Int<8>) {
    let _ = store(p, ch);
    if len >s 1w64 {
        __memset(p |> Int<8>[1], len - 1w64, ch)
    } else {
        none
    }
}

// Copy `len` bytes from `src` to `dst`.
// Note: `len` MUST be specialized.
fn __memcpy(dst: Ptr, src: Ptr, len: Int<64>) {
    if len >s 0w64 {
        let _ = store(dst, src |> *Int<8>);
        __memcpy(dst |> Int<8>[1], src |> Int<8>[1], len - 1w64)
    } else {
        none
    }
}

// Copy a C-string from `src` to `dst`, returning the length
// of the string (including the null-terminator).
// Note: this specialize on `src`!
fn __strcpy(dst: Ptr, src: Ptr) -> Int<64> {
    let ch = src |> *Int<8>;
    let _ = specialize(ch);
    let _ = store(dst, ch);
    if ch == 0w8 {
        1w64
    } else {
        1w64 + __strcpy(dst |> Int<8>[1], src |> Int<8>[1])
    }
}

// Get the length of a C-string.
fn __strlen(str: Ptr) -> Int<64> {
    let ch = str |> *Int<8>;
    let _ = specialize(ch); 
    if ch == 0w8 {
        0w64
    } else {
        1w64 + __strlen(str |> Int<8>[1])
    }
}

// Convert a null-terminated string into a `List`.
fn __str_to_list(p: Ptr) -> List<Int<8>> {
    let ch = p |> *Int<8>;
    if ch == 0w8 {
        []
    } else {
        [ch] ++ __str_to_list(p |> Int<8>[1])
    }
}

// C++ runtime object cast based on the inheritance hierarchy.
// 
// XXX: Correctly modeling the semantics is quite complex, and frankly an 
// overkill. As long as there is no multiple inheritance, virtual inheritance 
// or other weird shenanigans going on, this should translate to a simple
// pointer offseting operation (barring the runtime validity checks).
// 
// Still, we'll note that this is by no means a complete implementation.
fn __dynamic_cast(p: Ptr, old_type_info: Ptr, new_type_info: Ptr, ofs: Int<64>) -> Ptr {
    p |> Int<8>[ofs]
}

// C++ string library port in SpIce.
//
// All the implementations below mimic the string API described by the C++ reference at 
// https://cplusplus.com/reference/string/basic_string/ on a behavioral level. Here are
// the most important details:
//
// * We ensure all backing storage is properly null-terminated. Equivalently, we assume 
//   that the following holds for any string `s`:
// ```
// s |> String.data |> Int<8>[s |> String.len |> *Int<64>] |> *Int<8> == 0w8
// ```
// 
// * We do use the SSO buffer for short strings. Combined with the point above, all strings
//   no longer than 15 bytes are stored using `String.sso`.
// 
// * We allocate a fixed-length in-heap buffer for longer strings (`StringBuf`). This 
//   means manipulating any longer strings lead to `Panic`s. These buffers are properly
//   freed upon string destruction.
//
// * We model the exception guarantees strictly, i.e., we throw whenever the C++ reference
//   says so.
//
// * We do not model custom allocators (`std::allocator`).
// 
// * We do not model strings other than (`std::basic_string<char>`).


/// In-heap string buffer for non-sso-ed strings.
struct StringBuf {
    buf: [Int<8>; 128],
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string()
// 
// Construct a new empty string, using the SSO buffer.
fn string_new(self: Ptr) {
    let _ = store(self |> String.data, self |> String.sso);
    let _ = store(self |> String.len, 0w64);
    store(self |> String.sso, 0w8)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string(std::allocator<char> const&)
//
// Alias to `string_new` (allocator not modeled).
fn string_new_alloc(self: Ptr, _: Ptr) {
    string_new(self)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string(char const*, unsigned long, std::allocator<char> const&)
//
// Construct a new string from a char buffer.
fn string_new_buffer(self: Ptr, s: Ptr, len: Int<64>, _: Ptr) {
    let _ = specialize(len);

    let data = if len <= 15w64 {
        self |> String.sso
    } else {
        let lso: StringBuf = havoc;
        // let _ = string_capacity_set(self, 128w64);
        alloc(lso)
    };
    let _ = __memcpy(data, s, len);
    let _ = store(data |> Int<8>[len], 0w8);
    let _ = store(self |> String.len, len);
    store(self |> String.data, data)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string<std::allocator<char>>(char const*, std::allocator<char> const&)
//
// Construct a new string from a C-string.
fn string_new_cstr(self: Ptr, str: Ptr, _: Ptr) {
    let len = __strlen(str);
    string_new_buffer(self, str, len, havoc)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
// 
// Construct a new string by copy.
fn string_new_copy(self: Ptr, other: Ptr) {
    string_new_buffer(
        self, 
        other |> String.data |> *Ptr, 
        other |> String.len |> *Int<64>, 
        havoc
    )
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::basic_string(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>&&)
// 
// Construct a new string by move. `other` is left as an empty string.
fn string_new_move(self: Ptr, other: Ptr) {
    let str = other |> String.data |> *Ptr;
    if str == other |> String.sso {
        let _ = store(self, other |> *String);
        let _ = store(self |> String.data, self |> String.sso);
        string_new(other)
    } else {
        let _ = store(self, other |> *String);
        string_new(other)
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::~basic_string()
// 
// Destruct a string. If `self` is backed by heap, the allocation is freed.
fn string_drop(self: Ptr) {
    let str = self |> String.data |> *Ptr;
    if str == self |> String.sso {
        none
    } else {
        // let _ = debug(self |> String.data |> *Ptr);
        // let _ = debug(self |> String.len |> *Int<64>);
        // let _ = debug(self |> String.sso);
        free(str)
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::compare(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&) const
//
// Compare `this` lexicographically to the string `other`,
fn string_compare(this: Ptr, other: Ptr) -> Int<32> {
    let len1 = this |> String.len |> *Int<64>;
    let len2 = other |> String.len |> *Int<64>;
    let _ = specialize(len1) && specialize(len2);
    __string_compare(
        this |> String.data |> *Ptr, 
        len1,
        other |> String.data |> *Ptr, 
        len2,
    )
}

fn __string_compare(p1: Ptr, len1: Int<64>, p2: Ptr, len2: Int<64>) -> Int<32> {
    if len1 == 0w64 {
        if len2 == 0w64 {
            0w32 // equal
        } else {
            -1w32 // less
        }
    } else {
        if len2 == 0w64 {
            1w32 // greater
        } else {
            let ch1 = p1 |> *Int<8>;
            let ch2 = p2 |> *Int<8>;
            if ch1 == ch2 {
                __string_compare(p1 |> Int<8>[1], len1 - 1w64, p2 |> Int<8>[1], len2 - 1w64)
            } else {
                if ch1 < ch2 { -1w32 } else { 1w32 }
            }
        }
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::compare(char const*) const
//
// Compare `this` lexicographically to the C-string `other`.
fn string_compare_cstr(this: Ptr, other: Ptr) -> Int<32> {
    let length = this |> String.len |> *Int<64>;
    let _ = specialize(length);
    __string_compare_cstr(
        this |> String.data |> *Ptr, 
        other, 
        length,
    )
}

fn __string_compare_cstr(p1: Ptr, p2: Ptr, len: Int<64>) -> Int<32> {
    if p2 |> *Int<8> == 0w8 {
        if len == 0w64 {
            0w32 // equal
        } else {
            1w32 // greater
        }
    } else {
        if len == 0w64 {
            -1w32 // less
        } else {
            let ch1 = p1 |> *Int<8>;
            let ch2 = p2 |> *Int<8>;
            if ch1 == ch2 {
                __string_compare_cstr(p1 |> Int<8>[1], p2 |> Int<8>[1], len - 1w64)
            } else {
                if ch1 < ch2 { -1w32 } else { 1w32 }
            }
        }
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::compare(
//      unsigned long, unsigned long, 
//      std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&, unsigned long, unsigned long
// ) const
//
// Compare `this` lexicographically to the string `other`, using only substring 
// ranges from both.
// When `pos`/`subpos` overshoots, `std::out_of_range` is thrown; when `len`/`sublen`
// overshoots, the ranges are truncated.
fn string_compare_substr(
    this: Ptr,
    pos: Int<64>,
    len: Int<64>,
    other: Ptr,
    subpos: Int<64>,
    sublen: Int<64>,
) -> Int<32> {
    let _ = specialize(pos);
    let _ = specialize(len);
    let _ = specialize(subpos);
    let _ = specialize(sublen);
    if pos > len || subpos > sublen {
        let ex: String = havoc;
        let _ = throw(ex, "@_ZTISt12out_of_range");
        havoc
    } else {
        let p1 = (this |> String.data |> *Ptr) |> Int<8>[len];
        let p2 = (other |> String.data |> *Ptr) |> Int<8>[sublen];
        let len1 = this |> String.len |> *Int<64>;
        let len2 = other |> String.len |> *Int<64>;
        // `len`s can overshoot; note the check for wrapping here
        let len1 = if len > len1 || pos + len > len1 { len1 - pos } else { len };
        let len2 = if sublen > len2 || subpos + sublen > len2 { len2 - subpos } else { sublen };
        __string_compare(
            p1,
            len1,
            p2,
            len2,
        )
    }
    
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_local_data()
//
// (Internal) Get the local data pointer of `self`.
fn string_local_data(self: Ptr) -> Ptr {
    self |> String.sso
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_data(char*)
//
// (Internal) Set the data pointer of `self`.
fn string_data_set(self: Ptr, data: Ptr) {
    store(self |> String.data, data)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_capacity(unsigned long)
//
// (Internal) Set the capacity of `self` to `cap`.
fn string_capacity_set(self: Ptr, cap: Int<64>) {
    // let _ = store(self |> String.sso |> Int<8>[7], trunc (cap shr 56w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[6], trunc (cap shr 48w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[5], trunc (cap shr 40w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[4], trunc (cap shr 32w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[3], trunc (cap shr 24w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[2], trunc (cap shr 16w64) to Int<8>);
    // let _ = store(self |> String.sso |> Int<8>[1], trunc (cap shr 8w64) to Int<8>);
    // store(self |> String.sso, trunc cap to Int<8>)
    none
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::capacity() const
//
// Get the capacity of `self`.
fn string_capcity(self: Ptr) -> Int<64> {
    // (zext self |> String.sso |> *Int<8> to Int<64>)
    // | (zext self |> String.sso |> Int<8>[1] |> *Int<8> to Int<64> shl 8w64)
    // | (zext self |> String.sso |> Int<8>[2] |> *Int<8> to Int<64> shl 16w64)
    // | (zext self |> String.sso |> Int<8>[3] |> *Int<8> to Int<64> shl 24w64)
    // | (zext self |> String.sso |> Int<8>[4] |> *Int<8> to Int<64> shl 32w64)
    // | (zext self |> String.sso |> Int<8>[5] |> *Int<8> to Int<64> shl 40w64)
    // | (zext self |> String.sso |> Int<8>[6] |> *Int<8> to Int<64> shl 48w64)
    // | (zext self |> String.sso |> Int<8>[7] |> *Int<8> to Int<64> shl 56w64)
    if self |> String.data |> *Ptr == self |> String.sso {
        15w64
    } else {
        128w64
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_data() const
//
// (Internal) Get the data pointer of `self`.
fn string_data(self: Ptr) -> Ptr {
    self |> String.data |> *Ptr
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_construct(unsigned long, char)
//
// (Internal) Construct a new string by filling it with `ch`.
fn string_construct(self: Ptr, len: Int<64>, ch: Int<8>) {
    let _ = specialize(len);
    let data = if len <= 15w64 {
        self |> String.sso
    } else {
        let lso: StringBuf = havoc;
        // let _ = string_capacity_set(self, 128w64);
        alloc(lso)
    };

    let _ = __memset(data, len, ch);
    let _ = store(data |> Int<8>[len], 0w8);
    let _ = store(self |> String.data, data);
    store(self |> String.len, len)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_S_copy_chars(char*, char const*, char const*)
// 
// (Internal) Copy characters from `begin` to `end` to `dst`.
fn string_copy_chars(dst: Ptr, begin: Ptr, end: Ptr) {
    __copy_chars(dst, begin, end)
}

fn __copy_chars(dst: Ptr, begin: Ptr, end: Ptr) {
    if begin == end {
        none
    } else {
        let _ = store(dst, begin |> *Int<8>);
        __copy_chars(dst |> Int<8>[1], begin |> Int<8>[1], end)
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::_M_set_length(unsigned long)
//
// (Internal) Set the length of `self` to `len`.
fn string_length_set(self: Ptr, len: Int<64>) {
    store(self |> String.len, len)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::empty() const
//
// Check if `self` is empty.
fn string_empty(self: Ptr) -> Bool {
    self |> String.len |> *Int<64> == 0w64
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::length() const
//
// Get the length of `self`.
fn string_length(self: Ptr) -> Int<64> {
    self |> String.len |> *Int<64>
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::find_first_not_of(char const*, unsigned long) const
// 
// Search in `self` for the first character that is not in `s`, starting from `pos`.
fn string_find_first_not_of(self: Ptr, s: Ptr, pos: Int<64>) -> Int<64> {
    let length = self |> String.len |> *Int<64>;
    let _ = specialize(length);
    let _ = specialize(pos);
    __string_find(
        self |> String.data |> *Ptr, 
        pos,    // ok to be greater than length
        length, 
        __str_to_list(s), 
        |ch, aux| { all::<Int<8>>(aux, |c| { ch != c }) },
    )
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::find_first_of(char const*, unsigned long) const
// 
// Search in `self` for the first character that is in `s`, starting from `pos`.
fn string_find_first_of(self: Ptr, s: Ptr, pos: Int<64>) -> Int<64> {
    let length = self |> String.len |> *Int<64>;
    let _ = specialize(length);
    let _ = specialize(pos);
    __string_find(
        self |> String.data |> *Ptr, 
        pos,    // ok to be greater than length
        length, 
        __str_to_list(s), 
        |ch, aux| { any::<Int<8>>(aux, |c| { ch == c }) },
    )
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::find(char, unsigned long) const
// 
// Search in `self` for the first character that matches `c`, starting from `pos`.
fn string_find(self: Ptr, c: Int<8>, pos: Int<64>) -> Int<64> {
    let length = self |> String.len |> *Int<64>;
    let _ = specialize(length);
    let _ = specialize(pos);
    __string_find(
        self |> String.data |> *Ptr, 
        pos,    // ok to be greater than length
        length, 
        [c],
        |ch, aux| { aux[0] == ch }
    )
}

fn __string_find(
    p: Ptr,
    cur: Int<64>,
    length: Int<64>,
    aux: List<Int<8>>,
    pred: (Int<8>, List<Int<8>>)->Bool,
) -> Int<64> {
    if cur >= length {
        -1w64 // std::string::npos
    } else {
        let ok = pred(p |> Int<8>[cur] |> *Int<8>, aux);
        if ok {
            cur
        } else {
            __string_find(p, cur + 1w64, length, aux, pred)
        }
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::substr(unsigned long, unsigned long) const
// 
// Construct a new string from a substring of `self`.
// When `pos` overshoots, `std::out_of_range` is thrown; when `len` overshoots, the range
// is truncated.
fn string_substr(sret: Ptr, self: Ptr, pos: Int<64>, len: Int<64>) {
    let slen = self |> String.len |> *Int<64>;
    let _ = specialize(pos);
    let _ = specialize(len);
    let _ = specialize(slen);
    if pos > slen {
        let ex: String = havoc;
        throw(ex, "@_ZTISt12out_of_range")
    } else {
        // `len` can overshoot; note the check for wrapping here
        let len = if len > slen || pos + len > slen { slen - pos } else { len };

        string_new_buffer(
            sret, 
            self |> String.data |> *Ptr |> Int<8>[pos],
            len,
            havoc
        )
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::reserve(unsigned long)
//
// Reserve capacity up to `n`.
fn string_reserve(self: Ptr, n: Int<64>) {
    none
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::begin()
// 
// Get an iterator to the beginning of `self`.
fn string_begin(self: Ptr) -> Ptr {
    self |> String.data |> *Ptr
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::end()
//
// Get an iterator to the end of `self`.
fn string_end(self: Ptr) -> Ptr {
    let len = self |> String.len |> *Int<64>;
    (self |> String.data |> *Ptr) |> Int<8>[len]
}

struct StringView {
    data: Ptr,
    len: Int<64>,
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator std::basic_string_view<char, std::char_traits<char>>() const
//
// Construct a `std::string_view` from `self`.
fn string_view(self: Ptr) -> StringView {
    StringView {
        data: self |> String.data |> *Ptr,
        len: self |> String.len |> *Int<64>,
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::rbegin() const
//
// Get a reverse iterator to the reverse beginning of `self`.
fn string_rbegin(sret: Ptr, self: Ptr) {
    let len = self |> String.len |> *Int<64>;
    store(sret, (self |> String.data |> *Ptr) |> Int<8>[len])
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::rend() const
//
// Get a reverse iterator to the reverse end of `self`.
fn string_rend(sret: Ptr, self: Ptr) {
    store(sret, self |> String.data |> *Ptr)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::resize(unsigned long)
//
// Resize `self` to a length of `count`. Can cause truncation or padding with nulls.
fn string_resize(self: Ptr, count: Int<64>) {
    let length = self |> String.len |> *Int<64>;
    let _ = specialize(length);
    let _ = specialize(count);
    let data = self |> String.data |> *Ptr;
    let _ = if count > length {
        // padding
        if data == self |> String.sso && count > 15w64 {
            // move to heap
            let buf: StringBuf = havoc;
            let buf = alloc(buf);
            let _ = __memcpy(buf, data, length);
            let _ = __memset(buf |> Int<8>[length], count - length + 1w64, 0w8);
            store(self |> String.data, buf)
        } else {
            // grow normally
            __memset(data |> Int<8>[length], count - length + 1w64, 0w8)
        }
    } else {
        // (potential) truncation
        __memset(data |> Int<8>[count], length - count, 0w8)
    };
    store(self |> String.len, count)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::clear()
//
// Erases the contents of `self`. 
fn string_clear(self: Ptr) {
    let _ = store(self |> String.data |> *Ptr, 0w8);
    store(self |> String.len, 0w64)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::pop_back()
//
// Erases the last character of `self`. 
// Note: if `self` is empty, this causes UB. Here we just throw.
fn string_pop_back(self: Ptr) {
    let len = self |> String.len |> *Int<64>;
    if len >s 0w64 {
        let _ = store(self |> String.data |> *Ptr |> Int<8>[len - 1w64], 0w8);
        store(self |> String.len, len - 1w64)
    } else {
        let ex: String = havoc;
        throw(ex, "@_ZTISt12out_of_range")
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::assign(unsigned long, char)
// 
// Assign a new value to the string by filling it with `c`.
fn string_assign_fill(self: Ptr, n: Int<64>, c: Int<8>) -> Ptr {
    let _ = string_drop(self);
    let _ = string_construct(self, n, c);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator=(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
// 
// Assign a new value to the string by copying `str`.
fn string_assign_copy_op(self: Ptr, str: Ptr) -> Ptr {
    let _ = string_drop(self);
    let _ = string_new_copy(self, str);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator=(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>&&)
//
// Assign a new value to the string by moving `str`.
fn string_assign_move_op(self: Ptr, str: Ptr) -> Ptr {
    let _ = string_drop(self);
    let _ = string_new_move(self, str);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator=(char const*)
// 
// Assign a new value to the string by copying the C-string `cstr`.
fn string_assign_cstr_op(self: Ptr, cstr: Ptr) -> Ptr {
    let _ = string_drop(self);
    let _ = string_new_cstr(self, cstr, havoc);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::at(unsigned long) const
// 
// Returns a reference to the character at `pos` in `self`.
fn string_at(self: Ptr, pos: Int<64>) -> Ptr {
    let slen = self |> String.len |> *Int<64>;
    let _ = specialize(slen);
    let _ = specialize(pos);
    if pos >= slen {
        let ex: String = havoc;
        let _ = throw(ex, "@_ZTISt12out_of_range");
        havoc
    } else {
        self |> String.data |> *Ptr |> Int<8>[pos]
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator[](unsigned long)
// 
// Returns a reference to the character at `pos` in `self`.
// Note that this is NOT identical to `string_at`, in that this allows for accessing the
// null terminator. Moreover, `pos` overshooting is UB here, where we model with a throw.
fn string_at_op(self: Ptr, pos: Int<64>) -> Ptr {
    let slen = self |> String.len |> *Int<64>;
    let _ = specialize(slen);
    let _ = specialize(pos);
    if pos > slen {
        let ex: String = havoc;
        let _ = throw(ex, "@_ZTISt12out_of_range");
        havoc
    } else {
        self |> String.data |> *Ptr |> Int<8>[pos]
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::erase(unsigned long, unsigned long)
//
// Erase the content of `self` starting from `pos` and extending `len` characters.
// When `pos` overshoots, `std::out_of_range` is thrown; when `len` overshoots, the range
// is truncated.
fn string_erase_seq(self: Ptr, pos: Int<64>, len: Int<64>) -> Ptr {
    let slen = self |> String.len |> *Int<64>;
    let _ = specialize(slen);
    let _ = specialize(pos);
    let _ = specialize(len);
    if pos > slen {
        let ex: String = havoc;
        let _ = throw(ex, "@_ZTISt12out_of_range");
        havoc
    } else {
        // `len` can be `std::string::npos`; note the check for wrapping here
        let len = if len > slen || pos + len > slen { slen - pos } else { len };
        let data = self |> String.data |> *Ptr;
        let _ = __memcpy(
            data |> Int<8>[pos],
            data |> Int<8>[pos + len],
            slen - pos - len + 1w64,
        );
        let _ = store(self |> String.len, slen - len);
        self
    }
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::append(char const*, unsigned long)
//
// Extend `self` with char buffer `buf`.
fn string_append_buffer(self: Ptr, buf: Ptr, n: Int<64>) -> Ptr {
    let _ = specialize(n);
    let len = self |> String.len |> *Int<64>;
    let _ = specialize(len);

    let data = self |> String.data |> *Ptr;
    let data = if data == self |> String.sso && len + n > 15w64 {
        // move to heap
        let lso: StringBuf = havoc;
        let lso = alloc(lso);
        let _ =  __memcpy(lso, data, len);
        let _ = store(self |> String.data, lso);
        lso
    } else {
        // normal append
        data
    };

    let _ = __memcpy(
        data |> Int<8>[len],
        buf,
        n,
    );
    let _ = store(data |> Int<8>[len+n], 0w8);
    let _ = store(self |> String.len, len+n);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::append(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
//
// Extend `self` with string `s`.
fn string_append_string(self: Ptr, s: Ptr) -> Ptr {
    string_append_buffer(
        self, 
        s |> String.data |> *Ptr, 
        s |> String.len |> *Int<64>,
    )
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::append(char const*)
// 
// Extend `self` with C-string `cstr`.
fn string_append_cstr(self: Ptr, cstr: Ptr) -> Ptr {
    let len = __strlen(cstr);
    string_append_buffer(
        self, 
        cstr,
        len,
    )
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::append(unsigned long, char)
//
// Extend `self` by filling with `c`.
fn string_append_fill(self: Ptr, n: Int<64>, c: Int<8>) -> Ptr {
    let len = self |> String.len |> *Int<64>;
    let _ = specialize(len);
    let _ = specialize(n);

    let data = self |> String.data |> *Ptr;
    let data = if data == self |> String.sso && len + n > 15w64 {
        // move to heap
        let buf: StringBuf = havoc;
        let buf = alloc(buf);
        let _ =  __memcpy(buf, data, len);
        let _ = store(self |> String.data, buf);
        buf
    } else {
        // normal append
        data
    };

    let _ = __memset(data |> Int<8>[len], n, c);
    let _ = store(data |> Int<8>[len+n], 0w8);
    let _ = store(self |> String.len, len + n);
    self
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator+=(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
//
// Alias for `string_append_string`.
fn string_append_string_op(self: Ptr, s: Ptr) -> Ptr {
    string_append_string(self, s)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::operator+=(char const*)
//
// Alias for `string_append_cstr`.
fn string_append_cstr_op(self: Ptr, cstr: Ptr) -> Ptr {
    string_append_cstr(self, cstr)
}

// std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>>::replace(unsigned long, unsigned long, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char>> const&)
// 
// Replace the range of `self` starting at `pos` and extending `len` characters with `str`.
// When `pos` overshoots, `std::out_of_range` is thrown; when `len` overshoots, the range
// is truncated.
fn string_replace(self: Ptr, pos: Int<64>, len: Int<64>, str: Ptr) -> Ptr {
    let slen = self |> String.len |> *Int<64>;
    let sslen = str |> String.len |> *Int<64>;
    let _ = specialize(sslen);
    let _ = specialize(slen);
    let _ = specialize(len);
    let _ = specialize(pos);

    if pos > slen {
        let ex: String = havoc;
        let _ = throw(ex, "@_ZTISt12out_of_range");
        havoc
    } else {
        // `len` can overshootl note the check for wrapping here
        let end = if len > slen || pos + len > slen { slen } else { pos + len };
        let data = self |> String.data |> *Ptr;
        let data = if data == self |> String.sso && pos + sslen + slen - end > 15w64 {
            // move to heap
            let buf: StringBuf = havoc;
            let buf = alloc(buf);
            let _ =  __memcpy(buf, data, slen + 1w64); // +1 for the null-term
            let _ = store(self |> String.data, buf);
            buf
        } else {
            // normal
            data
        };

        // move the rest of `self`..
        let _ = __memcpy(
            data |> Int<8>[pos + sslen],
            data |> Int<8>[end],
            slen - end + 1w64,
        );
        // move the replacing string in..
        let _ = __memcpy(
            data |> Int<8>[pos],
            str |> String.data |> *Ptr,
            sslen,
        );
        let _ = store(self |> String.len, pos + sslen + slen - end);
        self
    }
}

// ——————————
// Top Level
// ——————————

struct Verdict {
    ok: Bool,
    pdns: Response,
    model: Response,
}

use @_ZN13PacketHandler10doQuestionER9DNSPacket as fn pdns_rrlookup(Ptr, Ptr, Ptr);

fn verify_pdns(
    handler: Ptr,
    info: Ptr,
    packet: Ptr,
) -> Verdict {
    let empty = Response {
        rcode: DnsRCode.NOERROR,
        aa: true,
        answer: [],
        authority: [],
        additional: [],
    };
    let sret: UniquePtr9 = havoc;
    let sret = alloc(sret);

    // // Disable EDNS
    // let _ = store(packet |> DnsPacket.d_haveednssection, 0w8);

    let zone = into_zone(info);
    let query = into_query(packet);
    if !valid_query(query, zone.origin) {
        // Non-valid queries are omitted
        Verdict {
            ok: true,
            pdns: empty,
            model: empty,
        }
    } else {

        // Get model's response
        let resp = rrlookup(zone, query);

        // Get pdns's response
        let _ = pdns_rrlookup(
            sret,
            handler,
            packet,
        );

        let impl_resp = into_response(sret |> *Ptr);
        
        // Response equality means verification
        let ok = impl_resp.rcode == resp.rcode
        && impl_resp.aa == resp.aa
        && compare_rrset(impl_resp.answer, resp.answer)
        && compare_rrset(impl_resp.authority, resp.authority)
        && compare_rrset(impl_resp.additional, resp.additional);

        if ok {
            Verdict {
                ok: true,
                pdns: impl_resp,
                model: resp,
            }
        } else {
            Verdict {
                ok: false,
                pdns: impl_resp,
                model: resp,
            }
        }
    }
}


// Compare two (unordered) sets of Records.
fn compare_rrset(rs1: List<Record>, rs2: List<Record>) -> Bool {
    if len(rs1) != len(rs2) {
        false
    } else {
        if len(rs1) == 0 {
            true
        } else {
            let rr1 = rs1[0];
            let res = find::<Record>(rs2, |rr2| { compare_rr(rr1, rr2) });
            if res.found {
                compare_rrset(rs1[1..], rs2[..res.idx] ++ rs2[res.idx+1..])
            } else {
                false
            }
        }
    }
}

// Compare two Records.
fn compare_rr(rr1: Record, rr2: Record) -> Bool {
    rr1.rtype == rr2.rtype
    && list_eq::<Int<8>>(rr1.rname, rr2.rname)
    && list_eq::<Int<8>>(rr1.rdata, rr2.rdata)
}

fn valid_query(query: Query, origin: List<Int<8>>) -> Bool {
    is_parent(origin, query.qname)
    && qtype_precond(query.qtype)
}

struct ListSuffix {
    idx: Int,
    suffixes: List<List<Int<8>>>,
}

fn get_suffixes(rname: List<Int<8>>) -> List<List<Int<8>>> {
    fold::<Int<8>, ListSuffix>(
        rname,
        |acc, label| {
            if label == 46w8 {
                ListSuffix {
                    idx: acc.idx + 1,
                    suffixes: [rname[acc.idx+1..]] ++ acc.suffixes,
                }
            } else {
                ListSuffix {
                    idx: acc.idx + 1,
                    suffixes: acc.suffixes,
                }
            }
        },
        ListSuffix {
            idx: 0,
            suffixes: [],
        },
    ).suffixes
}

// Make a Zone from a PowerDNS `BB2DomainInfo`.
fn into_zone(info: Ptr) -> Zone {
    let orig_len = info |> DomainInfo.d_name |> String.len |> *Int<64>;
    let _ = specialize(orig_len);
    let origin = visit_dns_name(
        info |> DomainInfo.d_name |> String.data |> *Ptr,
        orig_len,
        true,
    );

    let records_key: Ptr = "RECORDS";
    let records: List<Ptr> = values(records_key);
    let all_rrs = map::<Ptr, Record>(
        records,
        |rr| { into_dns_record(rr, origin, true) },
    );

    let cut_rrs = filter::<Record>(
        all_rrs, 
        |rr| { rr.rtype == 2w16 && !list_eq::<Int<8>>(rr.rname, origin) }
    );
    let rrs = filter::<Record>(
        all_rrs, 
        |rr| { !any::<Record>(cut_rrs, |ns| { is_parent(ns.rname, rr.rname) }) }
    );
    let glue_rrs = filter::<Record>(
        all_rrs, 
        |rr| { any::<Record>(cut_rrs, |ns| { rr.rtype != 2w16 && is_parent(ns.rname, rr.rname) }) }
    ); // technically, we are not authoriative to cut NS rrs as well, but they are not glue

    let rrs = rrs ++ cut_rrs;

    // ..PDNS stored empty-non-terminals by default
    Zone {
        origin: origin,
        rrs: rrs,
        glue_rrs: glue_rrs,
    }
}

// Make a Query from a PowerDNS `packet`.
fn into_query(packet: Ptr) -> Query {
    let qlen = packet |> DnsPacket.qdomain |> String.len |> *Int<64>;
    let _ = specialize(qlen);
    let qname = visit_dns_name(
        packet |> DnsPacket.qdomain |> String.data |> *Ptr,
        qlen,
        false,
    );
    let qtype = packet |> DnsPacket.qtype |> *Int<16>;

    Query {
        qname: qname,
        qtype: qtype,
        qcount: 0,
    }
}

// Make a Response from a PowerDNS response.
fn into_response(packet: Ptr) -> Response {
    let flags = packet |> DnsPacket.d |> DnsHeader.flags |> *Int<32>;
    let rcode = into_dns_rcode((flags shr 24w32) & 15w32);
    let aa = ((flags shr 18w32) & 1w32) != 0w32;

    let rr_begin = packet |> DnsPacket.d_rrs |> Vector.begin |> *Ptr;
    let rr_end = packet |> DnsPacket.d_rrs |> Vector.end |> *Ptr;
    let rrs = visit_dnszonerecord_vector(rr_begin, rr_end);

    let answer = map::<Ptr, Record>(
        filter::<Ptr>(rrs, |p| { p |> DnsZoneRecord.dr |> DnsRecord.d_place |> *Int<8> == 1w8 }),
        |p| { visit_dns_zone_record(p) }
    );
    let authority = map::<Ptr, Record>(
        filter::<Ptr>(rrs, |p| { p |> DnsZoneRecord.dr |> DnsRecord.d_place |> *Int<8> == 2w8 }),
        |p| { visit_dns_zone_record(p) }
    );
    let additional = map::<Ptr, Record>(
        filter::<Ptr>(rrs, |p| { p |> DnsZoneRecord.dr |> DnsRecord.d_place |> *Int<8> == 3w8 }),
        |p| { visit_dns_zone_record(p) }
    );

    Response {
        rcode: rcode,
        aa: aa,
        answer: answer,
        authority: authority,
        additional: additional,
    }
}

fn visit_dnszonerecord_vector(begin: Ptr, end: Ptr) -> List<Ptr> {
    if begin >= end {
        []
    } else {
        let _ = specialize(begin |> DnsZoneRecord.dr |> DnsRecord.d_place |> *Int<8>);
        [begin] ++ visit_dnszonerecord_vector(begin |> DnsZoneRecord[1], end)
    }
}

fn visit_dns_zone_record(p: Ptr) -> Record {
    let name = p |> DnsZoneRecord.dr |> DnsRecord.d_name;
    let rlen = name |> String.len |> *Int<64>;
    let _ = specialize(rlen);
    let rname = visit_dns_name(
        name |> String.data |> *Ptr,
        rlen,
        false,
    );
    let rtype = p |> DnsZoneRecord.dr |> DnsRecord.d_type |> *Int<16>;
    let _ = specialize(rtype);

    Record {
        rname: rname,
        rtype: rtype,
        rdata: visit_dns_zone_record_rdata(rtype, p |> DnsZoneRecord.dr |> DnsRecord.d_content |> *Ptr),
    }
}

fn visit_dns_zone_record_rdata(rtype: Int<16>, content: Ptr) -> List<Int<8>> {
    if rtype == 2w16 || rtype == 5w16 || rtype == 39w16 {
        let name = content |> Int<8>[8];
        let rdlen = name |> String.len |> *Int<64>;
        let _ = specialize(rdlen);
        visit_dns_name(name |> String.data |> *Ptr, rdlen, false)
    } else {
        if rtype == 15w16 || rtype == 33w16 {
            let name = content |> Int<8>[16];
            let rdlen = name |> String.len |> *Int<64>;
            let _ = specialize(rdlen);
            visit_dns_name(name |> String.data |> *Ptr, rdlen, false)
        } else {
            []
        }
    }
}

fn into_dns_rcode(rcode: Int<32>) -> DnsRCode {
    let _ = specialize(rcode);
    if rcode == 0w32 {
        DnsRCode.NOERROR
    } else {
        if rcode == 2w32 {
            DnsRCode.SERVFAIL
        } else {
            if rcode == 3w32 {
                DnsRCode.NXDOMAIN
            } else {
                if rcode == 5w32 {
                    DnsRCode.REFUSED
                } else {
                    DnsRCode.OTHER
                }
            }
        }
    }
}

fn into_dns_record(
    p: Ptr, 
    origin: List<Int<8>>,
    spec: Bool,
) -> Record {
    let rlen = p |> Bind2DNSRecord.qname |> String.len |> *Int<64>;
    let _ = specialize(rlen);
    let rname = visit_dns_name(
        p |> Bind2DNSRecord.qname |> String.data |> *Ptr,
        rlen,
        spec,
    );
    let rtype = p |> Bind2DNSRecord.qtype |> *Int<16>;
    let _ = specialize(rtype);

    let need_rdata =
        rtype == 2w16 || rtype == 5w16 || rtype == 15w16 || rtype == 33w16 || rtype == 39w16;
    let rdata = if need_rdata {
        let rdlen = p |> Bind2DNSRecord.content |> String.len |> *Int<64>;
        let _ = specialize(rdlen);
        let rdata = into_dns_rdata(
            (p |> Bind2DNSRecord.content |> String.data |> *Ptr) |> Int<8>[rdlen-1w64], 
            rdlen
        );
        if rdata[len(rdata)-1] != 46w8 {
            rdata ++ [46w8]
        } else {
            rdata
        }
    } else {
        []
    };

    Record {
        rname: rname ++ origin,
        rtype: rtype,
        rdata: rdata,
    }
}

fn into_dns_rdata(p: Ptr, len: Int<64>) -> List<Int<8>> {
    if len == 0w64 {
        []
    } else {
        let ch = p |> *Int<8>;
        let _ = specialize(ch);
        if ch == 32w8 {
            []
        } else {
            into_dns_rdata(p |> Int<8>[-1], len - 1w64) ++ [ch]
        }
    }
}

fn visit_dns_name(p: Ptr, len: Int<64>, spec: Bool) -> List<Int<8>> {
    let _ = specialize(p);
    if len <=s 0w64 {
        []
    } else {
        let llen = p |> *Int<8>;
        let _ = specialize(llen);
        if llen == 0w8 {
            []
        } else {
            let label = visit_dns_label(p |> Int<8>[1], llen, spec);
            let llen = zext llen to Int<64>;
            label ++ [46w8] ++ visit_dns_name(p |> Int<8>[1w64+llen], len-1w64-llen, spec)
        }
    }
}

fn visit_dns_label(p: Ptr, len: Int<8>, spec: Bool) -> List<Int<8>> {
    if len == 0w8 {
        []
    } else {
        let ch = p |> Int<8>[len-1w8] |> *Int<8>;
        visit_dns_label(p, len-1w8, spec) ++ if spec {
            let _ = specialize(ch);
            [ch]
        } else {
            let _ = ch != 46w8 || panic("bad label");
            [ch]
        } 
    }
}


// ——————————
// Reference Model
// ——————————

enum DnsRCode {
    NOERROR,
    SERVFAIL,
    NXDOMAIN,
    REFUSED,
    OTHER,
}

struct Query {
    qname: List<Int<8>>,
    qtype: Int<16>, 
    qcount: Int,
}

struct Record {
    rname: List<Int<8>>,
    rtype: Int<16>,
    rdata: List<Int<8>>,
}

struct Zone {
    // Zone origin name.
    origin: List<Int<8>>,
    // Authoriative rrs.
    rrs: List<Record>, 
    // Glue rrs.
    glue_rrs: List<Record>,
}

struct Response {
    rcode: DnsRCode, 
    aa: Bool, 
    answer: List<Record>,
    authority: List<Record>,
    additional: List<Record>,
}

fn is_parent(rname: List<Int<8>>, qname: List<Int<8>>) -> Bool {
    let rlen = len(rname);
    let qlen = len(qname);
    rlen <=s qlen                                                // `qname` is not shorter
    && list_eq::<Int<8>>(rname, qname[qlen-rlen..])              // `rname` is a suffix of `qname`
    && (qlen == rlen || qname[qlen-rlen-1] == 46w8)              // `qname` has a dot right before that
}

fn is_wild_card_domain(rr: Record) -> Bool {
    let rname = rr.rname;
    rname[0] == 42w8
    && rname[1] == 46w8                     // `rname` starts with "*."
}

fn is_wild_card_match(rr: Record, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    let rlen = len(rname);
    let qlen = len(qname);
    rlen <=s qlen                                               // `qname` is not shorter
    && is_wild_card_domain(rr)                                  // `rr` is wildcard
    && list_eq::<Int<8>>(rname[1..], qname[qlen-rlen+1..])      // `rname`, barring the "*", is a suffix of `qname`
    && (qname[qlen-rlen] != 42w8
    || qlen >s rlen && qname[qlen-rlen-1] != 46w8)              // `qname` does not also have exactly a "*" label at the position of the wildcard  
}

fn is_relevant_domain(rr: Record, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    is_parent(rname, qname)                     // `qname` is a subdomain
    || is_wild_card_match(rr, qname)            // `qname` is wildcard match
}

fn is_ns_match_record(rr: Record, qname: List<Int<8>>, origin: List<Int<8>>) -> Bool {
    rr.rtype == 2w16                                // `rr` is NS
    && !list_eq::<Int<8>>(rr.rname, origin)         // `rr` is not the origin name
    // && is_relevant_domain(rr, qname)             // `qname` is relevant for `rr`
}

struct RecordMatch {
    record: Record,
    len: Int,
}
fn filter_max_matches(rrs: List<Record>, qname: List<Int<8>>) -> List<Record> {
    let matches = map::<Record, RecordMatch>(
        rrs, 
        |rr| {
            let rname = rev::<Int<8>>(rr.rname);
            let qname = rev::<Int<8>>(qname);
            RecordMatch {
                record: rr,
                len: list_cmp::<Int<8>>(rname, qname),
            }
        }
    );
    let max_match = max::<RecordMatch>(matches, |match| {match.len});
    map::<RecordMatch, Record>(
        filter::<RecordMatch>(matches, |match| { match.len == max_match }),
        |match| {match.record}
    )
}

fn get_relevant_rrs(
    query: Query,
    origin: List<Int<8>>,
    rrs: List<Record>,
) -> List<Record> {
    let relevant_rrs = filter::<Record>(rrs, |rr| {is_relevant_domain(rr, query.qname)} );
    if len(relevant_rrs) == 0 { 
        // No relevant records found
        []
    } else {
        let ns_match_rrs = filter::<Record>(relevant_rrs, |rr| {is_ns_match_record(rr, query.qname, origin)} );
        if len(ns_match_rrs) == 0 {
            let max_match_rrs = filter_max_matches(relevant_rrs, query.qname);
            let wildcard_match_rrs = filter::<Record>(max_match_rrs, |rr| {is_wild_card_match(rr, query.qname)} );
            if len(wildcard_match_rrs) == 0 {
                // return all max matched records
                max_match_rrs
            } else {
                wildcard_match_rrs
            }
        } else {
            // First matches NS records
            ns_match_rrs
        }
    }
}

// Get the glue records for `ns_records` from `zone`.
// It is assumed that all records in `zone` is really under `zone.origin`.
fn glue(zone: Zone, ns_records: List<Record>) -> List<Record> {
    let glue_records = filter::<Record>(zone.glue_rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    filter::<Record>(
        glue_records, 
        |rr| {
            // some ns want it..
            any::<Record>(
                ns_records, 
                |ns_rr| { list_eq::<Int<8>>(ns_rr.rdata, rr.rname) } 
            )
        }
    )
}

// Get the additional address records for `rrs` from `zone`.
// These only use authoriative data, excluding glue records.
fn additional(zone: Zone, rrs: List<Record>) -> List<Record> {
    let addr_records = filter::<Record>(zone.rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    filter::<Record>(
        addr_records, 
        |rr| {
            // some rr want it..
            any::<Record>(
                rrs, 
                |add_rr| { list_eq::<Int<8>>(add_rr.rdata, rr.rname) } 
            )
        }
    )
}

fn exact_match(
    relevant_rrs: List<Record>,
    query: Query,
    zone: Zone,
) -> Response {
    let ns_records = filter::<Record>(relevant_rrs, |x| {x.rtype == 2w16} );
    if all::<Record>(relevant_rrs, |x| {x.rtype != 6w16}) 
        && len(ns_records) != 0 
    {
        let glue_records = glue(zone, ns_records);
        Response {
            rcode: DnsRCode.NOERROR, 
            aa: false,
            answer: [], 
            additional: glue_records, 
            authority: ns_records,
        }
    } else {
        let ans_records = filter::<Record>(relevant_rrs, |x| {x.rtype == query.qtype} );
        if len(ans_records) != 0 {
            let qtype = query.qtype;
            if qtype == 2w16 || qtype == 15w16 || qtype == 33w16 {
                // NS, MX and SRV records trigger additional handling
                let additional = additional(zone, ans_records);
                Response {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: additional, 
                    authority: [],
                }
            } else {
                Response {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: [], 
                    authority: [],
                }
            }
        } else {
            let cname_rrs = filter::<Record>(relevant_rrs, |x| {x.rtype == 5w16} );
            if len(cname_rrs) != 0 {
                // RFC 1034 Section 3.6.2 ensures that there should only be one matching CNAME record
                let cname = cname_rrs[0];
                let target = cname.rdata;
                if query.qtype == 5w16 {
                    // No need to go further if QTYPE is CNAME
                    Response {
                        rcode: DnsRCode.NOERROR, 
                        aa: true,
                        answer: [cname], 
                        additional: [], 
                        authority: [], 
                    }
                } else {
                    let query = Query {
                        qname: target,
                        qtype: query.qtype,
                        qcount: query.qcount + 1,
                    };
                    let resp = rrlookup(zone, query);
                    // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                    // a delegation after aliasing still has `AA` set.
                    if resp.rcode == DnsRCode.SERVFAIL {
                        resp
                    } else {
                        Response {
                            rcode: resp.rcode,
                            aa: true,
                            answer: [cname] ++ resp.answer,
                            authority: resp.authority,
                            additional: resp.additional,
                        }
                    }
                }
            } else {
                let soa_records = filter::<Record>(zone.rrs, |x| {x.rtype == 6w16} );
                Response {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: [], 
                    additional: [], 
                    authority: soa_records, 
                }
            }
        }
    }
}

fn rrlookup(zone: Zone, query: Query) -> Response {
    if query.qcount >s 3 {
        // Break CNAME/DNAME loop
        Response {
            rcode: DnsRCode.SERVFAIL,
            aa: true,
            answer: [],
            authority: [],
            additional: [],
        }
    } else {
        let relevant_rrs = get_relevant_rrs(query, zone.origin, zone.rrs);
        if len(relevant_rrs) == 0 {
            let soa_records = filter::<Record>(zone.rrs, |x| {x.rtype == 6w16} );
            Response { 
                rcode: DnsRCode.NXDOMAIN, 
                aa: true,
                answer: [], 
                additional: [], 
                authority: soa_records, 
            }
        } else {
            if any::<Record>(relevant_rrs, |x| {list_eq::<Int<8>>(x.rname, query.qname)}) {
                // An exact match
                exact_match(relevant_rrs, query, zone)
            } else {
                // No exact match; try DNAME redirection first
                let dname_rrs = filter::<Record>(relevant_rrs, |rr| {rr.rtype == 39w16});
                if len(dname_rrs) != 0 {
                    // TODO: YXDOMAIN not modeled
                    let dname = dname_rrs[0];
                    let qlen = len(query.qname);
                    let rlen = len(dname.rname);
                    let new_qname = query.qname[..qlen-rlen] ++ dname.rdata;
                    let synthesized = Record {
                        rname: query.qname,
                        rtype: 5w16, // CNAME
                        rdata: new_qname,
                    };
                    if query.qtype == 5w16 {
                        // No need to follow synthesized CNAME
                        Response {
                            rcode: DnsRCode.NOERROR,
                            aa: true, 
                            answer: [dname, synthesized],
                            additional: [],
                            authority: [],
                        }
                    } else {
                        let resp = rrlookup(
                            zone,
                            Query {
                                qname: new_qname, 
                                qtype: query.qtype,
                                qcount: query.qcount + 1,
                            }
                        );
                        // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                        // a delegation after aliasing still has `AA` set.
                        if resp.rcode == DnsRCode.SERVFAIL {
                            resp
                        } else {
                            Response {
                                rcode: resp.rcode,
                                aa: true,
                                answer: [dname, synthesized] ++ resp.answer,
                                additional: resp.additional,
                                authority: resp.authority,
                            }
                        }
                    }
                    
                } else {
                    // ..then WILDCARD match
                    if any::<Record>(relevant_rrs, |rr| {is_wild_card_match(rr, query.qname)}) {
                        let rewritten_rrs = map::<Record, Record>(
                            relevant_rrs,
                            |rr| {
                                Record {
                                    rname: query.qname,
                                    rtype: rr.rtype,
                                    rdata: rr.rdata,
                                }
                            }
                        );
                        exact_match(rewritten_rrs, query, zone) 
                    } else {
                        // ..then DELEGATION
                        let ns_rrs = filter::<Record>(relevant_rrs, |x| {x.rtype == 2w16} );
                        let has_soa = any::<Record>(relevant_rrs, |x| {x.rtype == 6w16} );
                        if len(ns_rrs) != 0 && !has_soa {
                            let glue_records = glue(zone, ns_rrs);
                            Response { 
                                rcode: DnsRCode.NOERROR, 
                                aa: false,
                                answer: [], 
                                additional: glue_records, 
                                authority: ns_rrs, 
                            }
                        } else {
                            // finally check for empty non-terminals
                            let soa_records = filter::<Record>(zone.rrs, |x| {x.rtype == 6w16} );
                            if any::<Record>(zone.rrs, |rr| { is_parent(query.qname, rr.rname) }) {
                                Response {
                                    rcode: DnsRCode.NOERROR, 
                                    aa: true,
                                    answer: [],
                                    additional: [], 
                                    authority: soa_records, 
                                }
                            } else {
                                Response {
                                    rcode: DnsRCode.NXDOMAIN, 
                                    aa: true,
                                    answer: [],
                                    additional: [], 
                                    authority: soa_records, 
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
