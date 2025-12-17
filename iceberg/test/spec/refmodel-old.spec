// !! [Deprecated]
// Require custom function in Meissa:
// filter_mask, forall, match_len, max, len, name_eq

enum RRType {
	SOA,
	NS,
	A,
	AAAA,
	CNAME,
	DNAME,
	TXT,
	MX,
    EMPTY,
    UNKNOWN,
}

enum RCode {
	NOERROR,
	NXDOMAIN,
}

// e.g. *.example.com
// List[Int]: "com", "example", "*"
// List[Lavel]: [3, 2, 1], where 3: "com", 2: "example", 1: "*"

struct Query {
	qname: List<Int>,
	qtype: RRType, 
}

struct ResourceRecord {
	rname: List<Int>, 
	rtype: RRType, 
	rdata: List<List<Int>>, 
}

struct Zone {
	zone_name: List<Int>, 
	rrs: List<ResourceRecord>, 
}

struct DNSResponse {
	rcode: RCode, 
	answer_mask: Int<64>, 
	flag_aa: Bool,
	additional_mask: Int<64>,
	authority_mask: Int<64>,
	// If true, the rname in answer section should be rewritten according to query.qname
    synthesized: Bool, 
}

fn is_prefix(rname: List<Int>, qname: List<Int>) -> Bool {
	if len::<Int>(rname) >S len::<Int>(qname) {
		false
	} else {
		if name_eq(rname, qname[0..len::<Int>(rname)]) { true } else { false }
	}
}

fn is_wild_card_domain (rr: ResourceRecord) -> Bool {
	let rname = rr.rname;
    let idx = (len::<Int>(rname) - 1);
    rname[idx] == 10 && rr.rtype != RRType.EMPTY
}

// From dnsutils.py
fn is_wild_card_match(rr: ResourceRecord, qname: List<Int>) -> Bool {
	let rname = rr.rname;
    if len::<Int>(rname) <=S len::<Int>(qname) {
		if is_wild_card_domain(rr) {
            let idx = (len::<Int>(rname) - 1);
			if qname[idx] != 10 {
				if name_eq(rname[0..idx], qname[0..idx]) { true } else { false }
			} else { false }
		} else { false }
	} else { false }
}

fn is_relevant_domain(rr: ResourceRecord, qname: List<Int>) -> Bool {
	let rname = rr.rname;
    if name_eq(rname, qname) {
        true
    } else {
        if is_wild_card_domain(rr) {
            is_wild_card_match(rr, qname)
        } else {
            is_prefix(rname, qname)
        }
    }
}

// cs.example.com    NS  ns0.xxx.com
fn is_ns_match_record(rrset: ResourceRecord, qname: List<Int>, zone_name: List<Int>) -> Bool {
    if rrset.rtype == RRType.NS {
        if !name_eq(rrset.rname, zone_name) {
            is_relevant_domain(rrset, qname)
        } else { false }
    } else { false }
}

fn filter_max_matches(rrs: List<ResourceRecord>, qname: List<Int>) -> Int<64> {
    let max_len = max::<ResourceRecord>(rrs, |rr| {match_len(rr.rname, qname)} );
    filter_mask::<ResourceRecord>(rrs, |rr| {match_len(rr.rname, qname) == max_len})
	
}


// From dnsauthoritative.py
fn get_relevant_rrs(
	query: Query,
    zone_name: List<Int>,
    rrs: List<ResourceRecord>
) -> Int<64> {
    let relevant_mask = filter_mask::<ResourceRecord>(rrs, |rr| {is_relevant_domain(rr, query.qname)} );
    if relevant_mask == 0w64 {
        // No relevant records found
    	0w64
    } else {
        let ns_match_mask = relevant_mask & filter_mask::<ResourceRecord>(rrs, |rr| {is_ns_match_record(rr, query.qname, zone_name)} );
    	if ns_match_mask == 0w64 {
			let max_mask = filter_max_matches(rrs, query.qname);
            let max_match_mask = (relevant_mask & max_mask);
			let wildcard_mask = filter_mask::<ResourceRecord>(rrs, |rr| {is_wild_card_match(rr, query.qname)} );
            let wildcard_match_mask = max_match_mask & wildcard_mask;
            if wildcard_match_mask == 0w64 {
				// return all max matched records
				max_match_mask
            } else {
                wildcard_match_mask
            }
        } else {
            // First matches NS records
            ns_match_mask
        }
    }
}


// returns glue records for NS results
fn delegation(ns_records_mask: Int<64>, all_records: List<ResourceRecord>) -> Int<64> {
    let parsing_records = filter_mask::<ResourceRecord>(all_records, |x| {(x.rtype == RRType.A) || (x.rtype == RRType.AAAA)} );
    let glue_records_mask = parsing_records & filter_mask::<ResourceRecord>(
		all_records, 
		|rr| {
			(ns_records_mask & filter_mask::<ResourceRecord>(
				all_records, 
				|y| { 
					!forall::<List<Int>>(y.rdata, |rd| {!name_eq(rd, rr.rname)} ) 
				} 
			)
		) != 0w64
	});
	glue_records_mask
    // Likely a bottleneck
}

