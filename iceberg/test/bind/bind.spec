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

use %struct.dns_view as struct DnsView {
    magic: Int<32>,
    mctx: Ptr, 
    rdclass: Int<16>,
    name: Ptr, 
    zonetable: Ptr, // &DnsZt
    resolver: Ptr,
    adb: Ptr,
    requestmgr: Ptr,
    dispatchmgr: Ptr,
    cache: Ptr,
    cachedb: Ptr,
    hints: Ptr,
    secroots_priv: Ptr,
    ntatable_priv: Ptr,
    lock: PthreadMutex,
    frozen: Int<8>,
    cacheshared: Int<8>,
    transports: Ptr,
    statickeys: Ptr,
    dynamickeys: Ptr,
    peers: Ptr,
    order: Ptr,
    fwdtable: Ptr,
    recursion: Int<8>,
    qminimization: Int<8>,
    qmin_strict: Int<8>,
    auth_nxdomain: Int<8>,
    minimal_any: Int<8>,
    minimal_responses: Int<32>,
    enablevalidation: Int<8>,
    acceptexpired: Int<8>,
    requireservercookie: Int<8>,
    synthfromdnssec: Int<8>,
    trust_anchor_telemetry: Int<8>,
    root_key_sentinel: Int<8>,
    transfer_format: Int<32>,
    cacheacl: Ptr,
    cacheonacl: Ptr,
    queryacl: Ptr,
    queryonacl: Ptr,
    recursionacl: Ptr,
    recursiononacl: Ptr,
    sortlist: Ptr,
    notifyacl: Ptr,
    transferacl: Ptr,
    updateacl: Ptr,
    upfwdacl: Ptr,
    denyansweracl: Ptr,
    nocasecompress: Ptr,
    msgcompression: Int<8>,
    answeracl_exclude: Ptr,
    denyanswernames: Ptr,
    answernames_exclude: Ptr,
    sfd: Ptr,
    rrl: Ptr,
    provideixfr: Int<8>,
    requestnsid: Int<8>,
    sendcookie: Int<8>,
    maxcachettl: Int<32>,
    maxncachettl: Int<32>,
    mincachettl: Int<32>,
    minncachettl: Int<32>,
    nta_lifetime: Int<32>,
    nta_recheck: Int<32>,
    nta_file: Ptr,
    prefetch_trigger: Int<32>,
    prefetch_eligible: Int<32>,
    dstport: Int<16>,
    aclenv: Ptr,
    preferred_glue: Int<16>,
    flush: Int<8>,
    checknames: Int<8>,
    maxudp: Int<16>,
    staleanswerttl: Int<32>,
    staleanswersok: Int<32>,
    staleanswersenable: Int<8>,
    staleanswerclienttimeout: Int<32>,
    nocookieudp: Int<16>,
    padding: Int<16>,
    pad_acl: Ptr,
    maxbits: Int<32>,
    dns64: Link,
    dns64cnt: Int<32>,
    usedns64: Int<8>,
    rpzs: Ptr,
    catzs: Ptr,
    dlz_searched: Link,
    dlz_unsearched: Link,
    fail_ttl: Int<32>,
    failcache: Ptr,
    udpsize: Int<32>,
    matchclients: Ptr,
    matchdestinations: Ptr,
    matchrecursiveonly: Int<8>,
    references: Int<64>,
    weakrefs: Int<64>,
    link: Link,
    viewlist: Ptr,
    managed_keys: Ptr, // &DnsZone
    redirect: Ptr, // &DnsZone
    redirectzone: Ptr, 
    redirectfixed: DnsFixedName,
    new_zone_dir: Ptr, 
    new_zone_file: Ptr, 
    new_zone_db: Ptr, 
    new_zone_dbenv: Ptr, 
    new_zone_mapsize: Int<64>,
    new_zone_config: Ptr, 
    cfg_destroy: Ptr, 
    new_zone_lock: PthreadMutex,
    secret: [Int<8>; 32],
    v6bias: Int<32>,
    dtenv: Ptr, 
    dttypes: Int<16>,
    plugins: Ptr, 
    plugins_free: Ptr, 
    hooktable: Ptr, 
    hooktable_free: Ptr, 
}

use %struct.dns_rbtdb as struct DnsRbtdb {
    common: DnsDb,
    _: [Int<8>; 56],
    lock: IscRwlock,
    tree_lock: IscRwlock,
    node_lock_count: Int<32>,
    node_locks: Ptr,
    origin_node: Ptr,
    nsec3_origin_node: Ptr,
    rrsetstats: Ptr,
    cachestats: Ptr,
    gluecachestats: Ptr,
    active: Int<32>,
    attributes: Int<32>,
    current_serial: Int<32>,
    least_serial: Int<32>,
    next_serial: Int<32>,
    current_version: Ptr,
    future_version: Ptr,
    open_versions: Link,
    loop: Ptr,
    soanode: Ptr,
    nsnode: Ptr,
    serve_stale_refresh: Int<32>,
    lru: Ptr,
    deadnodes: Ptr,
    hmctx: Ptr,
    heaps: Ptr,
    sooner: Ptr,
    tree: Ptr,
    nsec: Ptr,
    nsec3: Ptr,
    quantum: Int<32>,
    __: [Int<8>; 44],
}

use %struct.isc_buffer as struct IscBuffer {
    magic: Int<32>,
    base: Ptr,
    length: Int<32>,
    used: Int<32>,
    current: Int<32>,
    active: Int<32>,
    extra: Int<32>,
    dynamic: Int<8>,
    link: Link,
    mctx: Ptr,
}

use %struct.query_ctx as struct QueryCtx {
    dbuf: Ptr, // &Buffer
    fname: Ptr, // &DnsName
    tname: Ptr, // &DnsName
    rdataset: Ptr, // &DnsRdataset
    sigrdataset: Ptr, // &DnsRdataset
    noqname: Ptr, // &DnsRdataset
    qtype: Int<16>,
    type: Int<16>,
    options: Int<32>,
    redirected: Int<8>,
    is_zone: Int<8>,
    is_staticstub_zone: Int<8>,
    resuming: Int<8>,
    dns64: Int<8>,
    dns64_exclude: Int<8>,
    rpz: Int<8>,
    authoriative: Int<8>,
    want_restart: Int<8>,
    refresh_rrset: Int<8>,
    need_wildcardproof: Int<8>,
    nxrewrite: Int<8>,
    findcoveringnsec: Int<8>,
    answer_has_ns: Int<8>,
    wildcardname: DnsFixedName,
    dsname: DnsFixedName,
    client: Ptr, // &NsClient
    detach_client: Int<8>,
    fresp: Ptr, // &DnsFetchResponse
    db: Ptr, // &DnsDb
    version: Ptr,
    node: Ptr,
    zdb: Ptr, // &DnsDb
    znode: Ptr,
    zfname: Ptr, // &DnsName
    zversion: Ptr,
    zrdataset: Ptr, // &DnsRdataset
    zsigrdataset: Ptr, // &DnsRdataset
    rpz_st: Ptr, // &DnsRpzState
    zone: Ptr, // &DnsZone
    view: Ptr, // &DnsView
    result: Int<32>,
    line: Int<32>,
}

use %struct.ns_client as struct NsClient {
    magic: Int<32>,
    manager: Ptr, // &NsClientMgr
    state: Int<32>,
    nodetach: Int<8>,
    attributes: Int<32>,
    view: Ptr,
    dispatch: Ptr,
    handle: Ptr,
    sendhandle: Ptr,
    reqhandle: Ptr,
    updatehandle: Ptr,
    tcpbuf: Ptr,
	tcpbuf_size: Int<64>,
	message: Ptr,
	sendbuf: Ptr,
	opt: Ptr,
	ede: Ptr,
	udpsize: Int<16>,
	extflags: Int<16>,
	ednsversion: Int<16>,
	additionaldepth: Int<16>,
	cleanup: Ptr,
	query: NsQuery,
	requesttime: IscTime,
	now: Int<32>,
    tnow: IscTime,
	signername: DnsName, 
	signer: Ptr,
    peeraddr: IscSockaddr,
	peeraddr_valid: Int<8>,
    destaddr: IscNetaddr,
    destsockaddr: IscSockaddr,
    ecs: DnsEcs,
    formerrcache: DnsFormerRcache,
    sendcb: Ptr, 
    rlink: Link,
    cookie: [Int<8>; 8],
    expire: Int<32>,
    keytag: Ptr,
    keytag_len: Int<16>,
    rcode_override: Int<32>,
}

