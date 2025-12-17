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

struct Opaque { }

struct String {
    data: Ptr,
    len: Int<64>,
}

struct Slice {
    data: Ptr,
    len: Int<64>,
    cap: Int<64>,
}

use %Request.0 as struct Request {
    msg: Ptr, // &Msg
    w: ResponseWriter,
    zone: String,
    size: Int<16>,
    do: Int<8>,

    family: Int<8>,
    name: String,
    ip: String,
    port: String,
    local_port: String,
    local_ip: String,
}

use %Zone.0 as struct Zone {
    origin: String,
    orig_len: Int<64>,
    file: String,
    tree: Ptr, // &Tree
    apex: Apex,
    expired: Int<8>,

    rwmutex: RWMutex,
    start_up_once: Once,
    transfer_from: Slice,

    reload_interval: Int<64>,
    reload_shutdown: Ptr,
    upstream: Ptr,
}

use %Tree.0 as struct Tree

use %Node.0 as struct Node {
    elem: Ptr, // &Elem
    left: Ptr, // &Node
    right: Ptr, // &Node
    color: Int<8>,
}

use %Elem.0 as struct Elem {
    m: Ptr,
    name: String,
}

use %RR.0 as struct ResourceRecord {
    itab: Ptr, // &RRItab
    data: Ptr, // &Int<8>
}

use %RR_Header.0 as struct RRHeader {
    name: String,
    rrtype: Int<16>,
    class: Int<16>,
    ttl: Int<32>,
    rdlength: Int<16>,
}

// Interface table for RRs
struct RRItab {
    type: Ptr,
    header: Ptr,
    copy: Ptr,
}

use %Msg.0 as struct Msg {
    header: MsgHdr,
    compress: Int<8>,
    question: Slice,
    answer: Slice,
    ns: Slice,
    extr: Slice,
}

use %Question.0 as struct Question {
    name: String,
    qtype: Int<16>,
    qclass: Int<16>,
}

use %MsgHdr.0 as struct MsgHdr {
    id: Int<16>,
    response: Int<8>,
    opcode: Int<64>,
    authoritative: Int<8>,
    truncated: Int<8>,
    recursion_desired: Int<8>,
    recursion_available: Int<8>,
    zero: Int<8>,
    authenticated_data: Int<8>,
    checking_disabled: Int<8>,
    rcode: Int<64>,
}

use %Apex.0 as struct Apex {
    soa: Ptr,
    ns: Slice,
    sigsoa: Slice,
    signs: Slice,
}

use %ResponseWriter.0 as struct ResponseWriter
use %RWMutex.0 as struct RWMutex
use %Once.0 as struct Once

// ——————————
// String SPECs
// ——————————

fn string_spec(
    p: Ptr,
    n: Int<64>,
) -> Bool {
    specialize(n) &&
    if n == 0w64 {
        true
    } else {
        __string_spec(p, n)
    }
}

fn __string_spec(p: Ptr, n: Int<64>) -> Bool {
    let ch = p |> *Int<8>;
    ch != 92w8  // not "\"
    && if n <= 1w64 { 
        true 
    } else { 
        __string_spec(p |> Int<8>[1], n - 1w64) 
    }
}

// ——————————
// CDNS SPECs
// ——————————

// { i8*, i64 } @go.coredns.Request.Name(i8* nest nocapture readnone %nest.4, %Request.0* %r)
fn go_coredns_request_name_oracle(
    _: Ptr,
    r: Ptr,
) -> String {
    let msg = r |> Request.msg |> *Ptr;
    let question = msg |> Msg.question |> Slice.data |> *Ptr;
    question |> Question.name |> *String
}

// i64 @go.coredns.Request.Size(i8* nest nocapture readnone %nest.7, %Request.0* %r)
fn go_coredns_request_size_oracle(
    _: Ptr,
    r: Ptr,
) -> Int<64> {
    65535w64
}

