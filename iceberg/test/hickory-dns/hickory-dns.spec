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

struct RawVec {
    cap: Int<64>,
    ptr: Ptr,
}

struct String {
    raw_vec: RawVec,
    len: Int<64>,
}

// use %"[async fn body@hickory_server::authority::catalog::lookup<'_, hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>>::{closure#0}]" as struct LookupBody
// use %"core::task::poll::Poll<hickory_server::server::request_handler::ResponseInfo>" as struct ResponseInfo
// use %"hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>" as struct ResponseHandle
use %"core::net::socket_addr::SocketAddr" as struct SocketAddr
use %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>" as struct VecRecord

// %"hickory_proto::op::edns::Edns" = type { %"alloc::string::String", i16, i16, i8, i8, [2 x i8] }
struct Edns {
    str: String,
    i16: [Int<16>; 2],
    i8: [Int<8>; 4],
}

use %"hickory_server::store::file::authority::FileAuthority" as struct FileAuthority

struct ArcInnerFileAuthority {
    strong: Int<64>,
    weak: Int<64>,
    file_authority: FileAuthority,
}

use %"hickory_server::authority::auth_lookup::AuthLookup::Inner" as struct LookupInner

use %"hickory_proto::rr::domain::name::Name" as struct Name {
    label_data: String,
    label_ends: String,
    is_fqdn: Int<8>,
    padding: [Int<8>; 7],
}

// %"hickory_proto::rr::resource::Record" = type { %"core::option::Option<hickory_proto::rr::record_data::RData>", %"hickory_proto::rr::domain::name::Name", i32, { i16, i16 }, { i16, i16 }, [2 x i16] }
// %"core::option::Option<hickory_proto::rr::record_data::RData>" = type { i8, [143 x i8] }
struct RecordTail {
    name: Name,
    ttl: Int<32>,
    rr_type: [Int<16>; 2],
    dns_class: [Int<16>; 2],
    padding: [Int<16>; 2],
}

struct RecordAa {
    flag: Int<8>,
    a: [Int<8>; 4],
    padding: [Int<8>; 139],
    tail: RecordTail,
}

struct RecordAaaa {
    flag: [Int<8>; 2],
    aaaa: [Int<16>; 8],
    padding: [Int<8>; 126],
    tail: RecordTail,
}

// %"hickory_proto::rr::record_data::RData::ANAME" = type { [1 x i64], %"hickory_proto::rr::lower_name::LowerName" }
// ANAME, CNAME, NS
struct RecordName {
    flag: [Int<8>; 8],
    name: Name,
    padding: [Int<8>; 80],
    tail: RecordTail,
}

// %"hickory_proto::rr::record_data::RData::MX" = type { [1 x i64], %"hickory_proto::rr::rdata::mx::MX" }
// %"hickory_proto::rr::rdata::mx::MX" = type { %"hickory_proto::rr::domain::name::Name", i16, [3 x i16] }
use %"hickory_proto::rr::rdata::mx::MX" as struct Mx
struct RecordMx {
    flag: [Int<8>; 8],
    mx: Mx,
    padding: [Int<8>; 72],
    tail: RecordTail,
}

// %"hickory_proto::rr::record_data::RData::SOA" = type { [1 x i64], %"hickory_proto::rr::rdata::soa::SOA" }
// %"hickory_proto::rr::rdata::soa::SOA" = type { %"hickory_proto::rr::domain::name::Name", %"hickory_proto::rr::domain::name::Name", i32, i32, i32, i32, i32, [1 x i32] }
use %"hickory_proto::rr::rdata::soa::SOA" as struct Soa
struct RecordSoa {
    flag: [Int<8>; 8],
    soa: Soa,
    tail: RecordTail,
}

// %"hickory_proto::rr::record_data::RData::SRV" = type { [1 x i64], %"hickory_proto::rr::rdata::srv::SRV" }
// %"hickory_proto::rr::rdata::srv::SRV" = type { %"hickory_proto::rr::domain::name::Name", i16, i16, i16, [1 x i16] }
use %"hickory_proto::rr::rdata::srv::SRV" as struct Srv
struct RecordSrv {
    flag: [Int<8>; 8],
    srv: Srv,
    padding: [Int<8>; 72],
    tail: RecordTail,
}

// %"hickory_proto::rr::record_data::RData::TXT" = type { [1 x i64], { ptr, i64 } }
struct RecordTxt {
    flag: [Int<8>; 8],
    ptr: Ptr,
    i64: Int<64>,
    padding: [Int<8>; 120],
    tail: RecordTail,
}

// %"hickory_proto::rr::rr_set::RecordSet" = type { %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"hickory_proto::rr::domain::name::Name", i32, i32, { i16, i16 }, { i16, i16 } }
struct RecordSet {
    records: VecRecord,
    rrsigs: VecRecord,
    name: Name,
    ttl: Int<32>,
    serial: Int<32>,
    record_type: Int<16>,
    record_type_padding: Int<16>,
    dns_class: [Int<16>; 2],
}

// %"hickory_proto::op::query::Query" = type { %"hickory_proto::rr::domain::name::Name", { i16, i16 }, { i16, i16 } }
struct Query {
    name: Name,
    query_type: [Int<16>; 2],
    query_class: [Int<16>; 2],
}

// %"hickory_proto::op::lower_query::LowerQuery" = type { %"hickory_proto::op::query::Query", %"hickory_proto::rr::lower_name::LowerName" }
struct LowerQuery {
    original: Query,
    name: Name,
}

// %"core::mem::maybe_uninit::MaybeUninit<hickory_proto::rr::rr_key::RrKey>" = type { [8 x i64] }
struct RrKey {
    name: Name,
    record_type_and_padding: [Int<16>; 4],
}

// %"alloc::collections::btree::node::LeafNode<hickory_proto::rr::rr_key::RrKey, alloc::sync::Arc<hickory_proto::rr::rr_set::RecordSet>>" = type { [11 x %"core::mem::maybe_uninit::MaybeUninit<hickory_proto::rr::rr_key::RrKey>"], ptr, [11 x ptr], i16, i16, [2 x i16] }
struct LeafNode {
    rr_key: [RrKey; 11],
    parent: Ptr,
    record_set: [Ptr; 11],
    parent_idx_and_len_and_padding: [Int<16>; 4],
}

// %"alloc::collections::btree::node::InternalNode<hickory_proto::rr::rr_key::RrKey, alloc::sync::Arc<hickory_proto::rr::rr_set::RecordSet>>" = type { %"alloc::collections::btree::node::LeafNode<hickory_proto::rr::rr_key::RrKey, alloc::sync::Arc<hickory_proto::rr::rr_set::RecordSet>>", [12 x ptr] }
struct InternalNode {
    leaf: LeafNode,
    ptr: [Ptr; 12],
}