use %struct.ns_clientmgr as struct NsClientMgr {
    magic: Int<32>,
    mctx: Ptr,
    send_mctx: Ptr,
    namepool: Ptr,
    rdspool: Ptr,
    sctx: Ptr, // &NsServer
    references: Int<64>,
    tid: Int<32>,
    loop: Ptr,
    aclenv: Ptr,
    reclock: PthreadMutex,
    recursing: Link,
}

use %struct.ns_query as struct NsQuery {
    attributes: Int<32>, 
    restarts: Int<32>, 
	timerset: Int<8>,
	qname: Ptr, // &DnsName
    origqname: Ptr, 
    qtype: Int<16>,
    dboptions: Int<32>,
    fetchoptions: Int<32>,
    gluedb: Ptr,
    authdb: Ptr, 
    authzone: Ptr, 
    authdbset: Int<8>,
    isreferral: Int<8>,
    fetchlock: PthreadMutex,
	hookactx: Ptr, 
    rpz_st: Ptr, 
    namebufs: Link, 
    activeversions: Link, 
    freeversions: Link, 
    dns64_aaaa: Ptr, 
    dns64_sigaaaa: Ptr, 
    dns64_aaaaok: Ptr,
	dns64_aaaaoklen: Int<32>,
	dns64_options: Int<32>,
	dns64_ttl: Int<32>,
	redirect: DnsRedirect,
    recursions: [DnsRecursion; 5],
    recparam: NsQueryRecparam,
    root_key_sentinel_keyid: Int<16>,
    root_key_sentinel_is_ta: Int<8>,
    root_key_sentinel_not_ta: Int<8>,
}

use %struct.dns_zone as struct DnsZone {
	magic: Int<32>,
	lock: PthreadMutex,
	locked: Int<8>,
	mctx: Ptr,
	references: Int<64>,
    _: [Int<8>; 56],
	dblock: IscRwlock,
	db: Ptr,
	tid: Int<32>,
	zmgr: Ptr,
	link: Link,
	loop: Ptr,
	timer: Ptr,
	irefs: Int<64>,
	origin: DnsName,
	masterfile: Ptr,
	stream: Ptr,
	includes: Link,
	newincludes: Link,
	nincludes: Int<32>,
	masterformat: Int<32>,
	masterstyle: Ptr,
	journal: Ptr,
	journalsize: Int<32>,
	rdclass: Int<16>,
    type: Int<32>,
	flags: Int<64>,
	options: Int<64>,
	db_argc: Int<32>,
	db_argv: Ptr,
	expiretime: IscTime,
	refreshtime: IscTime,
	dumptime: IscTime,
	loadtime: IscTime,
	notifytime: IscTime,
	resigntime: IscTime,
	keywarntime: IscTime,
	signingtime: IscTime,
	nsec3chaintime: IscTime,
	refreshkeytime: IscTime,
	xfrintime: IscTime,
	refreshkeyinterval: Int<32>,
	refreshkeycount: Int<32>,
	refresh: Int<32>,
	retry: Int<32>,
	expire: Int<32>,
	minimum: Int<32>,
	key_expiry: Int<32>,
	log_key_expired_timer: Int<32>,
	keydirectory: Ptr,
	kfio: Ptr,
	maxrefresh: Int<32>,
	minrefresh: Int<32>,
	maxretry: Int<32>,
	minretry: Int<32>,
	maxrecords: Int<32>,
	primaries: DnsRemote,
	parentals: DnsRemote,
	checkds_ok: Link,
	checkdstype: Int<32>,
	nsfetchcount: Int<32>,
	parent_nscount: Int<32>,
	notify: DnsRemote,
	notifytype: Int<32>,
	notifyfrom: IscSockaddr,
	notifysrc4: IscSockaddr,
	notifysrc6: IscSockaddr,
	parentalsrc4: IscSockaddr,
	parentalsrc6: IscSockaddr,
	xfrsource4: IscSockaddr,
	xfrsource6: IscSockaddr,
	sourceaddr: IscSockaddr,
	xfr: Ptr,
	tsigkey: Ptr,
	transport: Ptr,
	update_acl: Ptr,
	forward_acl: Ptr,
	notify_acl: Ptr,
	query_acl: Ptr,
	queryon_acl: Ptr,
	xfr_acl: Ptr,
	update_disabled: Int<8>,
	zero_no_soa_ttl: Int<8>,
	check_names: Int<32>,
	notifies: Link,
	checkds_requests: Link,
	request: Ptr,
	loadctx: Ptr,
	dumpctx: Ptr,
	maxxfrin: Int<32>,
	maxxfrout: Int<32>,
	idlein: Int<32>,
	idleout: Int<32>,
	ssutable: Ptr,
	sigvalidityinterval: Int<32>,
	keyvalidityinterval: Int<32>,
	sigresigninginterval: Int<32>,
	view: Ptr,
	prev_view: Ptr,
	kasp: Ptr,
	defaultkasp: Ptr,
	checkmx: Ptr,
	checksrv: Ptr,
	checkns: Ptr,
	statelink: Link,
	statelist: Ptr,
	stats: Ptr,
	statlevel: Int<32>,
	requeststats_on: Int<8>,
	requeststats: Ptr,
	rcvquerystats: Ptr,
	dnssecsignstats: Ptr,
	notifydelay: Int<32>,
	isself: Ptr,
	isselfarg: Ptr,
	strnamerd: Ptr,
	strname: Ptr,
	strrdclass: Ptr,
	strviewname: Ptr,
	compact_serial: Int<32>,
    signing: Link,
	nsec3chain: Link,
	setnsec3param_queue: Link,
	signatures: Int<32>,
	nodes: Int<32>,
	privatetype: Int<16>,
	keyopts: Int<64>,
	added: Int<8>,
	automatic: Int<8>,
	rpzs: Ptr,
	rpz_num: Int<8>,
	catzs: Ptr,
    parentcatz: Ptr,
    updatemethod: Int<32>,
    requestixfr: Int<8>,
	ixfr_ratio: Int<32>,
    requestexpire: Int<8>,
    forwards: Link,
    raw: Ptr,
	secure: Ptr,
	sourceserialset: Int<8>,
	sourceserial: Int<32>,
	soattl: Int<32>,
	maxttl: Int<32>,
	rss_diff: DnsDiff,
	rss_newver: Ptr,
	rss_oldver: Ptr,
	rss_db: Ptr,
	rss_raw: Ptr,
	rss: Ptr,
	rss_state: Ptr,
	gluecachestats: Ptr,
}

struct Link {
    prev: Ptr,
    next: Ptr,
}

use %struct.dns_rbt as struct DnsRbt {
    magic: Int<32>,
    mctx: Ptr,
    root: Ptr,
    data_deleter: Ptr,
    deleter_arg: Ptr,
    nodecount: Int<32>,
    hashbits: [Int<8>; 2],
    hashtable: [Ptr; 2],
    hindex: Int<8>,
    hiter: Int<32>,
}

use %struct.dns_rbtnode as struct DnsRbtNode {
    magic: Int<32>,
    flags: Int<32>,
    hashval: Int<32>,
    uppernode: Ptr, // &DnsRbtNode
    hashnext: Ptr, // &DnsRbtNode
    parent: Ptr, // &DnsRbtNode
    left: Ptr, // &DnsRbtNode
    right: Ptr, // &DnsRbtNode
    down: Ptr, // &DnsRbtNode
    deadlink: Link,
    data: Ptr,
    lock_flags: Int<8>,
    locknum: Int<16>,
    references: Int<64>,
}