// i64 go.coredns.CompareDomainName(i8* nest nocapture readnone %nest.35, i8* readonly %s1.chunk0, i64 %s1.chunk1, i8* readonly %s2.chunk0, i64 %s2.chunk1)
fn go_coredns_compare_domain_name_oracle(
    _: Ptr,
    data1: Ptr, len1: Int<64>,
    data2: Ptr, len2: Int<64>,
) -> Int<64> {
    let _ = specialize(data1);
    let _ = specialize(data2);
    let _ = specialize(len1);
    let _ = specialize(len2);

    // If either is the root label or empty, return 0
    if len1 == 0w64
        || len2 == 0w64
        || (len1 == 1w64 && data1 |> *Int<8> == 46w8) 
        || (len2 == 1w64 && data2 |> *Int<8> == 46w8) {
        0w64 
    } else {
        // CompareDomainName requires both strings to be syntactically valid;
        // part of that means they must end with a dot(.).
        // If that is not the case, this function as written returns 0.
        if data1 |> Int<8>[len1 - 1w64] |> *Int<8> != 46w8
            || data2 |> Int<8>[len2 - 1w64] |> *Int<8> != 46w8 {
            0w64
        } else {
            // Compare recursively, backwards
            __compare_domain_name(data1, len1-2w64, data2, len2-2w64)
        }
    }
}

// ..end of a label?
fn __compare_domain_name_eol(data: Ptr, i: Int<64>) -> Bool {
    i <s 0w64 || data |> Int<8>[i] |> *Int<8> == 46w8
}

fn __compare_domain_name(data1: Ptr, i1: Int<64>, data2: Ptr, i2: Int<64>) -> Int<64> {
    // Increment if both currently at the end of a label
    let inc = if __compare_domain_name_eol(data1, i1) && __compare_domain_name_eol(data2, i2) {
        1w64
    } else {
        0w64
    };

    // Stop if either overshots, or mismatches
    let stop = i1 <s 0w64
        || i2 <s 0w64
        || data1 |> Int<8>[i1] |> *Int<8> != data2 |> Int<8>[i2] |> *Int<8>;
    if stop {
        inc
    } else {
        inc + __compare_domain_name(data1, i1 - 1w64, data2, i2 - 1w64)
    }
}


// void @go.coredns.Zone.Lookup({ %IPST.0, %IPST.0, %IPST.0, i64 }* sret %sret.formal.1, i8* nest nocapture readnone %nest.2, %Zone.0* %z, i8* %ctx.chunk0, i8* %ctx.chunk1, %Request.0* byval %state, i8* %qname.chunk0, i64 %qname.chunk1)
fn go_coredns_zone_lookup_precond(
    sret: Ptr,
    _: Ptr,
    zone: Ptr,
    loop_count: Ptr,
    file: Ptr,
    state: Ptr,
    qname0: Ptr,
    qname1: Int<64>,
) -> Bool {
    specialize(loop_count)
    && specialize(qname1) // TODO: this is buggy...why?
}

// { i8*, i8 } go.coredns.Tree.Prev(i8* nest nocapture readnone %nest.10, %Tree.0* readonly %t, i8* %qname.chunk0, i64 %qname.chunk1)
fn go_coredns_tree_prev_precond(_: Ptr, tree: Ptr, data: Ptr, len: Int<64>) -> Bool {
    specialize(len)
}

// { i8*, i8 } go.coredns.Tree.Next(i8* nest nocapture readnone %nest.11, %Tree.0* readonly %t, i8* %qname.chunk0, i64 %qname.chunk1)
fn go_coredns_tree_next_precond(_: Ptr, tree: Ptr, data: Ptr, len: Int<64>) -> Bool {
    specialize(len)
}

// { i8*, i8 } go.coredns.Node.search(i8* nest nocapture readnone %nest.9, %Node.0* %n, i8* %qname.chunk0, i64 %qname.chunk1)
fn go_coredns_node_search_precond(_: Ptr, node: Ptr, data: Ptr, len: Int<64>) -> Bool {
    specialize(node)
    && specialize(len)
}

// void go.coredns.Zone.nameFromRight({ { i8*, i64 }, i8 }* nocapture sret %sret.formal.3, i8* nest nocapture readnone %nest.12, %Zone.0* readonly %z, i8* %qname.chunk0, i64 %qname.chunk1, i64 %i)
fn go_coredns_zone_name_from_right_precond(
    sret: Ptr,
    _: Ptr,
    zone: Ptr,
    data: Ptr,
    len: Int<64>,
    i: Int<64>,
) -> Bool {
    specialize(len)
    && specialize(i)
}

// { i8*, i64 } go.coredns.sprintName(i8* nest nocapture readnone %nest.60, i8* %s.chunk0, i64 %s.chunk1)
fn go_coredns_sprint_name_precond(_: Ptr, data: Ptr, len: Int<64>) -> Bool {
    specialize(len)
}


