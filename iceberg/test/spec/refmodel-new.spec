// ----
// Library
// ----

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

// ----
// Model
// ----
// The standard DNS reference model, modelling the domain name
// as a list of labels.

enum DnsRRType {
    SOA,
    NS,
    A,
    AAAA,
    CNAME,
    DNAME,
    TXT,
    MX,
    EMPTY,
    RRSIG,
    DS,
    NSEC,
    OPT,
    OTHER,
}

enum DnsRCode {
    NOERROR,
    NXDOMAIN,
}

// The wild card ASCII code
fn wild_card_code() -> Int<8> { 42w8 }

// The dot ASCII code
fn dot_code() -> Int<8> { 46w8 }

struct DnsQuery {
    qname: List<Int<8>>,
    qtype: DnsRRType, 
}

struct DnsRecord {
    rname: List<Int<8>>,
    rtype: DnsRRType, 
    rdata: List<Int<8>>,
}

struct DnsZone {
    zone_name: List<Int<8>>,
    rrs: List<DnsRecord>, 
}

struct DnsResponse {
    rcode: DnsRCode, 
    flag_aa: Bool, 
    answer: List<DnsRecord>,
    additional: List<DnsRecord>,
    authority: List<DnsRecord>,
}

fn is_parent (rname: List<Int<8>>, qname: List<Int<8>>) -> Bool {
    let rlen = len(rname);
    let qlen = len(qname);
    rlen <=s qlen                                                // `qname` is not shorter
    && list_eq::<Int<8>>(rname, qname[qlen-rlen..])                       // `rname` is a suffix of `qname`
    && (qlen == rlen || qname[qlen-rlen-1] == dot_code())       // `qname` has a dot right before that
}

fn is_wild_card_domain (rr: DnsRecord) -> Bool {
    let rname = rr.rname;
    rname[0] == wild_card_code() 
    && rname[1] == dot_code()               // `rname` starts with "*."
    && rr.rtype != DnsRRType.EMPTY          // `rr` is not an empty non-terminal
}

fn is_wild_card_match(rr: DnsRecord, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    let rlen = len(rname);
    let qlen = len(qname);
    rlen >s qlen                                                // `rname` is not shorter
    && is_wild_card_domain(rr)                                  // `rr` is wildcard
    && list_eq::<Int<8>>(rname[1..], qname[qlen-rlen+1..])         // `rname`, barring the "*", is a suffix of `qname`
    && (qname[qlen-rlen] != wild_card_code() 
    || qlen >s rlen && qname[qlen-rlen-1] != dot_code())        // `qname` does not also have exactly a "*" label at the position of the wildcard  
}

fn is_relevant_domain(rr: DnsRecord, qname: List<Int<8>>) -> Bool {
    let rname = rr.rname;
    if is_wild_card_domain(rr) {
        list_eq::<Int<8>>(rname, qname)
        || is_wild_card_match(rr, qname)        // `qname` is wildcard match
    } else {
        is_parent(rname, qname)                 // `qname` is a subdomain
    }
}

fn is_ns_match_record(rr: DnsRecord, qname: List<Int<8>>, zone_name: List<Int<8>>) -> Bool {
    rr.rtype == DnsRRType.NS                        // `rr` is NS
    && !list_eq::<Int<8>>(rr.rname, zone_name)      // `rr` is not the origin name
    && is_relevant_domain(rr, qname)                // `qname` is relevant for `rr`
}