use %struct.dns_slabheader as struct DnsSlabheader {
    serial: Int<32>,
    ttl: Int<32>,
    type: Int<32>,
    attributes: Int<16>,
    trust: Int<16>,
    heap_index: Int<32>,
    resign: Int<32>,
    resign_lsb: Int<8>,
    count: Int<64>,
    last_refresh_fail_ts: Int<64>,
    noqname: Ptr, // &DnsProof
    closest: Ptr, // &DnsProof
    next: Ptr, // &DnsSlabheader
    down: Ptr, // &DnsSlabheader
    db: Ptr, // &DnsDb2228,
    node: Ptr,
    last_used: Int<32>,
    link: Link,
    upper: [Int<8>; 32],
    heap: Ptr, // &Heap
    glue_list: Ptr, // &DnsGlue
    wfs_node: CdsWfsNode,
}

use %struct.dns_name as struct DnsName {
    magic: Int<32>,
    ndata: Ptr, // &Int<8>
    length: Int<32>,
    labels: Int<32>,
    attrs: DnsNameAttrs,
    offsets: Ptr, // &Int<8>
    buffer: Ptr,
    link: Link,
    list: Link,
}

use %struct.dns_message as struct DnsMessage {
    magic: Int<32>,
    references: Int<64>,
    id: Int<16>,
    flags: Int<32>,
    rcode: Int<16>,
    opcode: Int<16>,
    rdclass: Int<16>,
    counts: [Int<32>; 4],
    sections: [Link; 4],
    cursors: [Ptr; 4],
    opt: Ptr, // &DnsRdataset
    sig0: Ptr, // &DnsRdataset
    tsig: Ptr, // &DnsRdataset
    state: Int<32>,
    bit_array: Int<16>,
    opt_reserved: Int<32>,
    sig_reserved: Int<32>,
    reserved: Int<32>,
    padding: Int<16>,
    padding_off: Int<32>,
    buffer: Ptr,
    cctx: Ptr, 
    mctx: Ptr, 
    namepool: Ptr,
    rdspool: Ptr, 
    scratchpad: Link,
    cleanup: Link,
    rdatas: Link, 
    rdatalists: Link,
    offsets: Link,
    freerdata: Link,
    freerdatalist: Link,
    tsigstatus: Int<16>,
    querytsigstatus: Int<16>,
    tsigname: Ptr, // &DnsName
    querytsig: Ptr, // &DnsRdataset
    tsigkey: Ptr,
    tsigctx: Ptr,
    sigstart: Int<32>,
    timeadjust: Int<32>,
    sig0name: Ptr, // &DnsName
    sig0key: Ptr, // &DstKey
    sig0status: Int<16>,
    query: IscRegion,
    saved: IscRegion,
    fuzztime: Int<32>,
    order: Ptr,
    order_arg: DnsSortlistArg,
    indent: DnsIndent,
    minttl: [DnsMinttl; 4],
}

use %struct.ns_dbversion as struct NsDbversion {
    db: Ptr,
    version: Ptr,
    acl_checked: Int<8>,
    queryok: Int<8>,
    link: Link,
}

use %struct.dns_rdataset.rdlist as struct DnsRdatasetRdlist {
    magic: Int<32>,
    methods: Ptr,
    link: Link,
    rdclass: Int<16>,
    type: Int<16>,
    ttl: Int<32>,
    trust: Int<16>,
    covers: Int<16>,
    attributes: Int<32>,
    count: Int<32>,
    resign: Int<32>,
    rdlist: DnsRdlist,
}

use %struct.dns_rdataset.2416 as struct DnsRdatasetSlab {
    magic: Int<32>,
    methods: Ptr,
    link: Link,
    rdclass: Int<16>,
    type: Int<16>,
    ttl: Int<32>,
    trust: Int<16>,
    covers: Int<16>,
    attributes: Int<32>,
    count: Int<32>,
    resign: Int<32>,
    slab: DnsSlab,
}

use %union.anon.14.2415 as struct DnsSlab

use %union.rdlist as struct DnsRdlist {
    list: Ptr, // &DnsRdatalist
    iter: Ptr, // &DnsRdata
    noqname: Ptr, // &DnsName
    closest: Ptr, // &DnsName
    node: Ptr,
    _: [Int<8>; 16],
}

use %struct.dns_rdatalist as struct DnsRdatalist {
    rdclass: Int<16>,
    type: Int<16>,
    covers: Int<16>,
    ttl: Int<32>,
    rdata: Link,
    link: Link,
    upper: [Int<8>; 32],
}

use %struct.dns_rdata as struct DnsRdata {
    data: Ptr,
    length: Int<32>,
    rdclass: Int<16>,
    type: Int<16>,
    flags: Int<32>,
    link: Link,
}

use %struct.isc_region as struct IscRegion {
    base: Ptr,
    length: Int<32>,
}

use %struct.dns_rbtnodechain as struct DnsRbtnodechain {
    magic: Int<32>,
	end: Ptr,
	levels: [Ptr; 127],
	level_count: Int<32>,
	level_matches: Int<32>,
}

use %struct.dns_rbtdb_version as struct DnsRbtdbVersion {
	serial: Int<32>,
	rbtdb: Ptr,
	references: Int<64>,
	writer: Int<8>,
	commit_ok: Int<8>,
	changed_list: Link,
	resigned_list: Link,
	link: Link,
	secure: Int<8>,
	havensec3: Int<8>,
	hash: Int<32>,
	flags: Int<8>,
	iterations: Int<16>,
	salt_length: Int<8>,
	salt: [Int<8>; 255],
    _: [Int<8>; 36],
	rwlock: IscRwlock,
	records: Int<64>,
	xfrsize: Int<64>,
    glue_stack: CdsWfsStack,
}

use %struct.dns_name_attrs as struct DnsNameAttrs
use %struct.dns_fixedname as struct DnsFixedName
use %struct.isc_rwlock as struct IscRwlock
use %union.pthread_mutex_t as struct PthreadMutex
use %struct.cds_wfs_node as struct CdsWfsNode
use %struct.cds_wfs_stack as struct CdsWfsStack
use %struct.isc_time as struct IscTime
use %struct.isc_sockaddr as struct IscSockaddr
use %struct.isc_netaddr as struct IscNetaddr
use %struct.dns_ecs as struct DnsEcs
use %struct.anon.46.5471 as struct DnsFormerRcache
use %struct.anon.44 as struct DnsRedirect
use %struct.anon.45 as struct DnsRecursion
use %struct.ns_query_recparam as struct NsQueryRecparam
use %struct.dns_sortlist_arg as struct DnsSortlistArg
use %struct.dns_indent_t as struct DnsIndent
use %struct.dns_minttl as struct DnsMinttl
use %struct.dns_remote as struct DnsRemote
use %struct.dns_diff as struct DnsDiff
use %struct.dns_db as struct DnsDb

// ——————————
// Bind SPECs
// ——————————

use @dns_zone_attach as fn dns_zone_attach(Ptr, Ptr);

/// The actual `dns_zt_find` implementation uses a trie tree that involves
/// difficult layout casting, which we cannot handle currently.
/// 
/// Bypass that using an abstract map lookup.
fn dns_zt_find(
    zt: Ptr,
    name: Ptr,
    options: Int<32>,
    zonep: Ptr,
) -> Int<32> {
    let _ = specialize(options);
    let zones: List<Ptr> = values(zt);
    let exactmask = 3w32;
    let exactopts = options & exactmask;
    let _ = exactopts != exactmask || panic("exactopts not supported");
    let zone = zones[0]; // valid_query() already ensured `name` is in zone

    let orig_len = zone |> DnsZone.origin |> DnsName.length |> *Int<32>;
    let _ = specialize(orig_len);
    let target_len = name |> DnsName.length |> *Int<32>;
    let partial_match = orig_len <s target_len;

    if exactopts == 1w32 // DNS_ZTFIND_EXACT
        && partial_match 
    {
        23w32 // ISC_R_NOTFOUND
    } else {
        if exactopts == 2w32 // DNS_ZTFIND_NOEXACT
            && !partial_match
        {
            23w32 // ISC_R_NOTFOUND
        } else {
            // DNS_ZTFIND_MIRROR not checked
            let _ = dns_zone_attach(zone, zonep);
            if partial_match {
                0w32 // ISC_R_SUCCESS
            } else {
                96w32 // DNS_R_PARTIALMATCH
            }
        }
    }
}