// type { [128 x i16], i16, [267 x i16] }
// %"futures_util::future::try_future::MapOk<futures_util::future::try_join::TryJoin3<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>>, [closure@crates/server/src/store/in_memory/authority.rs:1223:25: 1223:56]>" = type { %"core::mem::manually_drop::ManuallyDrop<futures_util::future::future::map::Map<futures_util::future::try_future::into_future::IntoFuture<futures_util::future::try_join::TryJoin3<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>>>, futures_util::fns::MapOkFn<[closure@crates/server/src/store/in_memory/authority.rs:1223:25: 1223:56]>>>" }
struct MapOk {
    ptr: [Ptr; 2],
    i16_0: [Int<16>; 124],
    ptr1: [Ptr; 2],
    i16_1: [Int<16>; 124],
    ptr2: [Ptr; 2],
    i16_2: [Int<16>; 124],
}

// %"hickory_server::authority::message_request::WireQuery" = type { { ptr, i64 }, %"hickory_proto::op::lower_query::LowerQuery" }
struct WireQuery {
    ptr: Ptr,
    i64: Int<64>,
    query: LowerQuery,
}

// use %"hickory_proto::op::header::Header" as struct Header
// %"hickory_proto::op::header::Header" = type { { i16, i16 }, i16, i16, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, i8 }
packed struct Header {
    response_code: [Int<16>; 2],
    id: Int<16>,
    packed_count: Int<64>,
    flags: [Int<8>; 8],
}

// %"hickory_server::server::request_handler::RequestInfo<'_>" = type { %"core::net::socket_addr::SocketAddr", ptr, ptr, i8, [7 x i8] }
use %"hickory_server::server::request_handler::RequestInfo<'_>" as struct RequestInfo {
    src: SocketAddr,
    header: Ptr,
    query: Ptr,
    protocol: Int<64>,
}

// %"[async block@crates/server/src/store/in_memory/authority.rs:1015:44: 1181:6]" = type { ptr, ptr, { i16, i16 }, i8, i8, [2 x i8] }
struct AuthorityLookupBlock {
    self: Ptr,
    name: Ptr,
    query_type: [Int<16>; 2],
    lookup_options: Int<8>,
    state: Int<8>,
    padding: [Int<8>; 2],
}

// %"[async block@crates/server/src/store/in_memory/authority.rs:1187:44: 1237:6]" = type { [7 x i64], ptr, %"hickory_server::server::request_handler::RequestInfo<'_>", [4 x i8], i8, i8, [794 x i8] }
// %"[async block@crates/server/src/store/in_memory/authority.rs:1187:44: 1237:6]::Suspend2" = type { %"hickory_server::server::request_handler::RequestInfo<'_>", [32 x i16], { i16, i16 }, [2 x i16], { ptr, ptr } }
// %"[async block@crates/server/src/store/in_memory/authority.rs:1187:44: 1237:6]::Suspend1" = type { %"hickory_server::server::request_handler::RequestInfo<'_>", [32 x i16], { i16, i16 }, [2 x i16], %"futures_util::future::try_future::MapOk<futures_util::future::try_join::TryJoin3<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>, core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<authority::auth_lookup::AuthLookup, authority::error::LookupError>> + core::marker::Send>>>, [closure@crates/server/src/store/in_memory/authority.rs:1223:25: 1223:56]>" }
struct AuthoritySearchBlock {
    request_info_0: RequestInfo,        // 0
    ptr0: Ptr,                          // 56
    request_info_1: RequestInfo,        // 64
    i16: [Int<16>; 2],                  // 120
    i8: [Int<8>; 4],                    // 124
    map_ok: MapOk,                      // 128
}

// %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]" = type { [4 x i64], { ptr, ptr }, { ptr, ptr }, [2 x i64], ptr, ptr, i16, [5 x i8], i8, i8, [39 x i8] }
// %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]::Suspend0" = type { { ptr, ptr }, [6 x i64], ptr, ptr, [9 x i16], i16, i8, [11 x i8], { ptr, ptr } }
// %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]::Suspend1" = type { [2 x i64], { ptr, ptr }, [70 x i8], i8, [9 x i8], { ptr, ptr } }
// %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]::Suspend2" = type { { ptr, ptr }, { ptr, ptr }, [33 x i16], i16, i8, [1 x i8], i8, [9 x i8], { ptr, ptr } }
// %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]::Suspend3" = type { [2 x i64], { ptr, ptr }, [33 x i16], i16, i8, i8, i8, [9 x i8], { ptr, ptr }, { ptr, ptr } }
struct SendAuthRespBody {       // size=144
    ptr0: [Ptr; 12],            // 0
    i16_0: Int<16>,             // 96
    i16_1: Int<16>,             // 98
    unknown: [Int<8>; 12],      // 100
    ptr1: [Ptr; 4],             // 112
}

// %"[async fn body@hickory_server::authority::catalog::build_response::{closure#0}]" = type { { ptr, ptr }, ptr, [1 x i64], ptr, ptr, %"hickory_server::server::request_handler::RequestInfo<'_>", i16, [26 x i8], i8, [147 x i8] }
// %"[async fn body@hickory_server::authority::catalog::build_response::{closure#0}]::Suspend0" = type { [3 x i64], ptr, [37 x i16], i16, %"hickory_proto::op::header::Header", i8, i8, [4 x i8], %"[async fn body@hickory_server::authority::catalog::send_authoritative_response<core::pin::Pin<alloc::boxed::Box<dyn core::future::future::Future<Output = core::result::Result<alloc::boxed::Box<dyn hickory_server::authority::authority_object::LookupObject>, hickory_server::authority::error::LookupError>> + core::marker::Send>>>::{closure#0}]" }
packed struct BuildResponseBody {           // size=280
    ptr0: Ptr,                              // 0
    ptr1: Ptr,                              // 8
    ptr2: Ptr,                              // 16
    ptr3: Ptr,                              // 24
    ptr4: Ptr,                              // 32
    ptr5: Ptr,                              // 40
    request_info: RequestInfo,              // 48
    i16_0: Int<16>,                         // 104
    i16_1: Int<16>,                         // 106
    header: Header,                         // 108
    i8_0: Int<8>,                           // 130
    i8_1: Int<8>,                           // 131
    state: Int<8>,                          // 132
    padding: [Int<8>; 3],                   
    send_auth_resp_body: SendAuthRespBody   // 136
}

// %"hickory_server::authority::message_request::MessageRequest" = type { %"core::option::Option<hickory_proto::op::edns::Edns>", %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"alloc::vec::Vec<prefix_trie::map::Node<ipnet::ipnet::Ipv4Net, ()>>", %"hickory_server::authority::message_request::WireQuery", %"hickory_proto::op::header::Header", [1 x i16] }
struct MessageRequest {
    edns: Edns,

    // unverified order
    answers: VecRecord,
    name_servers: VecRecord,
    additionals: VecRecord,
    sig0: VecRecord,

    query: WireQuery,
    header: Header,

    padding: [Int<16>; 1],
}

// %"hickory_server::server::request_handler::Request" = type { %"hickory_server::authority::message_request::MessageRequest", %"core::net::socket_addr::SocketAddr", i8, [7 x i8] }
struct Request {
    message: MessageRequest,
    src: SocketAddr,
    protocol: Int<8>,
    padding: [Int<8>; 7],
}