struct DnsRecordMatch {
    record: DnsRecord,
    len: Int,
}
fn filter_max_matches(rrs: List<DnsRecord>, qname: List<Int<8>>) -> List<DnsRecord> {
    let matches = map::<DnsRecord, DnsRecordMatch>(
        rrs, 
        |rr| {
            DnsRecordMatch {
                record: rr,
                len: list_cmp::<Int<8>>(rr.rname, qname),
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
    zone_name: List<Int<8>>,
    rrs: List<DnsRecord>
) -> List<DnsRecord> {
    let relevant_rrs = filter::<DnsRecord>(rrs, |rr| {is_relevant_domain(rr, query.qname)} );
    if len(relevant_rrs) == 0 { 
        // No relevant records found
        []
    } else {
        let ns_match_rrs = filter::<DnsRecord>(relevant_rrs, |rr| {is_ns_match_record(rr, query.qname, zone_name)} );
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

// Get the glue records for NS results
fn delegation(ns_records: List<DnsRecord>, all_records: List<DnsRecord>) -> List<DnsRecord> {
    let parsing_records = filter::<DnsRecord>(all_records, |x| {(x.rtype == DnsRRType.A) || (x.rtype == DnsRRType.AAAA)} );
    let glue_records = filter::<DnsRecord>(
        parsing_records, 
        |rr| {
            any::<DnsRecord>(
                ns_records, 
                |ns_rr| { list_eq::<Int<8>>(ns_rr.rdata, rr.rname) } 
            )
        }
    );
    glue_records
}

fn exact_match(
    relevant_rrs: List<DnsRecord>,
    query: DnsQuery,
    zone_records: List<DnsRecord>,
) -> DnsResponse {
    let ns_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == DnsRRType.NS} );
    if all::<DnsRecord>(relevant_rrs, |x| {x.rtype != DnsRRType.SOA}) 
        && len(ns_records) != 0 
    {
        let glue_records = delegation(ns_records, zone_records);
        DnsResponse {
            rcode: DnsRCode.NOERROR, 
            flag_aa: false,
            answer: [], 
            additional: glue_records, 
            authority: ns_records,
        }
    } else {
        let ans_records = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == query.qtype} );
        if len(ans_records) != 0 {
            if query.qtype == DnsRRType.NS {
                // NS record triggers additional handling
                let delegated = delegation(ans_records, zone_records);
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    flag_aa: true,
                    answer: ans_records, 
                    additional: delegated, 
                    authority: [], 
                }
            } else {
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    flag_aa: true,
                    answer: ans_records, 
                    additional: [], 
                    authority: [], 
                }
            }
        } else {
            let cname_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == DnsRRType.CNAME} );
            if len(cname_rrs) != 0 {
                DnsResponse { 
                    rcode: DnsRCode.NOERROR, 
                    flag_aa: true,
                    answer: cname_rrs, 
                    additional: [], 
                    authority: [], 
                }
            } else {
                let soa_records = filter::<DnsRecord>(zone_records, |x| {x.rtype == DnsRRType.SOA} );
                DnsResponse {
                    rcode: DnsRCode.NOERROR, 
                    flag_aa: true,
                    answer: [], 
                    additional: [], 
                    authority: soa_records, 
                }
            }
        }
    }
}

fn rrlookup(zone: DnsZone, query: DnsQuery) -> DnsResponse {
    let relevant_rrs = get_relevant_rrs(query, zone.zone_name, zone.rrs);
    if len(relevant_rrs) == 0 {
        let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == DnsRRType.SOA} );
        DnsResponse { 
            rcode: DnsRCode.NXDOMAIN, 
            flag_aa: true,
            answer: [], 
            additional: [], 
            authority: soa_records, 
        }
    } else {
        if any::<DnsRecord>(relevant_rrs, |x| {list_eq::<Int<8>>(x.rname, query.qname)}) {
            exact_match(relevant_rrs, query, zone.rrs)
        } else {
            if any::<DnsRecord>(relevant_rrs, |rr| {is_wild_card_match(rr, query.qname)}) {
                exact_match(relevant_rrs, query, zone.rrs) // HACK: the wildcard name is NOT rewritten
            } else {
                let ns_rrs = filter::<DnsRecord>(relevant_rrs, |x| {x.rtype == DnsRRType.NS} );
                let soa_records = filter::<DnsRecord>(zone.rrs, |x| {x.rtype == DnsRRType.SOA} );
                if len(ns_rrs) != 0 && len(soa_records) == 0 {
                    let glue_records = delegation(ns_rrs, zone.rrs);
                    DnsResponse { 
                        rcode: DnsRCode.NOERROR, 
                        flag_aa: false,
                        answer: [], 
                        additional: glue_records, 
                        authority: ns_rrs, 
                    }
                } else {
                    DnsResponse {
                        rcode: DnsRCode.NXDOMAIN, 
                        flag_aa: true,
                        answer: [],
                        additional: [], 
                        authority: soa_records, 
                    }
                }
            }
        }
    }
}