// { i8*, i64 } go.coredns.Join(i8* nest nocapture readnone %nest.42, %IPST.4* nocapture readonly byval %labels)
fn go_coredns_join_precond(_: Ptr, labels: Ptr) -> Bool {
    let len = labels |> Slice.len |> *Int<64>;
    specialize(len)
    && __go_coredns_join_precond(labels |> Slice.data |> *Ptr, 0w64, len)
}

fn __go_coredns_join_precond(p: Ptr, i: Int<64>, n: Int<64>) -> Bool {
    if i >=s n {
        true
    } else {
        let str = p |> String[i] |> *String;
        specialize(str.len)
        && __go_coredns_join_precond(p, i + 1w64, n)
    }
}

// i8 go.coredns.IsSubDomain(i8* nest nocapture readnone %nest.27, i8* readonly %parent.chunk0, i64 %parent.chunk1, i8* readonly %child.chunk0, i64 %child.chunk1)
fn go_coredns_is_subdomain_precond(_: Ptr, data1: Ptr, len1: Int<64>, data2: Ptr, len2: Int<64>) -> Bool {
    specialize(len1)
    && specialize(len2)
}

// i64 go.coredns.CountLabel(i8* nest nocapture readnone %nest.38, i8* readonly %s.chunk0, i64 %s.chunk1)
fn go_coredns_count_label_precond(_: Ptr, data: Ptr, len: Int<64>) -> Bool {
    specialize(len)
}

// i64 go.coredns.Less(i8* %nest.48, %Elem.0* %a, i8* %name.chunk0, i64 %name.chunk1)
fn go_coredns_less_precond(_: Ptr, elem: Ptr, data: Ptr, len: Int<64>) -> Bool {
    let elen = elem |> Elem.name |> String.len |> *Int<64>;
    specialize(elen)
}

// { i64, i8 } go.coredns.PrevLabel(i8* %nest.31, i8* %s.chunk0, i64 %s.chunk1, i64 %n)
fn go_coredns_prev_label_precond(_: Ptr, data: Ptr, len: Int<64>, n: Int<64>) -> Bool {
    specialize(n)
    && string_spec(data, len)
}

// { i64, i8 } go.coredns.NextLabel(i8* nest nocapture readnone %nest.32, i8* nocapture readonly %s.chunk0, i64 %s.chunk1, i64 %offset)
fn go_coredns_next_label_precond(_: Ptr, data: Ptr, len: Int<64>, offset: Int<64>) -> Bool {
    specialize(offset)
    && string_spec(data, len)
}

// i8 go.coredns.IsFqdn(i8* nest nocapture readnone %nest.57, i8* %s.chunk0, i64 %s.chunk1)
fn go_coredns_is_fqdn_precond(_: Ptr, data: Ptr, len: Int<64>) -> Bool {
    string_spec(data, len)
}

// go.coredns.doDDD( {i8*, i64, i64}* %b )
fn go_coredns_doddd_precond(b: Ptr) -> Bool {
    let data = b |> Slice.data |> *Ptr;
    let len = b |> Slice.len |> *Int<64>;
    string_spec(data, len)
}


// ——————————
// Top Level
// ——————————

use %File.0 as struct File {
    zones: Zones,
}

use %Zones.0 as struct Zones {
    z: Slice,
}

use %error.0 as struct Error
struct Sret {
    rcode: Int<64>,
    error: Error,
}

use @go.coredns.File.ServeDNS as fn coredns_rrlookup(
    Ptr, // &Sret
    Ptr, // &Int<8>
    Ptr, // &File
    Ptr, // &Int<8>
    Ptr, // &Int<8>
    Ptr, // &Int<8>
    Ptr, // &Int<8>
    Ptr, // &Msg
);

struct Verdict {
    ok: Bool,
    coredns: DnsResponse,
    model: DnsResponse,
}