// %"[async block@<alloc::sync::Arc<hickory_server::store::file::authority::FileAuthority> as hickory_server::authority::authority_object::AuthorityObject>::search<'_, '_, '_>::{closure#0}]" = type { [9 x i64], ptr, %"hickory_server::server::request_handler::RequestInfo<'_>", i8, i8, [6 x i8] }
// %"[async block@<alloc::sync::Arc<hickory_server::store::file::authority::FileAuthority> as hickory_server::authority::authority_object::AuthorityObject>::search<'_, '_, '_>::{closure#0}]::Suspend0" = type { { ptr, ptr }, %"hickory_server::server::request_handler::RequestInfo<'_>", [9 x i64] }
struct FileAuthoritySearchBlock {
    ptr0: Ptr,                      // 0
    ptr1: Ptr,                      // 8
    request_info_0: RequestInfo,    // 16
    ptr2: Ptr,                      // 72
    request_info_1: RequestInfo,    // 80
    padding: [Int<8>; 8],           // 136
}

// Body of lookup is union actually.
// %"[async fn body@hickory_server::authority::catalog::lookup<'_, hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>>::{closure#0}]" = type { %"core::option::Option<hickory_proto::op::edns::Edns>", [38 x i64], { ptr, ptr }, %"hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>", [1 x i64], ptr, %"hickory_server::server::request_handler::RequestInfo<'_>", [1 x i8], i8, [1006 x i8] }
// %"[async fn body@hickory_server::authority::catalog::lookup<'_, hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>>::{closure#0}]::Suspend0" = type { [4 x i64], %"core::option::Option<hickory_proto::op::edns::Edns>", %"hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>", [36 x i64], ptr, [9 x i64], %"[async fn body@hickory_server::authority::catalog::build_response::{closure#0}]" }
// %"[async fn body@hickory_server::authority::catalog::lookup<'_, hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>>::{closure#0}]::Suspend1" = type { [4 x i64], %"core::option::Option<hickory_proto::op::edns::Edns>", %"hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>", [360 x i8], i8, [7 x i8], %"[async fn body@hickory_server::authority::catalog::send_response<'_, hickory_server::server::server_future::ReportingResponseHandler<hickory_server::server::response_handler::ResponseHandle>, alloc::boxed::Box<dyn core::iter::traits::iterator::Iterator<Item = &hickory_proto::rr::resource::Record> + core::marker::Send>, alloc::boxed::Box<dyn core::iter::traits::iterator::Iterator<Item = &hickory_proto::rr::resource::Record> + core::marker::Send>, alloc::boxed::Box<dyn core::iter::traits::iterator::Iterator<Item = &hickory_proto::rr::resource::Record> + core::marker::Send>, alloc::boxed::Box<dyn core::iter::traits::iterator::Iterator<Item = &hickory_proto::rr::resource::Record> + core::marker::Send>>::{closure#0}]", %"hickory_server::authority::catalog::LookupSections" }
// struct LookupBody {
//     edns_arg: Edns,                         // 0
//     edns: Edns,                             // 32
//     response_handle: ResponseHandle,        // 64
//     authority_arg: Ptr,                     // 336
//     vtable_arg: Ptr,             
//     response_handle_arg: ResponseHandle,    // 352
//     request: Ptr,                           // 624
//     request_arg: Ptr,                       // 632
//     request_info: RequestInfo,              // 640
//     unknown: Int<8>,                        // 696
//     state: Int<8>,
//     padding: [Int<8>; 6], 
//     build_response_body: BuildResponseBody  // 704
// }

// ——————————
// Hickory-dns SPECs
// ——————————

fn name_precond(name: Ptr) -> Bool {
    let ends = name |> Name.label_ends |> RawVec.ptr |> *Ptr;
    let label_ends_len = name |> Name.label_ends |> String.len |> *Int<64>;
    specialize(name |> Name.label_data |> String.len |> *Int<64>)
    && specialize(label_ends_len)
    && specialize(ends |> *Int<8>)
    && (label_ends_len <=s 1w64 || specialize(ends |> Int<8>[1] |> *Int<8>))
    && (label_ends_len <=s 2w64 || specialize(ends |> Int<8>[2] |> *Int<8>))
    && (label_ends_len <=s 3w64 || specialize(ends |> Int<8>[3] |> *Int<8>))
}

fn record_type_precond(record_type: Int<16>) -> Bool {
    // index: 0, 1,    8,     9,     12,    16, 17,    18, 22,   23,         25,  27,  28,  29,  30,    32,   34
    // type:  A, AAAA, CNAME, CSYNC, HINFO, MX, NAPTR, NS, NULL, OPENPGPKEY, PTR, SIG, SOA, SRV, SSHFP, TLSA, TXT
    record_type == 0w16
    || record_type == 1w16
    || record_type == 8w16
    || record_type == 16w16
    || record_type == 18w16
    || record_type == 28w16
    || record_type == 34w16
}

// fn catalog_lookup_precond(response_info: Ptr, lookup_body: Ptr, cx: Ptr) -> Bool {
//     let state = lookup_body |> LookupBody.state |> *Int<8>;
//     specialize(state)
// }
fn build_response_precond(ret: Ptr, build_response_body: Ptr, cx: Ptr) -> Bool {
    let state = build_response_body |> BuildResponseBody.state |> *Int<8>;
    let lower_query = build_response_body |> BuildResponseBody.request_info |> RequestInfo.query |> *Ptr;
    let query_type = lower_query |> LowerQuery.original |> Query.query_type |> *Int<16>;
    let edns_ptr = build_response_body |> BuildResponseBody.ptr2 |> *Ptr;

    record_type_precond(query_type) 
    && specialize(state)
    && specialize(edns_ptr)
}

fn authority_object_ns_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    let state = block |> Int<8>[24] |> *Int<8>;
    specialize(state)
}

fn authority_object_search_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    let state = block |> Int<8>[136] |> *Int<8>;
    let lookup_options = block |> Int<8>[137] |> *Int<8>;
    specialize(state)
    && specialize(lookup_options)
}

fn authority_object_lookup_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    let state = block |> Int<8>[36] |> *Int<8>;
    let lookup_options = block |> Int<8>[37] |> *Int<8>;
    specialize(state)
    && specialize(lookup_options)
}

fn authority_search_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {  
    let flag = block |> AuthoritySearchBlock.i8 |> *Int<8>;
    let lower_query = block |> AuthoritySearchBlock.request_info_1 |> RequestInfo.query |> *Ptr;
    let query_type = lower_query |> LowerQuery.original |> Query.query_type |> *Int<16>;
    record_type_precond(query_type) 
    && specialize(flag)
    // && specialize(block)
}

fn authority_lookup_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    let self = block |> AuthorityLookupBlock.self |> *Ptr;
    let name = block |> AuthorityLookupBlock.name |> *Ptr;
    let query_type = block |> AuthorityLookupBlock.query_type |> *Int<16>;
    let lookup_options = block |> AuthorityLookupBlock.lookup_options |> *Int<8>;
    let state = block |> AuthorityLookupBlock.state |> *Int<8>;

    record_type_precond(query_type)
    && name_precond(name)
    // && specialize(block)
    // && specialize(self)
    && specialize(lookup_options)
    && specialize(state)
}