/// Serve-fail cache is currently not verified as it uses libucru's hash table.
fn ns__query_sfcache(qctx: Ptr) -> Int<32> {
    64w32
}

/// Sortlist is not important for what we do here.
fn query_setup_sortlist(qctx: Ptr) -> Void {
    none
}

/// RRset-order is not important for what we do here.
fn dns_order_find(order: Ptr, name: Ptr, type: Int<16>, rdclass: Int<16>) -> Int<32> {
    0w32
}

/// The work queue is always empty.
fn cds_wfcq_dequeue_blocking(head: Ptr, tail: Ptr) -> Ptr {
    null
}

/// `acl` is not checked.
fn ns_client_checkaclsilent(client: Ptr, netaddr: Ptr, acl: Ptr, default_allow: Bool) -> Int<32> {
    0w32
}

/// Stale refreshing is not supported.
fn dns_db_getservestalerefresh(db: Ptr, _: Ptr) -> Int<32> {
    0w32
}

/// Nodes are considered constant, so do not update the refcount.
fn dns__rbtdb_newref(rbtdb: Ptr, node: Ptr, locktype: Int<32>) {
    none
}

/// Nodes are considered constant, so do not update the refcount.
fn dns__rbtdb_decref(
    rbtdb: Ptr, 
    node: Ptr, 
    least_serial: Int<32>, 
    nlocktypep: Ptr, 
    tlocktypep: Ptr, 
    tryupgrade: Bool,
    pruning: Bool,
) -> Bool {
    false
}

/// Nodes are considered constant, so do not update the refcount.
fn dns__rbtdb_attachnode(db: Ptr, source: Ptr, targetp: Ptr) {
    store(targetp, source)
}

/// Nodes are considered constant, so do not update the refcount.
fn dns__rbtdb_detachnode(db: Ptr, targetp: Ptr) {
    store(targetp, null)
}

use @newglue as fn newglue(Ptr, Ptr, Ptr, Ptr) -> Ptr;
use @addglue_to_message as fn addglue_to_message(Ptr, Ptr);

/// This is meant to cache the found glue in `rdataset`, but sadly
/// we model the latter as constant...
fn addglue(
    db: Ptr,
    version: Ptr,
    rdataset: Ptr,
    msg: Ptr,
) -> Int<32> {
    let node = rdataset |> DnsRdatasetSlab.slab |> Int<8>[8] |> *Ptr;
    let glue = newglue(db, version, node, rdataset);
    let _ = if glue == ((-1w64) as Ptr) {
        none
    } else {
        addglue_to_message(glue, msg)
    };
    0w32
}

/// This is only used in SRV parsing, but the result is
/// not useful. Pretend that it fails.
fn dns_name_fromstring(
    target: Ptr,
    src: Ptr, 
    origin: Ptr,
    options: Int<32>,
    mctx: Ptr,
) -> Int<32> {
    -1w32
}

fn dns_message_findname(
    msg: Ptr,
    section: Int<32>,
    target: Ptr,
    type: Int<16>,
    covers: Int<16>,
    name: Ptr,
    rdataset: Ptr,
) -> Int<32> {
    225w32 // DNS_R_NXDOMAIN
}

/// Run the registered task immediately.
fn isc_async_run(
    loop: Ptr,
    task: Ptr, 
    arg: Ptr,
) -> Void {
    let task = task as (Ptr)->Void;
    task(arg)
}

/// Case-lowering is NOT performed.
fn isc_ascii_lowerequal(
    ndata1: Ptr,
    ndata2: Ptr,
    length: Int<32>,
) -> Bool {
    let _ = specialize(length);
    __equal(ndata1, ndata2, length)
}

fn __equal(
    ndata1: Ptr,
    ndata2: Ptr,
    length: Int<32>,
) -> Bool {
    if length == 0w32 {
        true
    } else {
        let ch1 = ndata1 |> *Int<8>;
        let ch2 = ndata2 |> *Int<8>;
        ch1 == ch2 && __equal(ndata1 |> Int<8>[1], ndata2 |> Int<8>[1], length-1w32)
    }
}

/// Case-lowering is NOT performed.
fn isc_ascii_lowercmp(
    ndata1: Ptr,
    ndata2: Ptr,
    length: Int<32>,
) -> Int<32> {
    let _ = specialize(length);
    __cmp(ndata1, ndata2, length)
}

fn __cmp(
    ndata1: Ptr,
    ndata2: Ptr,
    length: Int<32>,
) -> Int<32> {
    if length == 0w32 {
        0w32
    } else {
        let ch1 = ndata1 |> *Int<8>;
        let ch2 = ndata2 |> *Int<8>;
        if ch1 == ch2 {
            __cmp(ndata1 |> Int<8>[1], ndata2 |> Int<8>[1], length-1w32)
        } else {
            if ch1 <s ch2 { -1w32 } else { 1w32 }
        }
    }
}

/// Case-lowering is NOT performed.
fn isc__ascii_tolower1(c: Int<8>) -> Int<8> {
    c
}

fn isc_ascii_lowercopy_precond(dst: Ptr, src: Ptr, len: Int<32>) -> Bool {
    specialize(len)
}

/// Don't use a switch for this..
fn dns_rdatatype_ismeta(qtype: Int<16>) -> Bool {
    (qtype == 41w16) 
    | ((qtype >=s 249w16) & (qtype <=s 255w16))
    | ((qtype & -128w16) == 128w16)
}

/// Don't use a switch for this..
fn dns_rdatatype_atparent(qtype: Int<16>) -> Bool {
    qtype == 43w16
}

/// Don't use a switch for this..
fn dns_rdatatype_iskeymaterial(qtype: Int<16>) -> Bool {
    (qtype == 60w16) 
    | (qtype == 48w16) 
    | (qtype == 59w16) 
}

/// Don't use a switch for this..
fn dns_rdatatype_attributes(qtype: Int<16>) -> Int<32> {
    if qtype == 2w16 {
        16w32
    } else { if qtype == 5w16 {
        3w32
    } else { if qtype == 6w16 || qtype == 39w16 {
        1w32
    } else { if qtype == 25w16 {
        1040w32
    } else { if qtype == 33w16 || qtype == 64w16 || qtype == 65w16 {
        2048w32
    } else { if qtype == 41w16 {
        261w32
    } else { if qtype == 43w16 {
        536w32
    } else { if qtype == 46w16 || qtype == 47w16 {
        1048w32
    } else { if qtype == 48w16 || qtype == 50w16 || qtype == 51w16 {
        8w32
    } else { if qtype == 249w16 {
        4w32
    } else { if qtype == 250w16 {
        260w32
    } else { if qtype >=s 251w16 && qtype <=s 255w16 {
        132w32
    } else { 
        if (qtype >=s 1w16 && qtype <=s 260w16) || qtype == (-32767w16-1w16) || qtype == -32767w16 || qtype == -3w16 { 
            0w32
        } else { 
            if (qtype & -128w16) == 128w16 {
                68w32
            } else {
                64w32
            }
        }
    }}}}}}}}}}}}
}

fn qtype_precond(qtype: Int<16>) -> Bool {
    !dns_rdatatype_ismeta(qtype)
    & !dns_rdatatype_iskeymaterial(qtype)
    & qtype != 0w16  // EMPTY
    & qtype != 25w16 // KEY
    & qtype != 43w16 // DS
    & qtype != 46w16 // RRSIG
    & qtype != 47w16 // NSEC
    & qtype != 50w16 // NSEC3
}

// data structure specific SPECs

fn ns_query_precond(query: Ptr) -> Bool {
    specialize(query |> NsQuery.authdbset |> *Int<8>)
    & specialize(query |> NsQuery.dboptions |> *Int<32>)
    & specialize(query |> NsQuery.restarts |> *Int<32>)
    & specialize(query |> NsQuery.attributes |> *Int<32>)
    & specialize(query |> NsQuery.root_key_sentinel_is_ta |> *Int<8>)
    & specialize(query |> NsQuery.root_key_sentinel_not_ta |> *Int<8>)
}