fn verify_coredns(
    file: Ptr,
    request: Ptr,
) -> Verdict {

    let dns_zone = into_dns_zone(file);
    let dns_query = into_dns_query(request);
    let empty = DnsResponse {
        rcode: DnsRCode.NOERROR,
        aa: true,
        answer: [],
        authority: [],
        additional: [],
    };
    let sret: Sret = havoc;
    let sret = alloc(sret);

    if !valid_query(dns_query, dns_zone.origin) {
        // Non-valid queries are omitted
        Verdict {
            ok: true,
            coredns: empty,
            model: empty,
        }
    } else {

        // Get model's response
        let dns_resp = rrlookup(dns_zone, dns_query);

        // Get coredns's response
        let r = request |> Request.msg |> *Ptr;

        let _ = coredns_rrlookup(
            sret,
            havoc,
            file,
            null,               // ctx0: loop_count
            file,               // ctx1: file
            havoc,              // writer0
            havoc,              // writer1
            r,
        );
        let resp = into_dns_response(r);
        
        // Response equality means verification
        let ok = resp.rcode == dns_resp.rcode
        && resp.aa == dns_resp.aa
        && list_eq_by::<DnsRecord>(resp.answer, ordered(dns_resp.answer), compare_rr)
        && list_eq_by::<DnsRecord>(resp.authority, ordered(dns_resp.authority), compare_rr)
        && list_eq_by::<DnsRecord>(resp.additional, ordered(dns_resp.additional), compare_rr);

        if ok {
            Verdict {
                ok: true,
                coredns: resp,
                model: dns_resp,
            }
        } else {
            Verdict {
                ok: false,
                coredns: resp,
                model: dns_resp,
            }
        }
    }
}

// Compare two DnsRecords.
fn compare_rr(rr1: DnsRecord, rr2: DnsRecord) -> Bool {
    rr1.rtype == rr2.rtype
    && list_eq::<Int<8>>(rr1.rname, rr2.rname)
    && list_eq::<Int<8>>(rr1.rdata, rr2.rdata)
}

fn valid_query(
    query: DnsQuery,
    origin: List<Int<8>>,
) -> Bool {
    let qname = query.qname;
    let qtype = query.qtype;
    qtype != 0w16
    & qtype != 251w16
    & qtype != 252w16
    & qtype != 43w16
    & is_parent(origin, qname) 
    & fold2::<Int<8>, Int<8>, Bool>(
        qname,
        [46w8] ++ qname,
        |ok, e1, e2| { ok && !(e1 == 46w8 && e2 == 46w8) },
        true
    )
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

// Make a DnsZone from a coredns `File`
fn into_dns_zone(file: Ptr) -> DnsZone {
    let zone = file |> File.zones |> Zones.z |> Slice.data |> *Ptr |> *Ptr;

    let origin0 = zone |> Zone.origin |> String.data |> *Ptr;
    let origin1 = zone |> Zone.origin |> String.len |> *Int<64>;
    let origin = into_dns_name(origin0, origin1); 
    let soa = zone |> Zone.apex |> Apex.soa |> *Ptr;
    let ns = zone |> Zone.apex |> Apex.ns |> *Slice;
    let apex_rrs = [into_dns_record(soa)]
        ++ dns_records_from_slice(ns.data, ns.len);

    let root = zone |> Zone.tree |> *Ptr |> *Ptr; // **(zone.tree)
    let all_rrs = apex_rrs ++ into_dns_records(root);
    let cut_rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { rr.rtype == 2w16 && !list_eq::<Int<8>>(rr.rname, origin) }
    );
    let rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { !any::<DnsRecord>(cut_rrs, |ns| { is_parent(ns.rname, rr.rname) }) }
    );
    let glue_rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { any::<DnsRecord>(cut_rrs, |ns| { rr.rtype != 2w16 && is_parent(ns.rname, rr.rname) }) }
    ); // technically, we are not authoriative to cut NS rrs as well, but they are not glue
    
    let rrs = rrs ++ cut_rrs;
    let empty_rrs = fold::<DnsRecord, List<DnsRecord>>(
        rrs,
        |acc, rr| {
            let suffixes = get_suffixes(rr.rname[..len(rr.rname)-len(origin)]);
            acc ++ map::<List<Int<8>>, DnsRecord>(
                suffixes,
                |suffix| {
                    DnsRecord {
                        rname: suffix ++ origin,
                        rtype: 0w16, // EMPTY
                        rdata: [],
                    }
                }
            )
        },
        []
    );
    DnsZone {
        origin: origin,
        rrs: rrs ++ empty_rrs,
        glue_rrs: glue_rrs,
    }
}