fn authority_inner_lookup_precond(self: Ptr, name: Ptr, record_type: Int<16>, _: Int<16>) -> Bool {
    record_type_precond(record_type)
    && name_precond(name)
    // && specialize(self)
    // && specialize(name |> Name.label_ends |> RawVec.ptr |> *Ptr |> *Int<8>)
}

fn maybe_next_name_precond(ret: Ptr, record_set: Ptr, qtype: Int<16>) -> Bool {
    let rtype = record_set |> RecordSet.record_type |> *Int<16>;
    specialize(rtype)
    && record_type_precond(qtype)
}

fn authority_additional_search_precond(ret: Ptr, self: Ptr, original_name: Ptr, original_query_type: Int<16>, _: Int<16>, next_name: Ptr) -> Bool {
    record_type_precond(original_query_type)
    && name_precond(original_name)
    && name_precond(next_name)
    // && specialize(self)
}

fn rr_key_cmp_precond(self: Ptr, other: Ptr) -> Bool {
    name_precond(self) && name_precond(other)
}

fn file_authority_lookup_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    let state = block |> Int<8>[36] |> *Int<8>;
    specialize(state)
}

fn file_authority_search_precond(ret: Ptr, block: Ptr, cx: Ptr) -> Bool {
    // specialize(block)
    true
}

fn drop_vec_recordset_precond(vec: Ptr) -> Bool {
    let len = vec |> String.len |> *Int<64>;
    let ptr = vec |> RawVec.ptr |> *Ptr;
    let cap = vec |> RawVec.cap |> *Int<64>;

    specialize(vec)
    && specialize(cap) 
    && specialize(ptr)
    && specialize(len)
}

fn drop_in_memory_authority_precond(ptr: Ptr) -> Bool {
    let flag = ptr |> Int<8>[124] |> *Int<8>;
    specialize(ptr)
    && specialize(flag)
}

fn take_additionals_precond(self: Ptr) -> Bool {
    specialize(self |> Int<16>[128] |> *Int<16>)
    && specialize(self |> Int<8>[80] |> *Int<16>)
}

fn drop_lookup_object_precond(self: Ptr) -> Bool {
    specialize(self |> Int<8>[103] |> *Int<8>)
}

fn into_wildcard_precond(ret: Ptr, name: Ptr) -> Bool {
    name_precond(name)
    // && specialize(name |> Name.label_ends |> RawVec.ptr |> *Ptr |> *Int<8>)
    // && specialize(name |> Name.label_ends |> RawVec.ptr |> *Ptr)
}

fn zone_of_precond(self: Ptr, other: Ptr) -> Bool {
    name_precond(self)
    && name_precond(other)
}

fn name_cmp_precond(self: Ptr, other: Ptr) -> Bool {
    name_precond(self)
    && name_precond(other)
    && specialize(self)
    && specialize(other)
}

fn record_with_precond(self: Ptr, name: Ptr, record_type: Int<16>, record_type_padding: Int<16>, ttl: Int<32>) -> Bool {
    name_precond(name)
}

fn insert_record_precond(self: Ptr, record: Ptr) -> Bool {
    specialize(self |> RecordSet.records |> String.len |> *Int<64>)
    && specialize(self |> RecordSet.rrsigs |> String.len |> *Int<64>)
}

fn drop_raw_vec_precond(self: Ptr) -> Bool {
    specialize(self |> *Int<64>)
}

fn drop_rdata_precond(self: Ptr) -> Bool {
    specialize(self |> *Int<8>)
}

fn drop_error_precond(self: Ptr) -> Bool {
    specialize(self |> *Ptr)
}

struct Zip {
    end0: Ptr,
    begin0: Ptr,
    end1: Ptr,
    begin1: Ptr,
    index: Int<64>,
    len: Int<64>,
    a_len: Int<64>,
}

struct StringBuf {
    buf: [Int<8>; 128],
}


struct NameBuf {
    names: [Name; 8],
}

struct RecordSetBuf {
    record_sets: [RecordSet; 4],
}

fn __alloc_string(string: Ptr) {
    let str: StringBuf = havoc;
    let ptr = alloc(str);

    let _ = store(string |> String.raw_vec |> RawVec.cap, 128w64);
    let _ = store(string |> String.raw_vec |> RawVec.ptr, ptr);
    let _ = store(string |> String.len, 0w64);

    none
}