fn qctx_precond(qctx: Ptr) -> Bool {
    let qtype = qctx |> QueryCtx.qtype |> *Int<16>;
    let type = qctx |> QueryCtx.type |> *Int<16>;
    let rdataset = qctx |> QueryCtx.rdataset |> *Ptr;
    qtype_precond(qtype)
    & qtype_precond(type)
    & ns_client_precond(qctx |> QueryCtx.client |> *Ptr)
    & dns_rdataset_precond(rdataset)
    & specialize(qctx |> QueryCtx.options |> *Int<32>)
    & specialize(qctx |> QueryCtx.redirected |> *Int<8>)
    & specialize(qctx |> QueryCtx.is_zone |> *Int<8>)
    & specialize(qctx |> QueryCtx.is_staticstub_zone |> *Int<8>)
    & specialize(qctx |> QueryCtx.resuming |> *Int<8>)
    & specialize(qctx |> QueryCtx.authoriative |> *Int<8>)
    & specialize(qctx |> QueryCtx.dns64 |> *Int<8>)
    & specialize(qctx |> QueryCtx.dns64_exclude |> *Int<8>)
    & specialize(qctx |> QueryCtx.nxrewrite |> *Int<8>)
    & specialize(qctx |> QueryCtx.rpz |> *Int<8>)
    & specialize(qctx |> QueryCtx.findcoveringnsec |> *Int<8>)
    & specialize(qctx |> QueryCtx.answer_has_ns |> *Int<8>)
    & specialize(qctx |> QueryCtx.refresh_rrset |> *Int<8>)
    & specialize(qctx |> QueryCtx.need_wildcardproof |> *Int<8>)
    & specialize(qctx |> QueryCtx.detach_client |> *Int<8>)
    & specialize(qctx |> QueryCtx.result |> *Int<32>)
    & specialize(qctx |> QueryCtx.want_restart |> *Int<8>)
}

fn ns_client_precond(client: Ptr) -> Bool {
    specialize(client |> NsClient.extflags |> *Int<16>)
    & specialize(client |> NsClient.ednsversion |> *Int<16>)
    & specialize(client |> NsClient.attributes |> *Int<32>)
    & specialize(client |> NsClient.udpsize |> *Int<16>)
    & specialize(client |> NsClient.nodetach |> *Int<8>)
    & specialize(client |> NsClient.additionaldepth |> *Int<16>)
    & dns_message_precond(client |> NsClient.message |> *Ptr)
    & dns_view_precond(client |> NsClient.view |> *Ptr)
    & ns_clientmgr_precond(client |> NsClient.manager |> *Ptr)
    & ns_query_precond(client |> NsClient.query)
}

fn ns_clientmgr_precond(mgr: Ptr) -> Bool {
    let sctx = mgr |> NsClientMgr.sctx |> *Ptr;
    specialize(sctx |> Int<8>[1208] |> *Int<32>) // sctx->options
}

fn dns_view_precond(view: Ptr) -> Bool {
    specialize(view |> DnsView.minimal_responses |> *Int<32>)
    & specialize(view |> DnsView.root_key_sentinel |> *Int<8>)
    & specialize(view |> DnsView.requireservercookie |> *Int<8>)
    & specialize(view |> DnsView.recursion |> *Int<8>)
    & specialize(view |> DnsView.minimal_any |> *Int<8>)
    & specialize(view |> DnsView.enablevalidation |> *Int<8>)
    & specialize(view |> DnsView.qminimization |> *Int<8>)
    & specialize(view |> DnsView.auth_nxdomain |> *Int<8>)
    & specialize(view |> DnsView.checknames |> *Int<8>)
    & specialize(view |> DnsView.references |> *Int<64>)
}

fn dns_message_precond(msg: Ptr) -> Bool {
    specialize(msg |> DnsMessage.opcode |> *Int<16>)
    & specialize(msg |> DnsMessage.rcode |> *Int<16>)
    & specialize(msg |> DnsMessage.rdclass |> *Int<16>)
    & specialize(msg |> DnsMessage.flags |> *Int<32>)
    & specialize(msg |> DnsMessage.bit_array |> *Int<16>)
    & specialize(msg |> DnsMessage.tsigstatus |> *Int<16>)
    & specialize(msg |> DnsMessage.sig_reserved |> *Int<32>)
    & specialize(msg |> DnsMessage.opt_reserved |> *Int<32>)
    & specialize(msg |> DnsMessage.counts |> *Int<32>)
    & dns_name_precond(msg |> DnsMessage.sections |> *Ptr) // the qname
}

fn dns_zone_precond(zone: Ptr) -> Bool {
    specialize(zone |> DnsZone.type |> *Int<32>)
    & specialize(zone |> DnsZone.references |> *Int<64>)
    & dns_name_precond(zone |> DnsZone.origin)
}

fn dns_name_precond(dns_name: Ptr) -> Bool {
    specialize(dns_name |> DnsName.length |> *Int<32>)
    & specialize(dns_name |> DnsName.labels |> *Int<32>)
    & specialize(dns_name |> DnsName.attrs |> *Int<16>) 
}

fn dns_name_precond_ext(dns_name: Ptr, ofs_idx: Int<32>) -> Bool {
    if ofs_idx <s 0w32 {
        true
    } else {
        let ofs = (dns_name |> DnsName.offsets |> *Ptr) |> Int<8>[ofs_idx] |> *Int<8>;
        specialize(ofs)
        & specialize((dns_name |> DnsName.ndata |> *Ptr) |> Int<8>[ofs] |> *Int<8>)
        & dns_name_precond_ext(dns_name, ofs_idx-1w32)
    }
}

fn dns_name_precond_full(dns_name: Ptr) -> Bool {
    let _ = dns_name_precond(dns_name);
    let _ = visit_dns_name(dns_name |> DnsName.ndata |> *Ptr, dns_name |> DnsName.length |> *Int<32>, true);
    dns_name_precond_ext(dns_name, dns_name |> DnsName.labels |> *Int<32> - 1w32)
}

fn dns_rbtnodechain_precond(chain: Ptr) -> Bool {
    specialize(chain |> DnsRbtnodechain.level_count |> *Int<32>)
}

fn dns_rbt_precond(rbt: Ptr) -> Bool {
    specialize(rbt |> DnsRbt.hindex |> *Int<8>)
    & specialize(rbt |> DnsRbt.hashbits |> Int<8>[0] |> *Int<8>)
    & specialize(rbt |> DnsRbt.hashbits |> Int<8>[1] |> *Int<8>)
}

fn dns_rbtdb_version_precond(version: Ptr) -> Bool {
    version == null 
    || (
        specialize(version |> DnsRbtdbVersion.serial |> *Int<32>)
        & specialize(version |> DnsRbtdbVersion.secure |> *Int<8>)
        & specialize(version |> DnsRbtdbVersion.havensec3 |> *Int<8>)
        & specialize(version |> DnsRbtdbVersion.flags |> *Int<8>)
    )
}

fn dns_rdata_precond(rdata: Ptr) -> Bool {
    specialize(rdata |> DnsRdata.type |> *Int<16>)
}

fn isc_buffer_precond(buf: Ptr) -> Bool {
    let _ = specialize(buf);
    buf == null ||
    (specialize(buf |> IscBuffer.length |> *Int<32>)
    & specialize(buf |> IscBuffer.dynamic |> *Int<8>))
}

fn dns_rdataset_precond(rdataset: Ptr) -> Bool {
    let _ = specialize(rdataset);
    rdataset == null ||
    (specialize(rdataset |> Int<8>[40] |> *Int<16>)     // trust
    & specialize(rdataset |> Int<8>[32] |> *Int<16>)    // rdclass
    & specialize(rdataset |> Int<8>[34] |> *Int<16>)    // type
    & specialize(rdataset |> Int<8>[44] |> *Int<32>))   // attributes
}

// function preconditions

fn ns_query_start_precond(client: Ptr, _: Ptr) -> Bool {
    ns_client_precond(client)
}

fn dns_message_reply_precond(msg: Ptr, _: Bool) -> Bool {
    dns_message_precond(msg)
}

fn ns__query_start_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn ns_query_done_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_gotanswer_precond(qctx: Ptr, result: Int<32>) -> Bool {
    let _ = specialize(result);
    qctx_precond(qctx)
}