// Make DnsQuery's from a coredns `Request`
fn into_dns_query(request: Ptr) -> DnsQuery {
    let msg = request |> Request.msg |> *Ptr;
    let _ = specialize(msg |> Msg.header |> MsgHdr.opcode |> *Int<64>);
    let _ = specialize(msg |> Msg.header |> MsgHdr.rcode |> *Int<64>);
    let question = msg |> Msg.question;
    let _ = specialize(question |> Slice.len |> *Int<64>);
    let qdata = question |> Slice.data |> *Ptr;
    let qname = qdata |> Question.name |> *String;
    let qname0 = qname.data;
    let qname1 = qname.len;
    let qname = into_dns_name(qname0, qname1);
    let qtype = qdata |> Question.qtype |> *Int<16>;
    
    DnsQuery {
        qname: qname,
        qtype: qtype,
        qcount: 0,
    }
}

// Make a DnsResponse from a coredns `Msg`
fn into_dns_response(msg: Ptr) -> DnsResponse {
    let rcode = msg |> Msg.header |> MsgHdr.rcode |> *Int<64>;
    let aa = if msg |> Msg.header |> MsgHdr.authoritative |> *Int<8> != 0w8 { true } else { false };
    let answer = dns_records_from_slice(
        msg |> Msg.answer |> Slice.data |> *Ptr,
        msg |> Msg.answer |> Slice.len |> *Int<64>,
    );
    let authority = dns_records_from_slice(
        msg |> Msg.ns |> Slice.data |> *Ptr,
        msg |> Msg.ns |> Slice.len |> *Int<64>,
    );
    let additional = dns_records_from_slice(
        msg |> Msg.extr |> Slice.data |> *Ptr,
        msg |> Msg.extr |> Slice.len |> *Int<64>,
    );

    DnsResponse {
        rcode: into_dns_rcode(rcode),
        aa: aa,
        answer: ordered(answer),
        authority: ordered(authority),
        additional: ordered(additional),
    }
}

fn into_dns_rcode(rcode: Int<64>) -> DnsRCode {
    let _ = specialize(rcode);
    if rcode == 0w64 {
        DnsRCode.NOERROR
    } else {
        if rcode == 3w64 {
            DnsRCode.NXDOMAIN
        } else {
            DnsRCode.OTHER
        }
    }
}

// Map a coredns `Node` into a list of DnsRecords (in the entire sub-tree).
fn into_dns_records(node: Ptr) -> List<DnsRecord> {
    if node == null {
        []
    } else {
        let rrslices: List<Ptr> = values(node |> Node.elem |> *Ptr |> Elem.m |> *Ptr); 
        into_dns_records(node |> Node.left |> *Ptr)
        ++
        fold::<Ptr, List<DnsRecord>>(
            rrslices,
            |acc, rrslice| { 
                let data = rrslice |> Slice.data |> *Ptr;
                let len = rrslice |> Slice.len |> *Int<64>;
                acc ++ dns_records_from_slice(data, len)
            },
            [],
        ) 
        ++
        into_dns_records(node |> Node.right |> *Ptr)
    }
}

fn dns_records_from_slice(
    data: Ptr,
    len: Int<64>,
) -> List<DnsRecord> {
    let _ = specialize(len);
    if len == 0w64 {
        []
    } else {
        let rr = into_dns_record(data |> ResourceRecord[len - 1w64] |> ResourceRecord.data |> *Ptr);
        let rest = dns_records_from_slice(data, len - 1w64);
        if rr.rtype == 41w16 {
            // Omit OPT RRs
            rest
        } else {
            [rr] ++ rest
        }
    }
}

// use %NS.0 as struct Ns {
//     header: RRHeader,
//     ns: String,
// }

// use %CNAME.0 as struct Cname {
//     header: RRHeader,
//     target: String,
// }

// use %DNAME.0 as struct Dname {
//     header: RRHeader,
//     target: String,
// }

use %MX.0 as struct Mx {
    header: RRHeader,
    preference: Int<16>,
    mx: String,
}

use %SRV.0 as struct Srv {
    header: RRHeader,
    priority: Int<16>,
    weight: Int<16>,
    port: Int<16>,
    target: String,
}