fn __len(end: Ptr, begin: Ptr) -> Int<64> {
    if begin == end {
        0w64
    } else {
        1w64 + __len(end, begin |> Int<8>[1])
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

fn __cmp(self: Ptr, other: Ptr, len: Int<64>) -> Bool {
    if len == 0w64 {
        true
    } else {
        if self |> *Int<8> == other |> *Int<8> {
            __cmp(self |> Int<8>[1], other |> Int<8>[1], len - 1w64)
        } else {
            false
        }
    }
}

fn vec_default(vec: Ptr) {
    let _ = store(vec |> String.raw_vec |> RawVec.cap, 0w64);
    let _ = store(vec |> String.raw_vec |> RawVec.ptr, 0w64);
    let _ = store(vec |> String.len, 0w64);
    none
}

fn alloc_raw_vec(cap: Int<64>, b: Bool) -> RawVec {
    let str: StringBuf = havoc;
    let ptr = alloc(str);

    RawVec {
        cap: cap,
        ptr: ptr
    }
}

fn label_from_raw_bytes(ret: Ptr, bytes_ptr: Ptr, bytes_len: Int<64>) {
    let _ = specialize(bytes_len);
    // let _ = debug(bytes_len);
    
    let _ = bytes_len > 0w64 || panic("empty bytes");
    let _ = bytes_len <= 63w64 || panic("bytes too long");

    let str: StringBuf = havoc;
    let ptr = alloc(str);

    let _ = __memcpy(ptr, bytes_ptr, bytes_len);

    let _ = store(ret |> String.raw_vec |> RawVec.cap, 128w64);
    let _ = store(ret |> String.raw_vec |> RawVec.ptr, ptr);
    let _ = store(ret |> String.len, bytes_len);

    none
}

fn zip_new(ret: Ptr, end0: Ptr, begin0: Ptr, end1: Ptr, begin1: Ptr) {
    let a_len = __len(end0, begin0);
    let b_len = __len(end1, begin1);
    let _ = (a_len >=s 0w64 && b_len >=s 0w64) || panic("negative len");
    let len = if a_len <= b_len {
        a_len
    } else {
        b_len
    };

    let _ = store(ret |> Zip.end0, end0);
    let _ = store(ret |> Zip.begin0, begin0);
    let _ = store(ret |> Zip.end1, end1);
    let _ = store(ret |> Zip.begin1, begin1);
    let _ = store(ret |> Zip.index, 0w64);
    let _ = store(ret |> Zip.len, len);
    let _ = store(ret |> Zip.a_len, a_len);
    none
}

fn drop_string(string: Ptr) {
    let str = string |> RawVec.ptr |> *Ptr;
    let _ = free(str);
    none
}

fn drop_vec_usize(vec: Ptr) {
    // TODO: 
    // let _ = debug(vec);
    // let _ = debug(vec |> RawVec.ptr |> *Ptr);
    none
}

fn realloc_string(string: Ptr, len: Int<64>) {
    let ty_align = string |> String.raw_vec |> RawVec.ptr |> *Ptr as Int<64>;
    let _ = (ty_align == 1w64 && len <= 128w64) || panic("not a string");

    __alloc_string(string)
}

fn alloc_string(string: Ptr, len: Int<64>) {
    __alloc_string(string)
}

fn alloc_string_from_iter(string: Ptr, end: Ptr, begin: Ptr) {
    let _ = __alloc_string(string);

    let len = __len(end, begin);
    let _ = store(string |> String.len, len);

    none
}

fn extend_from_slice(string: Ptr, bytes_ptr: Ptr, bytes_len: Int<64>) {
    let _ = specialize(bytes_len);

    let len = string |> String.len |> *Int<64>;
    let dst = string |> String.raw_vec |> RawVec.ptr |> *Ptr |> Int<8>[len];

    let _ = store(string |> String.len, len + bytes_len);
    __memcpy(dst, bytes_ptr, bytes_len)
}

fn vec_clone(ret: Ptr, self: Ptr) {
    let _ = specialize(self |> String.len |> *Int<64>);
    let _ = __alloc_string(ret);
    let _ = store(ret |> String.len, self |> String.len |> *Int<64>);
    __memcpy(ret |> String.raw_vec |> RawVec.ptr |> *Ptr, self |> String.raw_vec |> RawVec.ptr |> *Ptr, self |> String.len |> *Int<64>)
}

fn realloc_vec_name(self: Ptr, len: Int<64>) {
    let ty_align = self |> RawVec.ptr |> *Ptr as Int<64>;

    let _ = specialize(ty_align) && specialize(len);

    // let _ = if ty_align == 8w64 && len <= 8w64 {
    //     none
    // } else {
    //     let _ = debug(ty_align);
    //     let _ = debug(len);
    //     none
    // };

    let _ = (ty_align == 8w64 && len <= 8w64) || panic("allocated vec_name already");

    let names: NameBuf = havoc;
    let ptr = alloc(names);

    let _ = store(self |> RawVec.cap, 8w64);
    let _ = store(self |> RawVec.ptr, ptr);

    none
}

fn realloc_vec_record_set(self: Ptr, len: Int<64>) {
    let ty_align = self |> RawVec.ptr |> *Ptr as Int<64>;

    // let _ = if ty_align == 8w64 && len <= 4w64 {
    //     none
    // } else {
    //     let _ = debug(ty_align);
    //     let _ = debug(len);
    //     none
    // };

    let _ = (ty_align == 8w64 && len <= 4w64) || panic("allocated vec_record_set already");

    let record_sets: RecordSetBuf = havoc;
    let ptr = alloc(record_sets);

    let _ = store(self |> RawVec.cap, 4w64);
    let _ = store(self |> RawVec.ptr, ptr);

    none
}

use @"_ZN4core3ptr58drop_in_place$LT$hickory_proto..rr..domain..name..Name$GT$17hbede5dad8a6709f9E" as fn drop_name(Ptr);
fn __drop_name(ptr: Ptr, len: Int<64>) {
    if len == 0w64 {
        none
    } else {
        let _ = drop_name(ptr);
        __drop_name(ptr |> Name[1], len - 1w64)
    }
}
fn drop_vec_name(vec: Ptr) {
    let len = vec |> String.len |> *Int<64>;
    let ptr = vec |> RawVec.ptr |> *Ptr;

    let _ = specialize(len);

    if (len == 0w64) {
        none
    } else {
        let _ = __drop_name(ptr, len);
        let _ = free(ptr);
        none
    }
}

fn convert_ptr(ptr: Ptr) -> Ptr {
    ptr
}

fn cmp_u8_slice(self: Ptr, len1: Int<64>, other: Ptr, len2: Int<64>) -> Bool {
    let _ = specialize(len1) && specialize(len2);
    if len1 != len2 {
        false
    } else {
        __cmp(self, other, len1)
    }
}

fn alloc_record(record_type: Int<16>) -> Ptr {
    let _ = specialize(record_type);
    let _ = record_type_precond(record_type) || panic("unreachable record_type");

    if record_type == 0w16 {
        let a: RecordAa = havoc;
        alloc(a)
    } else { if record_type == 1w16 {
        let aaaa: RecordAaaa = havoc;
        alloc(aaaa)
    } else { if record_type == 34w16 {
        let txt: RecordTxt = havoc;
        alloc(txt)
    } else { if record_type == 28w16 {
        let soa: RecordSoa = havoc;
        alloc(soa)
    } else { if record_type == 8w16 || record_type == 18w16 {
        let name: RecordName = havoc;
        alloc(name)
    } else { if record_type == 29w16 {
    	let srv: RecordSrv = havoc;
    	alloc(srv)
    } else {
        let _ = record_type == 16w16 || panic("unreachable record_type");
        let mx: RecordMx = havoc;
        alloc(mx)
    }}}}}}
}

fn rdata_clone(dst: Ptr, src: Ptr, record_type: Int<16>) {
    let _ = specialize(record_type);
    let _ = record_type_precond(record_type) || panic("unreachable record_type");

    if record_type == 0w16 {
        let _ = __memcpy(dst, src, 5w64);
        none
    } else { if record_type == 1w16 {
        let _ = __memcpy(dst, src, 2w64);
        none
    } else { if record_type == 34w16 {
        let _ = __memcpy(dst, src, 8w64);
        let _ = store(dst |> Int<8>[8], src |> Int<8>[8] |> *Ptr);
        let _ = store(dst |> Int<8>[16], src |> Int<8>[16] |> *Int<64>);
        none
    } else { if record_type == 28w16 {
        let _ = __memcpy(dst, src, 8w64);
        let _ = name_clone(dst |> Int<8>[8], src |> Int<8>[8]);
        let _ = name_clone(dst |> Int<8>[64], src |> Int<8>[64]);
        let _ = store(dst |> Int<8>[120], src |> Int<8>[120] |> *Int<32>);
        let _ = store(dst |> Int<8>[124], src |> Int<8>[124] |> *Int<32>);
        let _ = store(dst |> Int<8>[128], src |> Int<8>[128] |> *Int<32>);
        let _ = store(dst |> Int<8>[132], src |> Int<8>[132] |> *Int<32>);
        let _ = store(dst |> Int<8>[136], src |> Int<8>[136] |> *Int<32>);
        let _ = store(dst |> Int<8>[140], src |> Int<8>[140] |> *Int<32>);
        none
    } else { if record_type == 8w16 || record_type == 18w16 {
        let _ = __memcpy(dst, src, 8w64);
        let _ = name_clone(dst |> Int<8>[8], src |> Int<8>[8]);
        none
    } else {
        let _ = record_type == 16w16 || panic("unreachable record_type");
        let _ = __memcpy(dst, src, 8w64);
        let _ = name_clone(dst |> Int<8>[8], src |> Int<8>[8]);
        let _ = store(dst |> Int<8>[64], src |> Int<8>[64] |> *Int<16>);
        let _ = store(dst |> Int<8>[66], src |> Int<8>[66] |> *Int<16>);
        let _ = store(dst |> Int<8>[68], src |> Int<8>[68] |> *Int<16>);
        let _ = store(dst |> Int<8>[70], src |> Int<8>[70] |> *Int<16>);
        none
    }}}}}
}

fn name_clone(cloned_name: Ptr, name: Ptr) {
    let _ = name_precond(name);

    let label_data_len = name |> Name.label_data |> String.len |> *Int<64>;
    let label_ends_len = name |> Name.label_ends |> String.len |> *Int<64>;

    let _ = __alloc_string(cloned_name |> Name.label_data);
    let _ = __alloc_string(cloned_name |> Name.label_ends);

    let _ = store(cloned_name |> Name.label_data |> String.len, label_data_len);
    let _ = store(cloned_name |> Name.label_ends |> String.len, label_ends_len);
    let _ = store(cloned_name |> Name.is_fqdn, name |> Name.is_fqdn |> *Int<8>);
    
    let _ = __memcpy(cloned_name |> Name.label_data |> RawVec.ptr |> *Ptr, name |> Name.label_data |> RawVec.ptr |> *Ptr, label_data_len);
    let _ = __memcpy(cloned_name |> Name.label_ends |> RawVec.ptr |> *Ptr, name |> Name.label_ends |> RawVec.ptr |> *Ptr, label_ends_len);

    none
}

use @_ZN13hickory_proto2rr8resource6Record4with17hac3c60b6892ac85dE as fn record_with(Ptr, Ptr, Int<16>, Int<16>, Int<32>);
use @_ZN13hickory_proto2rr6rr_set9RecordSet10insert_ref17h3589b6fd63d06fa3E as fn insert_record(Ptr, Ptr);
fn add_rdata(self: Ptr, rdata: Ptr) {
    let name = self |> RecordSet.name;
    let _ = name_precond(name);

    let label_data_len = name |> Name.label_data |> String.len |> *Int<64>;
    let label_ends_len = name |> Name.label_ends |> String.len |> *Int<64>;

    let cloned_name: Name = havoc;
    let cloned_name = alloc(cloned_name);
    let _ = name_clone(cloned_name, name);

    let record_type = self |> RecordSet.record_type |> *Int<16>;
    let record_type_padding = self |> RecordSet.record_type_padding |> *Int<16>;
    let ttl = self |> RecordSet.ttl |> *Int<32>;

    let record = alloc_record(record_type);
    let _ = record_with(record, cloned_name, record_type, record_type_padding, ttl);

    let _ = rdata_clone(record, rdata, record_type);
    insert_record(self, record)
}

fn replace_record(self: Ptr, record: Ptr, to_replace: Ptr) -> Bool {
    let len = to_replace |> String.len |> *Int<64>;
    let _ = specialize(len);
    let _ = len == 0w64 || panic("unimplement to_replace");

    // TODO:
    let replaced = false;

    if replaced {
        true
    } else {
        let _ = store(self |> RecordSet.ttl, record |> RecordAa.tail |> RecordTail.ttl |> *Int<32>);
        let _ = store(self |> RecordSet.serial, 0w32);

        let record_len = self |> RecordSet.records |> String.len;
        let _ = record_len |> *Int<64> == 0w64 || panic("unimplement push");
        
        let _ = store(self |> RecordSet.records |> RawVec.cap, 1w64);
        let _ = store(self |> RecordSet.records |> RawVec.ptr, record);
        let _ = store(record_len, 1w64);

        true
    }
}

// ——————————
// Top Level
// ——————————

use @_ZN14hickory_server9authority7catalog14build_response17h2c6e61a1d5dd38a3E as fn build_response_setup(Ptr, Ptr, Ptr, Ptr, Int<16>, Ptr, Ptr, Ptr);
use @"_ZN14hickory_server9authority7catalog14build_response28_$u7b$$u7b$closure$u7d$$u7d$17heee809c70942ce10E" as fn hickory_dns_rrlookup(Ptr, Ptr, Ptr);

struct Verdict {
    ok: Bool,
    hdns: DnsResponse,
    model: DnsResponse,
}

// %"core::task::poll::Poll<(hickory_proto::op::header::Header, hickory_server::authority::catalog::LookupSections)>" = type { i16, [43 x i16] }
packed struct ResponseRet {
    header: Header,
    padding: Int<16>,
    ptr: [Ptr; 8],
}

fn verify_hickory_dns(
    request_info: Ptr,
    authority: Ptr,
    vtable: Ptr,
    request: Ptr,
    additional_vtable: Ptr,
) -> Verdict {
    let build_response_body: BuildResponseBody = havoc;
    let build_response_body = alloc(build_response_body);

    let header = request_info |> RequestInfo.header |> *Ptr;
    let query = request_info |> RequestInfo.query |> *Ptr;

    let _ = build_response_setup(
        build_response_body,
        authority,
        vtable,
        request_info,
        0w16,
        header,
        query,
        null,
    );

    let lower_query = build_response_body |> BuildResponseBody.request_info |> RequestInfo.query |> *Ptr;
    let query_name_ptr = lower_query |> LowerQuery.name;
    let query_type_ptr = lower_query |> LowerQuery.original |> Query.query_type;
    let query_type = query_type_ptr |> *Int<16>;

    let origin = authority |> *Ptr |> Int<8>[88];

    let ret: ResponseRet = havoc;
    let ret = alloc(ret);

    let empty = DnsResponse {
        rcode: DnsRCode.NOERROR,
        aa: true,
        answer: [],
        authority: [],
        additional: [],
    };

    let dns_zone = into_dns_zone(origin);
    let dns_query = into_dns_query(query_name_ptr, query_type);

    let query_data_ptr = query_name_ptr |> Name.label_data |> RawVec.ptr |> *Ptr;
    let query_data_len = query_name_ptr |> Name.label_data |> String.len |> *Int<64>;
    let is_parent = find_parent(origin, query_name_ptr);
    let is_valid_data = valid_data(query_data_ptr, query_data_len);

    if is_valid_data && is_parent && record_type_precond(query_type) {
        // Get model's response
        let resp = rrlookup(dns_zone, dns_query);

        // Get hickory's response
        let _ = hickory_dns_rrlookup(
            ret,
            build_response_body,
            havoc,
        );

        let impl_resp = into_dns_response(ret, additional_vtable);

        let ok = impl_resp.rcode == resp.rcode
        && impl_resp.aa == resp.aa
        && list_eq_by::<DnsRecord>(ordered(impl_resp.answer), ordered(resp.answer), compare_rr)
        && list_eq_by::<DnsRecord>(ordered(impl_resp.authority), ordered(resp.authority), compare_rr)
        && list_eq_by::<DnsRecord>(ordered(impl_resp.additional), ordered(resp.additional), compare_rr);

        // let ok = list_eq_by::<DnsRecord>(ordered(impl_resp.answer), ordered(resp.answer), compare_rr)
        // && list_eq_by::<DnsRecord>(ordered(impl_resp.authority), ordered(resp.authority), compare_rr)
        // && list_eq_by::<DnsRecord>(ordered(impl_resp.additional), ordered(resp.additional), compare_rr);

        if ok {
            Verdict {
                ok: true,
                hdns: impl_resp,
                model: resp,
            }
        } else {
            Verdict {
                ok: false,
                hdns: impl_resp,
                model: resp,
            }
        }
    } else {
        Verdict {
            ok: true,
            hdns: empty,
            model: empty,
        }
    }
}

fn valid_data(data: Ptr, len: Int<64>) -> Bool {
    if len == 0w64 {
        true
    } else {
        if data |> *Int<8> == 46w8 {
            false
        } else {
            valid_data(data |> Int<8>[1], len-1w64)
        }
    }
}

fn string_compare(self: Ptr, other: Ptr, len: Int<64>, bias: Int<8>) -> Bool {
    if len == 0w64 {
        true
    } else {
        if self |> *Int<8> + bias == other |> *Int<8> {
            string_compare(self |> Int<8>[1], other |> Int<8>[1], len-1w64, bias)
        } else {
            false
        }
    }
}

fn find_parent(parent: Ptr, name: Ptr) -> Bool {
    let parent_labels = parent |> Name.label_ends |> String.len |> *Int<64>;
    let name_labels = name |> Name.label_ends |> String.len |> *Int<64>;
    let label_ofs = name_labels - parent_labels;

    let parent_chars = parent |> Name.label_data |> String.len |> *Int<64>;
    let name_chars = name |> Name.label_data |> String.len |> *Int<64>;
    let _ = specialize(name_chars);
    let char_ofs = name_chars - parent_chars;

    let parent_label_ends = parent |> Name.label_ends |> RawVec.ptr |> *Ptr;
    let name_label_ends = name |> Name.label_ends |> RawVec.ptr |> *Ptr;

    let parent_label_data = parent |> Name.label_data |> RawVec.ptr |> *Ptr;
    let name_label_data = name |> Name.label_data |> RawVec.ptr |> *Ptr;

    // let _ = if label_ofs >s 0w64 {
    //     let _ = debug(label_ofs);
    //     let _ = debug(name_label_ends |> Int<8>[label_ofs] |> *Int<8>);
    //     let _ = debug(char_ofs);
    //     true
    // } else {
    //     false
    // };

    parent_labels == 0w64 
    || (parent_chars <=s name_chars
        && ((label_ofs == 0w64 && char_ofs == 0w64) || (label_ofs >s 0w64 && name_label_ends |> Int<8>[label_ofs - 1w64] |> *Int<8> == trunc char_ofs to Int<8>))
        && string_compare(parent_label_ends, name_label_ends |> Int<8>[label_ofs], parent_labels, trunc char_ofs to Int<8>)
        && string_compare(parent_label_data, name_label_data |> Int<8>[char_ofs], parent_chars, 0w8))
}

// Compare two DnsRecords.
fn compare_rr(rr1: DnsRecord, rr2: DnsRecord) -> Bool {
    rr1.rtype == rr2.rtype
    && list_eq::<Int<8>>(rr1.rname, rr2.rname)
    && list_eq::<Int<8>>(rr1.rdata, rr2.rdata)
}

// Make a DnsZone
fn into_dns_zone(origin: Ptr) -> DnsZone {
    let origin = into_dns_name(origin);

    let records_key: Ptr = "RECORDS";
    let records: List<Ptr> = values(records_key);

    let all_rrs = map::<Ptr, DnsRecord>(
        records,
        |rr| { into_dns_record(rr) },
    );

    let cut_rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { rr.rtype == 18w16 && !list_eq::<Int<8>>(rr.rname, origin) }
    );
    let rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { !any::<DnsRecord>(cut_rrs, |ns| { is_parent(ns.rname, rr.rname) }) }
    );
    let glue_rrs = filter::<DnsRecord>(
        all_rrs, 
        |rr| { any::<DnsRecord>(cut_rrs, |ns| { rr.rtype != 18w16 && is_parent(ns.rname, rr.rname) }) }
    ); // technically, we are not authoriative to cut NS rrs as well, but they are not glue

    DnsZone {
        origin: origin,
        rrs: rrs ++ cut_rrs,
        glue_rrs: glue_rrs,
    }
}