fn query_prepresponse_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_notfound_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_delegation_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_nodata_precond(qctx: Ptr, result: Int<32>) -> Bool {
    qctx_precond(qctx)
    & specialize(result)
}

fn query_sign_nodata_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_nxdomain_precond(qctx: Ptr, result: Int<32>) -> Bool {
    qctx_precond(qctx)
    & specialize(result)
}

fn query_cname_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_dname_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_addcname_precond(
    qctx: Ptr,
    trust: Int<16>,
    ttl: Int<32>,
) -> Bool {
    qctx_precond(qctx)
}

fn query_addanswer_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_addsoa_precond(qctx: Ptr, overide_ttl: Int<32>, section: Int<32>) -> Bool {
    qctx_precond(qctx)
    & specialize(overide_ttl)
    & specialize(section)
}

fn query_addns_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_addauth_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_additional_precond(
    qctx: Ptr,
    name: Ptr,
    rdataset: Ptr,
) -> Bool {
    qctx_precond(qctx)
    & dns_name_precond(name)
}

fn query_zerottl_refetch_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_respond_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_addrrset_precond(
    qctx: Ptr,
    namep: Ptr,
    rdatasetp: Ptr,
    sigrdatasetp: Ptr,
    dbuf: Ptr,
    section: Int<32>,
) -> Bool {
    let rdataset = rdatasetp |> *Ptr;
    qctx_precond(qctx)
    & specialize(section)
    & dns_rdataset_precond(rdataset)
    & isc_buffer_precond(dbuf)
}

fn query_isduplicate_precond(
    client: Ptr,
    name: Ptr,
    type: Int<16>,
    mnamep: Ptr
) -> Bool {
    ns_client_precond(client)
    & dns_name_precond(name)
}

fn query_additional_cb_precond(
    arg: Ptr,
    name: Ptr,
    qtype: Int<16>,
    found: Ptr,
) -> Bool {
    qctx_precond(arg)
    & dns_name_precond(name)
}

fn query_getexpire_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn query_getcachedb_precond(
    client: Ptr, 
    name: Ptr, 
    qtype: Int<16>, 
    dbp: Ptr, 
    options: Int<32>
) -> Bool {
    ns_client_precond(client)
}

fn query_validatezonedb_precond(
    client: Ptr,
    name: Ptr,
    qtype: Int<16>,
    options: Int<32>,
    zone: Ptr,
    db: Ptr,
    versionp: Ptr,
) -> Bool {
    ns_client_precond(client)
    & dns_zone_precond(zone)
}

fn query_lookup_precond(qctx: Ptr) -> Bool {
    qctx_precond(qctx)
}

fn zone_find_precond(
    db: Ptr,
    name: Ptr,
    version: Ptr,
    type: Int<16>,
    options: Int<32>,
    now: Int<32>,
    nodep: Ptr,
    foundname: Ptr,
    rdataset: Ptr,
    sigrdataset: Ptr,
) -> Bool {
    specialize(options)
    & dns_name_precond(name)
    & dns_name_precond_ext(name, name |> DnsName.labels |> *Int<32> - 1w32)
    & dns_rbtdb_version_precond(version)
}

fn zone_findrdataset_precond(
    db: Ptr,
    node: Ptr,
    version: Ptr,
    type: Int<16>,
    covers: Int<16>,
    now: Int<32>,
    rdataset: Ptr,
    sigrdataset: Ptr,
) -> Bool {
    dns_rbtdb_version_precond(version)
}

fn dns__rbt_findnode_precond(
    rbt: Ptr,
    name: Ptr,
    foundname: Ptr,
    node: Ptr,
    chain: Ptr,
    options: Int<32>,
    callback: Ptr,
    callback_arg: Ptr,
) -> Bool {
    specialize(options)
    & dns_name_precond(name)
    & dns_name_precond_ext(name, name |> DnsName.labels |> *Int<32> - 1w32)
    & dns_rbtnodechain_precond(chain)
    & dns_rbt_precond(rbt)
}

fn ns_client_newdbversion_precond(_: Ptr, n: Int<32>) -> Bool {
    specialize(n)
}

fn dns_name_fullcompare_precond(name1: Ptr, name2: Ptr, orderp: Ptr, nlabelsp: Ptr) -> Bool {
    dns_name_precond(name1)
    & dns_name_precond(name2)
}

fn dns_name_equal_precond(name1: Ptr, name2: Ptr) -> Bool {
    dns_name_precond(name1)
    & dns_name_precond(name2)
}

fn dns_name_issubdomain_precond(name1: Ptr, name2: Ptr) -> Bool {
    dns_name_precond(name1)
    & dns_name_precond(name2)
}

fn dns_name_isabsolute_precond(name: Ptr) -> Bool {
    dns_name_precond(name)
}

fn dns_name_clone_precond(source: Ptr, target: Ptr) -> Bool {
    dns_name_precond(source)
}

fn dns_name_copy_precond(source: Ptr, dest: Ptr) -> Bool {
    dns_name_precond(source)
}

fn dns_name_dynamic_precond(name: Ptr) -> Bool {
    dns_name_precond(name)
}

fn dns_name_concatenate_precond(
    prefix: Ptr,
    suffix: Ptr,
    name: Ptr,
    target: Ptr,
) -> Bool {
    (prefix == null || dns_name_precond(prefix))
    & (suffix == null || dns_name_precond(suffix))
    & (name == null || dns_name_precond(name))
}

fn dns_name_fromregion_precond(
    name: Ptr,
    r: Ptr,
) -> Bool {
    dns_name_precond(name)
}

fn dns_name_getlabelsequence_precond(source: Ptr, first: Int<32>, n: Int<32>, target: Ptr) -> Bool {
    dns_name_precond(source)
    & specialize(first)
    & specialize(n)
}

fn dns_rbtnodechain_prev_precond(chain: Ptr, name: Ptr, origin: Ptr) -> Bool {
    dns_rbtnodechain_precond(chain)
}

fn dns_rbtnodechain_next_precond(chain: Ptr, name: Ptr, origin: Ptr) -> Bool {
    dns_rbtnodechain_precond(chain)
}

fn dns_rbtnodechain_current_precond(chain: Ptr, name: Ptr, origin: Ptr, node: Ptr) -> Bool {
    dns_rbtnodechain_precond(chain)
}

fn chain_name_precond(chain: Ptr, name: Ptr, _: Bool) -> Bool {
    dns_rbtnodechain_precond(chain)
}

fn dns_zone_gettype_precond(zone: Ptr) -> Bool {
    dns_zone_precond(zone)
}

fn dns__rbtdb_getoriginnode_precond(db: Ptr, nodep: Ptr) -> Bool {
    let origin = db |> Int<8>[24];
    dns_name_precond_full(origin)
}

fn dns_db_iszone_precond(db: Ptr) -> Bool {
    specialize(db |> Int<8>[16] |> *Int<16>)
}

fn dns_rdata_tostruct_precond(rdata: Ptr, target: Ptr, mctx: Ptr) -> Bool {
    dns_rdata_precond(rdata)
}

fn dns_rdata_freestruct_precond(p: Ptr) -> Bool {
    specialize(p |> Int<8>[2] |> *Int<16>)
}

fn dns_rdata_additionaldata_precond(rdata: Ptr, owner: Ptr, add: Ptr, arg: Ptr) -> Bool {
    dns_rdata_precond(rdata)
}

// ——————————
// Top Level
// ——————————

use @ns_query_start as fn bind_rrlookup(Ptr, Ptr);
use @query_reset as fn query_reset(Ptr, Bool);

struct Verdict {
    ok: Bool,
    bind: Response,
    model: Response,
}