// Map a coredns `RR` into a DnsRecord.
// Operates on the fact that all `RR`s in coredns have a first field
// of type `RR_Header`, which holds the domain name and RRType as its
// first two fields.
fn into_dns_record(rr: Ptr) -> DnsRecord {
    let header = rr |> *RRHeader;
    let name = header.name;
    let rtype = header.rrtype;
    let _ = specialize(rtype);
    
    let rname = into_dns_name(name.data, name.len); // there should only be one here
    let rdata = if rtype == 2w16 {
        let ns = rr |> RRHeader[1] |> *String;
        into_dns_name(ns.data, ns.len)
    } else {
        if rtype == 15w16 {
            let target = rr |> Mx.mx |> *String;
            into_dns_name(target.data, target.len)
        } else {
            if rtype == 5w16 {
                let target = rr |> RRHeader[1] |> *String;
                into_dns_name(target.data, target.len)
            } else {
                if rtype == 39w16 {
                    let target = rr |> RRHeader[1] |> *String;
                    into_dns_name(target.data, target.len)
                } else {
                    if rtype == 33w16 {
                        let target = rr |> Srv.target |> *String;
                        into_dns_name(target.data, target.len)
                    } else {
                        []
                    }  
                }  
            }
        }
    };

    DnsRecord {
        rname: rname,
        rtype: rtype,
        rdata: rdata,
    }
} 

// Map a coredns domain name into the form of `List<Int<8>>`, which
// is the standard form used in the reference model.
fn into_dns_name(data: Ptr, len: Int<64>) -> List<Int<8>> {
    let _ = specialize(len);
    if len == 0w64 {
        []
    } else {
        into_dns_name(
            data,
            len - 1w64,
        ) ++ [data |> Int<8>[len - 1w64] |> *Int<8>]
    }
}

// ——————————
// Reference Model
// ——————————

// enum DnsRRType {
//     NONE,        0
//     SOA,         6
//     NS,          2
//     A,           1
//     AAAA,        28
//     CNAME,       5
//     DNAME,       39
//     TXT,         16
//     MX,          15
//     RRSIG,       46
//     DS,          43
//     SRV,         33
//     NSEC,        47
//     OPT,         41
//     IXFR,        251
//     AXFR,        252
//     OTHER,       
// }

enum DnsRCode {
    NOERROR,
    NXDOMAIN,
    OTHER,
}

struct DnsQuery {
    qname: List<Int<8>>,
    qtype: Int<16>, 
    qcount: Int,
}

struct DnsRecord {
    rname: List<Int<8>>,
    rtype: Int<16>,
    rdata: List<Int<8>>,
}

struct DnsZone {
    // Zone origin name.
    origin: List<Int<8>>,
    // Authoriative rrs.
    rrs: List<DnsRecord>, 
    // Glue rrs.
    glue_rrs: List<DnsRecord>,
}

struct DnsResponse {
    rcode: DnsRCode, 
    aa: Bool, 
    answer: List<DnsRecord>,
    authority: List<DnsRecord>,
    additional: List<DnsRecord>,
}

fn is_parent(rname: List<Int<8>>, qname: List<Int<8>>) -> Bool {
    let rlen = len(rname);
    let qlen = len(qname);
    rlen <=s qlen                                                // `qname` is not shorter
    && list_eq::<Int<8>>(rname, qname[qlen-rlen..])              // `rname` is a suffix of `qname`
    && (qlen == rlen || qname[qlen-rlen-1] == 46w8)              // `qname` has a dot right before that
}

fn is_wild_card_domain(rr: DnsRecord) -> Bool {
    let rname = rr.rname;
    rname[0] == 42w8
    && rname[1] == 46w8                     // `rname` starts with "*."
}

fn is_wild_card_match(rr: DnsRecord, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    let rlen = len(rname);
    let qlen = len(qname);
    rlen <=s qlen                                               // `qname` is not shorter
    && is_wild_card_domain(rr)                                  // `rr` is wildcard
    && list_eq::<Int<8>>(rname[1..], qname[qlen-rlen+1..])      // `rname`, barring the "*", is a suffix of `qname`
    && (qname[qlen-rlen] != 42w8
    || qlen >s rlen && qname[qlen-rlen-1] != 46w8)              // `qname` does not also have exactly a "*" label at the position of the wildcard  
}

fn is_relevant_domain(rr: DnsRecord, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    is_parent(rname, qname)                     // `qname` is a subdomain
    || is_wild_card_match(rr, qname)            // `qname` is wildcard match
}

fn is_ns_match_record(rr: DnsRecord, qname: List<Int<8>>, origin: List<Int<8>>) -> Bool {
    rr.rtype == 2w16                                // `rr` is NS
    && !list_eq::<Int<8>>(rr.rname, origin)         // `rr` is not the origin name
    // && is_relevant_domain(rr, qname)             // `qname` is relevant for `rr`
}