// Make DnsQuery
fn into_dns_query(name: Ptr, qtype: Int<16>) -> DnsQuery {
    let qname = into_dns_name(name);
    DnsQuery {
        qname: qname,
        qtype: qtype,
        qcount: 0,
    }
}

// Make a DnsResponse
fn into_dns_response(ret: Ptr, additional_vtable: Ptr) -> DnsResponse {
    let rcode = into_dns_rcode(ret |> *Int<16>);
    let aa = trunc ret |> Int<8>[16] |> *Int<8> to Bool;

    let answer_ptr = ret |> ResponseRet.ptr |> *Ptr;
    let answer = into_single_record(answer_ptr);

    let ns_ptr = ret |> ResponseRet.ptr |> Ptr[2] |> *Ptr;
    let ns = into_single_record(ns_ptr);

    let soa_ptr = ret |> ResponseRet.ptr |> Ptr[4] |> *Ptr;
    let soa = into_single_record(soa_ptr);

    let additional_ptr = ret |> ResponseRet.ptr |> Ptr[6] |> *Ptr;
    let additional_vptr = ret |> ResponseRet.ptr |> Ptr[7] |> *Ptr;
    let additional = if additional_vptr == additional_vtable && additional_ptr |> Int<8>[80] |> *Int<16> == 39w16 {
        let record_sets = additional_ptr |> Int<8>[16] |> *Int<64>;
        let list_record_set = additional_ptr |> Int<8>[8] |> *Ptr;
        into_list_record(list_record_set, record_sets)
    } else {
        []
    };

    DnsResponse {
        rcode: rcode,
        aa: aa,
        answer: answer,
        authority: ns ++ soa,
        additional: additional,
    }
}