fn verify_bind(
    client: Ptr, // &NsClient
    tree: Ptr, // &DnsRbt
) -> Verdict {

    // Move the `client` and `message` onto temporary heap regions;
    // also throw away `client->query.namebufs`.
    // This makes it so that any modifications during the query do not pass through as 
    // side effects.
    let message = client |> NsClient.message |> *Ptr;
    let _message: DnsMessage = havoc;
    let _message = alloc(_message);
    let _ = store(_message, message |> *DnsMessage);
    let message = _message;

    let _client: NsClient = havoc;
    let _client = alloc(_client);
    let _ = store(_client, client |> *NsClient);
    let nil = Link {
        prev: null,
        next: null,
    };
    let client = _client;
    let _ = store(client |> NsClient.query |> NsQuery.namebufs, nil);
    let _ = store(client |> NsClient.message, message);

    // Setup client->query.attributes
    let attr = 512w32; // SECURE
    let _ = store(client |> NsClient.query |> NsQuery.attributes, attr);
    
    let zone = into_zone(tree);
    // let _ = debug(zone);
    let query = into_query(message);
    let empty = Response {
        rcode: RCode.NOERROR,
        aa: true,
        answer: [],
        authority: [],
        additional: [],
    };

    // Verdict {
    //     ok: true,
    //     bind: empty,
    //     model: empty,
    // }

    if !valid_query(query, zone.origin) { // HACK
        // Non-valid queries are omitted
        Verdict {
            ok: true,
            bind: empty,
            model: empty,
        }
    } else {

        // Get model's response
        let resp = rrlookup(zone, query);

        // Get bind's response
        let _ = bind_rrlookup(
            client,
            havoc,
        );
        let impl_resp = into_response(message);
        let _ = query_reset(client, true); // ..ensure proper cleanup
        
        // Response equality means verification
        let ok = impl_resp.rcode == resp.rcode
        && impl_resp.aa == resp.aa
        && list_eq_by::<Record>(ordered(impl_resp.answer), ordered(resp.answer), compare_rr)
        && list_eq_by::<Record>(ordered(impl_resp.authority), ordered(resp.authority), compare_rr)
        && list_eq_by::<Record>(ordered(impl_resp.additional), ordered(resp.additional), compare_rr);

        if ok {
            Verdict {
                ok: true,
                bind: impl_resp,
                model: resp,
            }
        } else {
            Verdict {
                ok: false,
                bind: impl_resp,
                model: resp,
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

fn dedup_rrs(rrs: List<Record>) -> List<Record> {
    fold::<Record, List<Record>>(
        rrs,
        |deduped, rr| {
            if any::<Record>(deduped, |rr2| { compare_rr(rr, rr2) }) {
                deduped
            } else {
                deduped ++ [rr]
            }
        },
        [],
    )
}

fn valid_query(
    query: Query,
    origin: List<Int<8>>,
) -> Bool {
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

/// Make a Zone from a Bind `dns_rbt`.
/// Note that Bind stores non-root domain names as relative.
fn into_zone(tree: Ptr) -> Zone {
    let root = tree |> DnsRbt.root |> *Ptr;
    let orig_len = ((root |> DnsRbtNode.flags |> *Int<32>) shr 6w32) & 255w32;
    let _ = specialize(orig_len);
    let origin = visit_dns_name(root |> DnsRbtNode[1], orig_len, true);

    let all_rrs = visit_dns_rbtnode([], root);

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
    let empty_rrs = fold::<Record, List<Record>>(
        rrs,
        |acc, rr| {
            let suffixes = get_suffixes(rr.rname[..len(rr.rname)-len(origin)]);
            acc ++ map::<List<Int<8>>, Record>(
                suffixes,
                |suffix| {
                    Record {
                        rname: suffix ++ origin,
                        rtype: 0w16, // EMPTY
                        rdata: [],
                    }
                }
            )
        },
        []
    );

    Zone {
        origin: origin,
        rrs: dedup_rrs(rrs ++ empty_rrs),
        glue_rrs: dedup_rrs(glue_rrs),
    }
}

/// Make a Query from a Bind `dns_message`
fn into_query(message: Ptr) -> Query {
    let qsec = 0; // DNS_SECTION_QUESTION
    let dns_name = message |> DnsMessage.sections |> Link[qsec] |> Link.prev |> *Ptr;
    let qname_len = dns_name |> DnsName.length |> *Int<32>;
    let _ = specialize(qname_len);
    let qdataset = dns_name |> DnsName.list |> Link.prev |> *Ptr;

    let qname = visit_dns_name(dns_name |> DnsName.ndata |> *Ptr, qname_len, false);
    let qtype = qdataset |> Int<8>[34] |> *Int<16>;

    Query {
        qname: qname, 
        qtype: qtype,
        qcount: 0,
    }
}

/// Make a Response from a Bind `dns_message`
fn into_response(message: Ptr) -> Response {

    let rcode = into_dns_rcode(message |> DnsMessage.rcode |> *Int<16>);
    let aa = (message |> DnsMessage.flags |> *Int<32> & 1024w32) != 0w32;
    let _ = specialize(aa);
    let answer = visit_dns_message_section(message, 1);
    let authority = visit_dns_message_section(message, 2);
    let additional = visit_dns_message_section(message, 3);

    Response {
        rcode: rcode,
        aa: aa,
        answer: answer,
        authority: authority,
        additional: additional,
    }
}

/// Traverse a linked list, returning the elements as a `List` of pointers.
///
/// The next pointer is computed with `next`.
fn to_list(start: Ptr, next: (Ptr)->Ptr) -> List<Ptr> {
    let _ = specialize(start);
    if start == null {
        []
    } else {
        [start] ++ to_list(next(start), next)
    }
}

fn visit_dns_message_section(message: Ptr, section: Int) -> List<Record> {
    let ptrs = to_list(
        message |> DnsMessage.sections |> Link[section] |> Link.prev |> *Ptr,
        |p| { p |> DnsName.link |> Link.next |> *Ptr }
    );
    let rrs = fold::<Ptr, List<Record>>(
        ptrs,
        |records, cur| {
            let ndata = cur |> DnsName.ndata |> *Ptr;
            let length = cur |> DnsName.length |> *Int<32>;
            let rname = visit_dns_name(ndata, length, false);

            let rdatasets = to_list(
                cur |> DnsName.list |> Link.prev |> *Ptr,
                |p| { p |> DnsRdatasetSlab.link |> Link.next |> *Ptr }
            );
            records ++ fold::<Ptr, List<Record>>(
                rdatasets, 
                |acc, cur| {
                    let rtype = cur |> DnsRdatasetSlab.type |> *Int<16>;
                    let _ = specialize(rtype);
                    let slab = cur |> DnsRdatasetSlab.slab |> Int<8>[16] |> *Ptr;
                    let rdatas = if slab == null {
                        // This actually means the rdataset is a rdatalist..
                        let rdatalist = cur |> DnsRdatasetRdlist.rdlist |> DnsRdlist.list |> *Ptr;
                        let rdatas = to_list(
                            rdatalist |> DnsRdatalist.rdata |> Link.prev |> *Ptr,
                            |p| { p |> DnsRdata.link |> Link.next |> *Ptr }
                        );
                        map::<Ptr, List<Int<8>>>(
                            rdatas,
                            |p| {
                                let data = p |> DnsRdata.data |> *Ptr;
                                let length = p |> DnsRdata.length |> *Int<32>;
                                visit_dns_rdata(rtype, data, length, false)
                            }
                        )
                    } else {
                        let header = slab |> DnsSlabheader[-1];
                        // [ count: 2 bytes ] [ RDATA ]
                        let count = be_i16(slab);
                        visit_dns_slab_rdata(slab |> Int<8>[2], rtype, count)
                    };
                    acc ++ map::<List<Int<8>>, Record>(
                        rdatas,
                        |rdata| {
                            Record {
                                rname: rname,
                                rtype: rtype,
                                rdata: rdata,
                            }
                        }
                    )
                },
                [],
            )
        },
        [],
    );
    // Dedup manually, to emulate `dns_message_add`
    dedup_rrs(rrs)
}

fn visit_dns_name(p: Ptr, len: Int<32>, spec: Bool) -> List<Int<8>> {
    let _ = specialize(p);
    if len <=s 0w32 {
        []
    } else {
        let llen = p |> *Int<8>;
        let _ = specialize(llen);
        if llen == 0w8 {
            []
        } else {
            let label = visit_dns_label(p |> Int<8>[1], llen, spec);
            let llen = zext llen to Int<32>;
            label ++ [46w8] ++ visit_dns_name(p |> Int<8>[1w32+llen], len-1w32-llen, spec)
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

fn visit_dns_rbtnode(parentname: List<Int<8>>, node: Ptr) -> List<Record> {
    let _ = specialize(node);
    if node == null {
        []
    } else {
        let left = node |> DnsRbtNode.left |> *Ptr;
        let right = node |> DnsRbtNode.right |> *Ptr;
        let down = node |> DnsRbtNode.down |> *Ptr;
        let data = node |> DnsRbtNode.data |> *Ptr;

        let flags = node |> DnsRbtNode.flags |> *Int<32>;
        let _ = specialize(flags);
        let name_len = (flags shr 6w32) & 255w32;
        let rname = visit_dns_name(node |> DnsRbtNode[1], name_len, true) ++ parentname;

        visit_dns_slab(rname, data) 
        ++ visit_dns_rbtnode(parentname, left) 
        ++ visit_dns_rbtnode(rname, down) 
        ++ visit_dns_rbtnode(parentname, right) 
    }
}

fn be_i16(p: Ptr) -> Int<16> {
    let value = ((zext (p |> *Int<8>) to Int<16>) shl 8w16) + 
    (zext (p |> Int<8>[1] |> *Int<8>) to Int<16>);
    let _ = specialize(value);
    value
}

fn visit_dns_slab(rname: List<Int<8>>, slab: Ptr) -> List<Record> {
    let _ = specialize(slab);
    if slab == null {
        []
    } else {
        let rtype = trunc (slab |> DnsSlabheader.type |> *Int<32>) to Int<16>;
        let next = slab |> DnsSlabheader.next |> *Ptr;
        // let _ = specialize(rtype);
        let p = slab |> DnsSlabheader[1];

        // [ count: 2 bytes ] [ RDATA ]
        let count = be_i16(p);
        let rdatas = visit_dns_slab_rdata(p |> Int<8>[2], rtype, count);
        map::<List<Int<8>>, Record>(
            rdatas,
            |rdata| {
                Record {
                    rname: rname,
                    rtype: rtype,
                    rdata: rdata,
                }
            }
        ) ++ visit_dns_slab(rname, next)
    }
}

/// Visit the RDATA of a DNS slab => List of RDATA
fn visit_dns_slab_rdata(p: Ptr, rtype: Int<16>, count: Int<16>) -> List<List<Int<8>>> {
    let _ = specialize(p);
    if count <=s 0w16 {
        []
    } else {
        let len = zext be_i16(p) to Int<32>;
        let next = p |> Int<8>[2w32+len];
        let rdata = visit_dns_rdata(rtype, p |> Int<8>[2], len, true);
        [rdata] ++ visit_dns_slab_rdata(next, rtype, count-1w16)
    }
}

fn visit_dns_rdata(rtype: Int<16>, p: Ptr, len: Int<32>, spec: Bool) -> List<Int<8>> {
    if rtype == 2w16 {
        // [ data_len: 2 bytes ][ ns: dns_name ]
        visit_dns_name(p, len, spec)
    } else {
        if rtype == 15w16 {
            // [ data_len: 2 bytes ][ pref: 2 bytes ][ mx: dns_name ]
            visit_dns_name(p |> Int<8>[2], len-2w32, spec)
        } else {
            if rtype == 5w16 {
                // [ data_len: 2 bytes ][ cname: dns_name ]
                visit_dns_name(p, len, spec)
            } else {
                if rtype == 39w16 {
                    // [ data_len: 2 bytes ][ dname: dns_name ]
                    visit_dns_name(p, len, spec)
                } else {
                    if rtype == 33w16 {
                        // [ data_len: 2 bytes ][ _: 2 bytes ][ _: 2 bytes ][ _: 2 bytes ][ target: dns_name ]
                        visit_dns_name(p |> Int<8>[6], len-6w32, spec)
                    } else {
                        // [ data_len: 2 bytes ][ .. ]
                        []
                    }  
                }  
            }
        }
    }
}   

fn into_dns_rcode(rcode: Int<16>) -> RCode {
    let _ = specialize(rcode);
    if rcode == 0w16 {
        RCode.NOERROR
    } else {
        if rcode == 3w16 {
            RCode.NXDOMAIN
        } else {
            RCode.OTHER
        }
    }
}


// ——————————
// Reference Model
// ——————————

enum RCode {
    NOERROR,
    NXDOMAIN,
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
    rcode: RCode, 
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
            rcode: RCode.NOERROR, 
            aa: false,
            answer: [], 
            additional: glue_records, 
            authority: ns_records,
        }
    } else {
        let ans_records = filter::<Record>(relevant_rrs, |x| {x.rtype == query.qtype} );
        // Bind9 will include the apex NS records
        let apex_ns = filter::<Record>(zone.rrs, |rr| { 
            rr.rtype == 2w16
            && list_eq::<Int<8>>(rr.rname, zone.origin)
        });
        if len(ans_records) != 0 {
            let qtype = query.qtype;
            if qtype == 2w16 || qtype == 15w16 || qtype == 33w16 {
                // NS, MX and SRV records trigger additional handling
                let auth = if qtype == 2w16 { [] } else { apex_ns };
                Response {
                    rcode: RCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: additional(zone, ans_records ++ auth), 
                    authority: auth,
                }
            } else {
                Response {
                    rcode: RCode.NOERROR, 
                    aa: true,
                    answer: ans_records, 
                    additional: additional(zone, apex_ns),
                    authority: apex_ns,
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
                        rcode: RCode.NOERROR, 
                        aa: true,
                        answer: [cname], 
                        additional: additional(zone, apex_ns),
                        authority: apex_ns, 
                    }
                } else {
                    let query = Query {
                        qname: target,
                        qtype: query.qtype,
                        qcount: query.qcount + 1,
                    };
                    let resp = rrlookup(zone, query);
                    // Bind deduplicates records in the response:
                    // If the CNAME is the same across chasing the chain, only
                    // one is kept.
                    let dup = any::<Record>(
                        resp.answer,
                        |rr| { compare_rr(rr, cname) }
                    );
                    // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                    // a delegation after aliasing still has `AA` set.
                    Response {
                        rcode: resp.rcode,
                        aa: true,
                        answer: if dup { resp.answer } else { [cname] ++ resp.answer },
                        authority: resp.authority,
                        additional: resp.additional,
                    }
                }
            } else {
                let soa_records = filter::<Record>(zone.rrs, |x| {x.rtype == 6w16} );
                Response {
                    rcode: RCode.NOERROR, 
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
    // Bind will include the apex NS records
    let apex_ns = filter::<Record>(zone.rrs, |rr| { 
        rr.rtype == 2w16
        && list_eq::<Int<8>>(rr.rname, zone.origin)
    });
    if query.qcount >s 3 {
        // Break CNAME/DNAME loop
        Response {
            rcode: RCode.NOERROR,
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
                rcode: RCode.NXDOMAIN, 
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
                // TODO: wilcard DNAMEs?
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
                            rcode: RCode.NOERROR,
                            aa: true, 
                            answer: [dname, synthesized],
                            additional: additional(zone, apex_ns),
                            authority: apex_ns,
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
                        // Bind deduplicates records in the response:
                        // If the DNAME/synthesized CNAME is the same across chasing the chain, 
                        // only one is kept.
                        let dup1 = any::<Record>(
                            resp.answer,
                            |rr| { compare_rr(rr, dname) }
                        );
                        let dup2 = any::<Record>(
                            resp.answer,
                            |rr| { compare_rr(rr, synthesized) }
                        );
                        let answer = 
                            if dup1 { [] } else { [dname] } ++
                            if dup2 { [] } else { [synthesized] } ++
                            resp.answer;

                        // As per https://www.rfc-editor.org/rfc/rfc9499.pdf,
                        // a delegation after aliasing still has `AA` set.
                        Response {
                            rcode: resp.rcode,
                            aa: true,
                            answer: answer,
                            additional: resp.additional,
                            authority: resp.authority,
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
                                rcode: RCode.NOERROR, 
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
                                    rcode: RCode.NOERROR, 
                                    aa: true,
                                    answer: [],
                                    additional: [], 
                                    authority: soa_records, 
                                }
                            } else {
                                Response {
                                    rcode: RCode.NXDOMAIN, 
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