struct DnsRecordMatch {
    record: DnsRecord,
    len: Int,
}
fn filter_max_matches(rrs: List<DnsRecord>, qname: List<Int<8>>) -> List<DnsRecord> {
    let matches = map::<DnsRecord, DnsRecordMatch>(
        rrs, 
        |rr| {
            let rname = rev::<Int<8>>(rr.rname);
            let qname = rev::<Int<8>>(qname);
            DnsRecordMatch {
                record: rr,
                len: list_cmp::<Int<8>>(rname, qname),
            }
        }
    );
    let max_match = max::<DnsRecordMatch>(matches, |match| {match.len});
    map::<DnsRecordMatch, DnsRecord>(
        filter::<DnsRecordMatch>(matches, |match| { match.len == max_match }),
        |match| {match.record}
    )
}

fn get_relevant_rrs(
    query: DnsQuery,
    origin: List<Int<8>>,
    rrs: List<DnsRecord>,
) -> List<DnsRecord> {
    let relevant_rrs = filter::<DnsRecord>(rrs, |rr| {is_relevant_domain(rr, query.qname)} );
    if len(relevant_rrs) == 0 { 
        // No relevant records found
        []
    } else {
        let ns_match_rrs = filter::<DnsRecord>(relevant_rrs, |rr| {is_ns_match_record(rr, query.qname, origin)} );
        if len(ns_match_rrs) == 0 {
            let max_match_rrs = filter_max_matches(relevant_rrs, query.qname);
            let wildcard_match_rrs = filter::<DnsRecord>(max_match_rrs, |rr| {is_wild_card_match(rr, query.qname)} );
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
fn glue(zone: DnsZone, ns_records: List<DnsRecord>) -> List<DnsRecord> {
    let glue_records = filter::<DnsRecord>(zone.glue_rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    filter::<DnsRecord>(
        glue_records, 
        |rr| {
            // some ns want it..
            any::<DnsRecord>(
                ns_records, 
                |ns_rr| { list_eq::<Int<8>>(ns_rr.rdata, rr.rname) } 
            )
        }
    )
}

// Get the additional address records for `rrs` from `zone`.
// These only use authoriative data, excluding glue records.
fn additional(zone: DnsZone, rrs: List<DnsRecord>) -> List<DnsRecord> {
    let addr_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    filter::<DnsRecord>(
        addr_records, 
        |rr| {
            // some rr want it..
            any::<DnsRecord>(
                rrs, 
                |add_rr| { list_eq::<Int<8>>(add_rr.rdata, rr.rname) } 
            )
        }
    )
}

fn exact_match(
    relevant_rrs: List<DnsRecord>,
    query: DnsQuery,
    zone: DnsZone,
) -> DnsResponse {
    let ns_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 2w16} );
    if all::<DnsRecord>(relevant_rrs, |x| {x.rtype != 6w16}) 
        && len(ns_records) != 0 
    {
        let glue_records = glue(zone, ns_records);
        DnsResponse {
            rcode: DnsRCode.NOERROR, 
            aa: false,
            answer: [], 
            additional: glue_records, 
            authority: ns_records,
        }
    } else {
        let ans_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == query.qtype} );
        // CoreDNS will include the apex NS records
        let apex_ns = filter::<DnsRecord>(zone.rrs, |rr| { 
            rr.rtype == 2w16
            && list_eq::<Int<8>>(rr.rname, zone.origin)
        });
        if len(ans_records) != 0 {
            let qtype = query.qtype;
            if qtype == 2w16 || qtype == 15w16 || qtype == 33w16 {
                // NS, MX and SRV records trigger additional handling
                let additional = additional(zone, ans_records);
                let auth = if qtype == 2w16 { [] } else { apex_ns };
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: additional, 
                    authority: auth,
                }
            } else {
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: [], 
                    authority: apex_ns,
                }
            }
        } else {
            let cname_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 5w16} );
            if len(cname_rrs) != 0 {
                // RFC 1034 Section 3.6.2 ensures that there should only be one matching CNAME record
                let cname = cname_rrs[0];
                let target = cname.rdata;
                if query.qtype == 5w16 {
                    // No need to go further if QTYPE is CNAME
                    DnsResponse {
                        rcode: DnsRCode.NOERROR, 
                        aa: true,
                        answer: [cname], 
                        additional: [], 
                        authority: apex_ns, 
                    }
                } else {
                    let query = DnsQuery {
                        qname: target,
                        qtype: query.qtype,
                        qcount: query.qcount + 1,
                    };
                    let resp = rrlookup(zone, query);
                    // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                    // a delegation after aliasing still has `AA` set.
                    DnsResponse {
                        rcode: resp.rcode,
                        aa: true,
                        answer: [cname] ++ resp.answer,
                        authority: resp.authority,
                        additional: resp.additional,
                    }
                }
            } else {
                let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
                DnsResponse {
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

fn rrlookup(zone: DnsZone, query: DnsQuery) -> DnsResponse {
    // CoreDNS will include the apex NS records
    let apex_ns = filter::<DnsRecord>(zone.rrs, |rr| { 
        rr.rtype == 2w16
        && list_eq::<Int<8>>(rr.rname, zone.origin)
    });
    if query.qcount >s 3 {
        // Break CNAME/DNAME loop
        DnsResponse {
            rcode: DnsRCode.NOERROR,
            aa: true,
            answer: [],
            authority: apex_ns,
            additional: [],
        }
    } else {
        let relevant_rrs = get_relevant_rrs(query, zone.origin, zone.rrs);
        if len(relevant_rrs) == 0 {
            let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
            DnsResponse { 
                rcode: DnsRCode.NXDOMAIN, 
                aa: true,
                answer: [], 
                additional: [], 
                authority: soa_records, 
            }
        } else {
            if any::<DnsRecord>(relevant_rrs, |x| {list_eq::<Int<8>>(x.rname, query.qname)}) {
                // An exact match
                exact_match(relevant_rrs, query, zone)
            } else {
                // No exact match; try DNAME redirection first
                let dname_rrs = filter::<DnsRecord>(relevant_rrs, |rr| {rr.rtype == 39w16});
                if len(dname_rrs) != 0 {
                    // TODO: YXDOMAIN not modeled
                    let dname = dname_rrs[0];
                    let qlen = len(query.qname);
                    let rlen = len(dname.rname);
                    let new_qname = query.qname[..qlen-rlen] ++ dname.rdata;
                    let synthesized = DnsRecord {
                        rname: query.qname,
                        rtype: 5w16, // CNAME
                        rdata: new_qname,
                    };
                    if query.qtype == 5w16 {
                        // No need to follow synthesized CNAME
                        DnsResponse {
                            rcode: DnsRCode.NOERROR,
                            aa: true, 
                            answer: [dname, synthesized],
                            additional: [],
                            authority: apex_ns,
                        }
                    } else {
                        let resp = rrlookup(
                            zone,
                            DnsQuery {
                                qname: new_qname, 
                                qtype: query.qtype,
                                qcount: query.qcount + 1,
                            }
                        );
                        // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                        // a delegation after aliasing still has `AA` set.
                        DnsResponse {
                            rcode: resp.rcode,
                            aa: true,
                            answer: [dname, synthesized] ++ resp.answer,
                            additional: resp.additional,
                            authority: resp.authority,
                        }
                    }
                    
                } else {
                    // ..then WILDCARD match
                    if any::<DnsRecord>(relevant_rrs, |rr| {is_wild_card_match(rr, query.qname)}) {
                        let rewritten_rrs = map::<DnsRecord, DnsRecord>(
                            relevant_rrs,
                            |rr| {
                                DnsRecord {
                                    rname: query.qname,
                                    rtype: rr.rtype,
                                    rdata: rr.rdata,
                                }
                            }
                        );
                        exact_match(rewritten_rrs, query, zone) 
                    } else {
                        // ..then DELEGATION
                        let ns_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 2w16} );
                        let has_soa = any::<DnsRecord>(relevant_rrs, |x| {x.rtype == 6w16} );
                        if len(ns_rrs) != 0 && !has_soa {
                            let glue_records = glue(zone, ns_rrs);
                            DnsResponse { 
                                rcode: DnsRCode.NOERROR, 
                                aa: false,
                                answer: [], 
                                additional: glue_records, 
                                authority: ns_rrs, 
                            }
                        } else {
                            // finally check for empty non-terminals
                            let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
                            if any::<DnsRecord>(zone.rrs, |rr| { is_parent(query.qname, rr.rname) }) {
                                DnsResponse {
                                    rcode: DnsRCode.NOERROR, 
                                    aa: true,
                                    answer: [],
                                    additional: [], 
                                    authority: soa_records, 
                                }
                            } else {
                                DnsResponse {
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