fn into_list_record(p: Ptr, len: Int<64>) -> List<DnsRecord> {
    if len == 0w64 {
        []
    } else {
        let arc_inner_record_set = p |> *Ptr;
        let record_data_ptr = arc_inner_record_set |> Int<8>[24] |> *Ptr;
        [into_dns_record(record_data_ptr)] ++ into_list_record(p |> Ptr[1], len-1w64)
    }
}

fn into_single_record(p: Ptr) -> List<DnsRecord> {
    let empty_flag = p |> Int<8>[256] |> *Int<16>;
    let _ = specialize(empty_flag);
    if empty_flag == 40w16 {
        []
    } else {
        if empty_flag == 41w16 {
            let record_sets = p |> Int<8>[104] |> *Int<64>;
            let _ = specialize(record_sets);
            if record_sets == 1w64 {
                let list_record_set = p |> Int<8>[96] |> *Ptr;
                let arc_inner_record_set = list_record_set |> *Ptr;
                let record_data_ptr = arc_inner_record_set |> Int<8>[24] |> *Ptr;
                [into_dns_record(record_data_ptr)]
            } else {
                let _ = debug(record_sets);
                let _ = panic("more then one record_set");
                []
            }
        } else {
            let _ = debug(empty_flag);
            let _ = panic("unknown empty flag");
            []
        }
    }
}