fn exact_match(
	relevant_mask: Int<64>,
	query: Query,
	zone_records: List<ResourceRecord>,
    syn: Bool
) -> DNSResponse {
	let synthesized = syn;
    let ns_records_mask = relevant_mask & filter_mask::<ResourceRecord>(zone_records, |x| {x.rtype == RRType.NS} );
	if ((relevant_mask & filter_mask::<ResourceRecord>(zone_records, |x| {x.rtype == RRType.SOA} )) == 0w64) && (ns_records_mask != 0w64) {
		let glue_records_mask = delegation(ns_records_mask, zone_records);
		DNSResponse {
			rcode: RCode.NOERROR, 
			answer_mask: 0w64, 
			flag_aa: false,
			additional_mask: glue_records_mask, 
			authority_mask: ns_records_mask,
			synthesized: synthesized
		}
	} else {
        let ans_records_mask = relevant_mask & filter_mask::<ResourceRecord>(zone_records, |x| {x.rtype == query.qtype} );
		if ans_records_mask != 0w64 {
			if query.qtype == RRType.NS {
				// NS record triggers additional handling
				let delegated_mask = delegation(ans_records_mask, zone_records);
				DNSResponse {
					rcode: RCode.NOERROR, 
					answer_mask: ans_records_mask, 
					flag_aa: true,
					additional_mask: delegated_mask, 
					authority_mask: 0w64, 
					synthesized: synthesized 
				}
			} else {
				DNSResponse {
					rcode: RCode.NOERROR, 
					answer_mask: ans_records_mask, 
					flag_aa: true,
					additional_mask: 0w64, 
					authority_mask: 0w64, 
					synthesized: synthesized
				}
			}
		} else {
            let cname_mask = relevant_mask & filter_mask::<ResourceRecord>(zone_records, |x| {x.rtype == RRType.CNAME} );
			if cname_mask != 0w64 {
				DNSResponse { 
					rcode: RCode.NOERROR, 
					answer_mask: cname_mask, 
					flag_aa: true,
					additional_mask: 0w64, 
					authority_mask: 0w64, 
					synthesized: synthesized
				}
			} else {
				let soa_records_mask = filter_mask::<ResourceRecord>(zone_records, |x| {x.rtype == RRType.SOA} );
				DNSResponse {
					rcode: RCode.NOERROR, 
					answer_mask: 0w64, 
					flag_aa: true,
					additional_mask: 0w64, 
					authority_mask: soa_records_mask, 
					synthesized: synthesized
				}
			}
		}
	}
}


fn rrlookup(zone: Zone, query: Query) -> DNSResponse {
	let relevant_mask = get_relevant_rrs(query, zone.zone_name, zone.rrs);
	if relevant_mask == 0w64 {
		let soa_records_mask = filter_mask::<ResourceRecord>(zone.rrs, |x| {x.rtype == RRType.SOA} );
		DNSResponse { 
			rcode: RCode.NXDOMAIN, 
			answer_mask: 0w64, 
			flag_aa: true,
			additional_mask: 0w64, 
			authority_mask: soa_records_mask, 
			synthesized: false
		}
	} else {
        let equal_mask = filter_mask::<ResourceRecord>(zone.rrs, |x| {name_eq(x.rname, query.qname)} );
		if (relevant_mask & equal_mask) != 0w64 {
            exact_match(relevant_mask, query, zone.rrs, false)
        } else {
            let wildcard_match_mask = filter_mask::<ResourceRecord>(zone.rrs, |rr| {is_wild_card_match(rr, query.qname)} );
            if (relevant_mask & wildcard_match_mask) != 0w64 {
                exact_match(relevant_mask, query, zone.rrs, true)
            } else {
                let ns_mask = (relevant_mask & filter_mask::<ResourceRecord>(zone.rrs, |x| {x.rtype == RRType.NS} ));
                if ns_mask != 0w64 && (relevant_mask & filter_mask::<ResourceRecord>(zone.rrs, |x| {x.rtype == RRType.SOA} )) == 0w64 {
                    let glue_records_mask = delegation(ns_mask, zone.rrs);
                    DNSResponse { 
						rcode: RCode.NOERROR, 
						answer_mask: 0w64, 
						flag_aa: false,
                        additional_mask: glue_records_mask, 
						authority_mask: ns_mask, 
						synthesized: false
					}
                } else {
                    let soa_records_mask = filter_mask::<ResourceRecord>(zone.rrs, |x| {x.rtype == RRType.SOA} );
                    DNSResponse {
						rcode: RCode.NXDOMAIN, 
						answer_mask: 0w64, 
						flag_aa: true,
                        additional_mask: 0w64, 
						authority_mask: soa_records_mask, 
						synthesized: false
					}
                }
            }
        }
	}
}

enum CheckResult {
	MATCH,
	ADDITIONALLOSS,
	UNIDENTIFIED,
}

fn check_rrlookup(zone: Zone, query: Query, resp: DNSResponse) -> CheckResult {
	let model_resp = rrlookup(zone, query);
	let mask = ((resp.additional_mask) | (model_resp.additional_mask));
	if ((resp.rcode == model_resp.rcode) && (resp.flag_aa == model_resp.flag_aa) && (resp.authority_mask == model_resp.authority_mask) && (resp.answer_mask == model_resp.answer_mask) && (mask == model_resp.additional_mask)) {
		if resp.additional_mask == model_resp.additional_mask {
			CheckResult.MATCH
		} else {
			CheckResult.ADDITIONALLOSS
		}
	} else {
		CheckResult.UNIDENTIFIED
	}
}