fn into_dns_record(p: Ptr) -> DnsRecord {
    let rname = into_dns_name(p |> RecordAa.tail |> RecordTail.name);
    let rtype = p |> RecordAa.tail |> RecordTail.rr_type |> *Int<16>;

    let rdata = if rtype == 8w16 || rtype == 18w16 {
        let name = p |> RecordName.name;
        into_dns_name(name)
    } else {
        if rtype == 16w16 || rtype == 29w16 {
            let mx = p |> RecordMx.mx;
            into_dns_name(mx)
        } else {
            []
        }
    };

    DnsRecord {
        rname: rname,
        rtype: rtype,
        rdata: rdata,
    }
}

fn into_dns_rcode(rcode: Int<16>) -> DnsRCode {
    let _ = specialize(rcode);
    if rcode == 0w16 {
        DnsRCode.NOERROR
    } else {
        if rcode == 3w16 {
            DnsRCode.NXDOMAIN
        } else {
            if rcode == 2w16 {
                DnsRCode.SERVFAIL
            } else {
                if rcode == 5w16 {
                    DnsRCode.REFUSED
                } else {
                    DnsRCode.OTHER
                }
            }
        }
    }
}

fn into_dns_name(name: Ptr) -> List<Int<8>> {
    let name_labels = name |> Name.label_ends |> String.len |> *Int<64>;
    let name_label_ends = name |> Name.label_ends |> RawVec.ptr |> *Ptr;
    let name_label_data = name |> Name.label_data |> RawVec.ptr |> *Ptr;

    visit_dns_name(name_labels, 0w8, name_label_ends, name_label_data)
}

fn visit_dns_name(labels: Int<64>, start: Int<8>, ends: Ptr, data: Ptr) -> List<Int<8>> {
    let _ = specialize(labels);
    let _ = specialize(ends);
    if labels <=s 0w64 {
        []
    } else {
        let label_end = ends |> *Int<8>;
        let _ = specialize(label_end);
        let len = label_end - start;
        let label = visit_dns_label(data, len);
        label ++ [46w8] ++ visit_dns_name(labels-1w64, label_end, ends |> Int<8>[1], data |> Int<8>[len])
    }
}

fn visit_dns_label(data: Ptr, len: Int<8>) -> List<Int<8>> {
    if len == 0w8 {
        []
    } else {
        let ch = data |> *Int<8>;
        [ch] ++ visit_dns_label(data |> Int<8>[1], len-1w8)
    }
}

// ——————————
// Reference Model
// ——————————

enum DnsRCode {
    NOERROR,
    NXDOMAIN,
    SERVFAIL,
    REFUSED,
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
    // rr.rtype == 2w16                                // `rr` is NS
    rr.rtype == 18w16                                // `rr` is NS
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
    // let glue_records = filter::<DnsRecord>(zone.glue_rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    let glue_records = filter::<DnsRecord>(zone.glue_rrs, |x| {x.rtype == 1w16 || x.rtype == 0w16} );
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
    // let addr_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 1w16 || x.rtype == 28w16} );
    let addr_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 1w16 || x.rtype == 0w16} );
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
    // let ns_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 2w16} );
    let ns_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 18w16} );
    // if all::<DnsRecord>(relevant_rrs, |x| {x.rtype != 6w16}) 
    if all::<DnsRecord>(relevant_rrs, |x| {x.rtype != 28w16}) 
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
        let apex_ns = filter::<DnsRecord>(zone.rrs, |rr| { 
            // rr.rtype == 2w16
            rr.rtype == 18w16
            && list_eq::<Int<8>>(rr.rname, zone.origin)
        });
        if len(ans_records) != 0 {
            let qtype = query.qtype;
            // if qtype == 2w16 || qtype == 15w16 || qtype == 33w16 {
            if qtype == 16w16 || qtype == 18w16 || qtype == 29w16 {
                // NS, MX and SRV records trigger additional handling
                let additional = additional(zone, ans_records);
                // let auth = if qtype == 2w16 { [] } else { apex_ns };
                let auth = if qtype == 18w16 { [] } else { apex_ns };
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: additional, 
                    authority: auth,
                }
            } else {
                if qtype == 28w16 {
                    DnsResponse {
                        rcode: DnsRCode.NOERROR, 
                        aa: true,
                        answer: ans_records, 
                        additional: [], 
                        authority: apex_ns,
                    }
                } else {
                    DnsResponse {
                        rcode: DnsRCode.NOERROR, 
                        aa: true,
                        answer: ans_records, 
                        additional: [], 
                        authority: [],
                    }
                }
            }
        } else {
            // let cname_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 5w16} );
            let cname_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 8w16} );
            if len(cname_rrs) != 0 {
                // RFC 1034 Section 3.6.2 ensures that there should only be one matching CNAME record
                let cname = cname_rrs[0];
                let target = cname.rdata;
                // if query.qtype == 5w16 {
                if query.qtype == 8w16 {
                    // No need to go further if QTYPE is CNAME
                    DnsResponse {
                        rcode: DnsRCode.NOERROR, 
                        aa: true,
                        answer: [cname], 
                        additional: [], 
                        authority: [], 
                    }
                } else {
                    let query = DnsQuery {
                        qname: target,
                        qtype: query.qtype,
                        qcount: query.qcount + 1,
                    };
                    let resp = rrlookup(zone, query);
                    // Deduplicates records in the response:
                    // If the CNAME is the same across chasing the chain, only
                    // one is kept.
                    let dup = any::<DnsRecord>(
                        resp.answer,
                        |rr| { compare_rr(rr, cname) }
                    );
                    // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                    // a delegation after aliasing still has `AA` set.
                    DnsResponse {
                        rcode: resp.rcode,
                        aa: true,
                        answer: if dup { resp.answer } else { [cname] ++ resp.answer },
                        authority: [],
                        additional: resp.additional,
                    }
                }
            } else {
                // let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
                let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 28w16} );
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
    let apex_ns = filter::<DnsRecord>(zone.rrs, |rr| { 
        // rr.rtype == 2w16
        rr.rtype == 18w16
        && list_eq::<Int<8>>(rr.rname, zone.origin)
    });
    if query.qcount >s 3 {
        // Break CNAME loop
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
            // let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
            let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 28w16} );
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
                // No exact match; 
                // should try DNAME redirection first but Hickory-dns doesn't support it
                
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
                    // let ns_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 2w16} );
                    // let has_soa = any::<DnsRecord>(relevant_rrs, |x| {x.rtype == 6w16} );
                    let ns_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == 18w16} );
                    let has_soa = any::<DnsRecord>(relevant_rrs, |x| {x.rtype == 28w16} );
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
                        // let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 6w16} );
                        let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == 28w16} );
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
