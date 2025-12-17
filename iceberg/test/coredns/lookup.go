package coredns

import (
	// "bytes"
	"context"
	"net"
	// "strings"
)

func ctxValue()

type (
	// File is the plugin that reads zone data from disk.
	File struct {
		// Next Handler
		Zones
		// transfer *Transfer
	}

	// Zones maps zone names to a *Zone.
	// Zones struct {
	// 	Z     map[string]*Zone // A map mapping zone (origin) to the Zone's data
	// 	Names []string         // All the keys from the map Z as a string slice.
	// }
	Zones struct {
		Z	  []*Zone
	}
)

// -----------------------
// The main target
func (f File) ServeDNS(ctx context.Context, w ResponseWriter, r *Msg) (int, error) {
	state := Request{W: w, Req: r}

	qname := state.Name()
	// TODO(miek): match the qname better in the map
	z := Matches(f.Zones.Z, qname)

	if z == nil {
		return RcodeServerFailure, nil
	}

	// If transfer is not loaded, we'll see these, answer with refused (no transfer allowed).
	if state.QType() == TypeAXFR || state.QType() == TypeIXFR {
		return RcodeRefused, nil
	}

	// This is only for when we are a secondary zones.
	// if r.Opcode == OpcodeNotify {
	// 	if z.isNotify(state) {
	// 		m := new(dns.Msg)
	// 		m.SetReply(r)
	// 		m.Authoritative = true
	// 		w.WriteMsg(m)

	// 		log.Infof("Notify from %s for %s: checking transfer", state.IP(), zone)
	// 		ok, err := z.shouldTransfer()
	// 		if ok {
	// 			z.TransferIn()
	// 		} else {
	// 			log.Infof("Notify from %s for %s: no SOA serial increase seen", state.IP(), zone)
	// 		}
	// 		if err != nil {
	// 			log.Warningf("Notify from %s for %s: failed primary check: %s", state.IP(), zone, err)
	// 		}
	// 		return dns.RcodeSuccess, nil
	// 	}
	// 	log.Infof("Dropping notify from %s for %s", state.IP(), zone)
	// 	return dns.RcodeSuccess, nil
	// }

	// z.RLock()
	// exp := z.Expired
	// z.RUnlock()
	// if exp {
	// 	log.Errorf("Zone %s is expired", zone)
	// 	return dns.RcodeServerFailure, nil
	// }

	answer, ns, extra, result := z.Lookup(ctx, state, qname)

	m := new(Msg)
	m.SetReply(r)
	m.Authoritative = true
	m.Answer, m.Ns, m.Extra = answer, ns, extra

	switch result {
	case Success:
	case NoData:
	case NameError:
		m.Rcode = RcodeNameError
	case Delegation:
		m.Authoritative = false
	case ServerFailure:
		// If the result is SERVFAIL and the answer is non-empty, then the SERVFAIL came from an
		// external CNAME lookup and the answer contains the CNAME with no target record. We should
		// write the CNAME record to the client instead of sending an empty SERVFAIL response.
		if len(m.Answer) == 0 {
			return RcodeServerFailure, nil
		}
		//  The rcode in the response should be the rcode received from the target lookup. RFC 6604 section 3
		m.Rcode = RcodeServerFailure
	}

	// w.WriteMsg(m)

	// For simplicity, we just store the Msg into `r`,
	// which Iceberg can catch.
	*r = *m
	return RcodeSuccess, nil
}

// Matches checks if qname is a subdomain of any of the zones in z.  The match
// will return the most specific zones that matches. The empty string
// signals a not found condition.
func Matches(z []*Zone, qname string) *Zone {
	var zone *Zone
	zone = nil
	for _, pzone := range z {
		zname := pzone.origin
		if IsSubDomain(zname, qname) {
			// We want the *longest* matching zone, otherwise we may end up in a parent
			if zone == nil || len(zname) > len(zone.origin) {
				zone = pzone
			}
		}
	}
	return zone
}


func (z *Zone) Lookup(ctx context.Context, state Request, qname string) ([]RR, []RR, []RR, Result) {
	qtype := state.QType()
	do := state.Do()

	// If z is a secondary zone we might not have transferred it, meaning we have
	// all zone context setup, except the actual record. This means (for one thing) the apex
	// is empty and we don't have a SOA record.
	z.RLock()
	ap := z.Apex
	tr := z.Tree
	z.RUnlock()
	if ap.SOA == nil {
		return nil, nil, nil, ServerFailure
	}

	if qname == z.origin {
		switch qtype {
		case TypeSOA:
			return ap.soa(do), ap.ns(do), nil, Success
		case TypeNS:
			nsrrs := ap.ns(do)
			glue := tr.Glue(nsrrs, do) // technically this isn't glue
			return nsrrs, nil, glue, Success
		}
	}

	var (
		found, shot    bool
		parts          string
		i              int
		elem, wildElem *Elem
	)

	loop, _ := ctx.Value(LoopKey{}).(int)
	if loop > 8 {
		// We're back here for the 9th time; we have a loop and need to bail out.
		// Note the answer we're returning will be incomplete (more cnames to be followed) or
		// illegal (wildcard cname with multiple identical records). For now it's more important
		// to protect ourselves then to give the client a valid answer. We return with an error
		// to let the server handle what to do.
		return nil, nil, nil, ServerFailure
	}

	// Lookup:
	// * Per label from the right, look if it exists. We do this to find potential
	//   delegation records.
	// * If the per-label search finds nothing, we will look for the wildcard at the
	//   level. If found we keep it around. If we don't find the complete name we will
	//   use the wildcard.
	//
	// Main for-loop handles delegation and finding or not finding the qname.
	// If found we check if it is a CNAME/DNAME and do CNAME processing
	// We also check if we have type and do a nodata response.
	//
	// If not found, we check the potential wildcard, and use that for further processing.
	// If not found and no wildcard we will process this as an NXDOMAIN response.
	for {
		parts, shot = z.nameFromRight(qname, i)
		// We overshot the name, break and check if we previously found something.
		if shot {
			break
		}

		elem, found = tr.Search(parts)
		if !found {
			// Apex will always be found, when we are here we can search for a wildcard
			// and save the result of that search. So when nothing match, but we have a
			// wildcard we should expand the wildcard.

			wildcard := replaceWithAsteriskLabel(parts)
			if wild, found := tr.Search(wildcard); found {
				wildElem = wild
			}

			// Keep on searching, because maybe we hit an empty-non-terminal (which aren't
			// stored in the tree. Only when we have match the full qname (and possible wildcard
			// we can be confident that we didn't find anything.
			i++
			continue
		}

		// If we see DNAME records, we should return those.
		if dnamerrs := elem.Type(TypeDNAME); dnamerrs != nil {
			// Only one DNAME is allowed per name. We just pick the first one to synthesize from.
			dname := dnamerrs[0]
			if cname := synthesizeCNAME(state.Name(), dname.(*DNAME)); cname != nil {
				var (
					answer, ns, extra []RR
					rcode             Result
				)

				// We don't need to chase CNAME chain for synthesized CNAME
				if qtype == TypeCNAME {
					answer = []RR{cname}
					ns = ap.ns(do)
					extra = nil
					rcode = Success
				} else {
					ctx = context.WithValue(ctx, LoopKey{}, loop+1)
					answer, ns, extra, rcode = z.externalLookup(ctx, state, elem, []RR{cname})
				}

				if do {
					sigs := elem.Type(TypeRRSIG)
					sigs = SubTypeSignature(sigs, TypeDNAME)
					dnamerrs = append(dnamerrs, sigs...)
				}

				// The relevant DNAME RR should be included in the answer section,
				// if the DNAME is being employed as a substitution instruction.
				answer = append(dnamerrs, answer...)

				return answer, ns, extra, rcode
			}
			// The domain name that owns a DNAME record is allowed to have other RR types
			// at that domain name, except those have restrictions on what they can coexist
			// with (e.g. another DNAME). So there is nothing special left here.
		}

		// If we see NS records, it means the name as been delegated, and we should return the delegation.
		if nsrrs := elem.Type(TypeNS); nsrrs != nil {
			// If the query is specifically for DS and the qname matches the delegated name, we should
			// return the DS in the answer section and leave the rest empty, i.e. just continue the loop
			// and continue searching.
			if qtype == TypeDS && elem.Name() == qname {
				i++
				continue
			}

			glue := tr.Glue(nsrrs, do)
			if do {
				dss := typeFromElem(elem, TypeDS, do)
				nsrrs = append(nsrrs, dss...)
			}

			return nil, nsrrs, glue, Delegation
		}

		i++
	}

	// What does found and !shot mean - do we ever hit it?
	if found && !shot {
		return nil, nil, nil, ServerFailure
	}

	// Found entire name.
	if found && shot {
		if rrs := elem.Type(TypeCNAME); len(rrs) > 0 && qtype != TypeCNAME {
			ctx = context.WithValue(ctx, LoopKey{}, loop+1)
			return z.externalLookup(ctx, state, elem, rrs)
		}

		rrs := elem.Type(qtype)

		// NODATA
		if len(rrs) == 0 {
			ret := ap.soa(do)
			if do {
				nsec := typeFromElem(elem, TypeNSEC, do)
				ret = append(ret, nsec...)
			}
			return nil, ret, nil, NoData
		}

		// Additional section processing for MX, SRV. Check response and see if any of the names are in bailiwick -
		// if so add IP addresses to the additional section.
		additional := z.additionalProcessing(rrs, do)

		if do {
			sigs := elem.Type(TypeRRSIG)
			sigs = SubTypeSignature(sigs, qtype)
			rrs = append(rrs, sigs...)
		}

		return rrs, ap.ns(do), additional, Success
	}

	// Haven't found the original name.

	// Found wildcard.
	if wildElem != nil {
		// set metadata value for the wildcard record that synthesized the result
		SetValueFunc(ctx, "zone/wildcard", func() string {
			return wildElem.Name()
		})

		if rrs := wildElem.TypeForWildcard(TypeCNAME, qname); len(rrs) > 0 && qtype != TypeCNAME {
			ctx = context.WithValue(ctx, LoopKey{}, loop+1)
			return z.externalLookup(ctx, state, wildElem, rrs)
		}

		rrs := wildElem.TypeForWildcard(qtype, qname)

		// NODATA response.
		if len(rrs) == 0 {
			ret := ap.soa(do)
			if do {
				nsec := typeFromElem(wildElem, TypeNSEC, do)
				ret = append(ret, nsec...)
			}
			return nil, ret, nil, NoData
		}

		auth := ap.ns(do)
		if do {
			// An NSEC is needed to say no longer name exists under this wildcard.
			if deny, found := tr.Prev(qname); found {
				nsec := typeFromElem(deny, TypeNSEC, do)
				auth = append(auth, nsec...)
			}

			sigs := wildElem.TypeForWildcard(TypeRRSIG, qname)
			sigs = SubTypeSignature(sigs, qtype)
			rrs = append(rrs, sigs...)
		}
		return rrs, auth, nil, Success
	}

	rcode := NameError

	// Hacky way to get around empty-non-terminals. If a longer name does exist, but this qname, does not, it
	// must be an empty-non-terminal. If so, we do the proper NXDOMAIN handling, but set the rcode to be success.
	if x, found := tr.Next(qname); found {
		if IsSubDomain(qname, x.Name()) {
			rcode = Success
		}
	}

	ret := ap.soa(do)
	if do {
		deny, found := tr.Prev(qname)
		if !found {
			goto Out
		}
		nsec := typeFromElem(deny, TypeNSEC, do)
		ret = append(ret, nsec...)

		if rcode != NameError {
			goto Out
		}

		ce, found := z.ClosestEncloser(qname)

		// wildcard denial only for NXDOMAIN
		if found {
			// wildcard denial
			wildcard := "*." + ce.Name()
			if ss, found := tr.Prev(wildcard); found {
				// Only add this nsec if it is different than the one already added
				if ss.Name() != deny.Name() {
					nsec := typeFromElem(ss, TypeNSEC, do)
					ret = append(ret, nsec...)
				}
			}
		}
	}
Out:
	return nil, ret, nil, rcode
}

// -----------------------

/* Dependencies */

// Name returns the name of the question in the request. Note
// this name will always have a closing dot and will be lower cased. After a call Name
// the value will be cached. To clear this caching call Clear.
// If the request is malformed the root zone is returned.
func (r *Request) Name() string {
	if r.name != "" {
		return r.name
	}
	if r.Req == nil {
		r.name = "."
		return "."
	}
	if len(r.Req.Question) == 0 {
		r.name = "."
		return "."
	}

	r.name = StringsToLower(dnsName(r.Req.Question[0].Name).String())
	return r.name
}

// QType returns the type of the question as an uint16. If the request is malformed
// 0 is returned.
func (r *Request) QType() uint16 {
	if r.Req == nil {
		return 0
	}
	if len(r.Req.Question) == 0 {
		return 0
	}

	return r.Req.Question[0].Qtype
}

// Do returns true if the request has the DO (DNSSEC OK) bit set.
func (r *Request) Do() bool {
	if r.size != 0 {
		return r.do
	}

	r.Size()
	return r.do
}

// Size returns if buffer size *advertised* in the requests OPT record.
// Or when the request was over TCP, we return the maximum allowed size of 64K.
func (r *Request) Size() int {
	if r.size != 0 {
		return int(r.size)
	}

	size := uint16(0)
	if o := r.Req.IsEdns0(); o != nil {
		r.do = o.Do()
		size = o.UDPSize()
	}

	// normalize size
	size = /*edns.*/ Size(r.Proto(), size)
	r.size = size
	return int(size)
}

// Glue returns any potential glue records for nsrrs.
func (t *Tree) Glue(nsrrs [] /*dns.*/ RR, do bool) [] /*dns.*/ RR {
	glue := [] /*dns.*/ RR{}
	for _, rr := range nsrrs {
		if ns, ok := rr.(* /*dns.*/ NS); ok && /*dns.*/ IsSubDomain(ns.Header().Name, ns.Ns) {
			glue = append(glue, t.searchGlue(ns.Ns, do)...)
		}
	}
	return glue
}

// searchGlue looks up A and AAAA for name.
func (t *Tree) searchGlue(name string, do bool) [] /*dns.*/ RR {
	glue := [] /*dns.*/ RR{}

	// A
	if elem, found := t.Search(name); found {
		glue = append(glue, elem.Type( /*dns.*/ TypeA)...)
		if do {
			sigs := elem.Type( /*dns.*/ TypeRRSIG)
			sigs = /*rrutil.*/ SubTypeSignature(sigs /*dns.*/, TypeA)
			glue = append(glue, sigs...)
		}
	}

	// AAAA
	if elem, found := t.Search(name); found {
		glue = append(glue, elem.Type( /*dns.*/ TypeAAAA)...)
		if do {
			sigs := elem.Type( /*dns.*/ TypeRRSIG)
			sigs = /*rrutil.*/ SubTypeSignature(sigs /*dns.*/, TypeAAAA)
			glue = append(glue, sigs...)
		}
	}
	return glue
}

// Search returns the first match of qname in the Tree.
func (t *Tree) Search(qname string) (*Elem, bool) {
	if t.Root == nil {
		return nil, false
	}
	n, res := t.Root.search(qname)
	if n == nil {
		return nil, res
	}
	return n.Elem, res
}

// search searches the tree for qname and type.
func (n *Node) search(qname string) (*Node, bool) {
	for n != nil {
		switch c := Less(n.Elem, qname); {
		case c == 0:
			return n, true
		case c < 0:
			n = n.Left
		default:
			n = n.Right
		}
	}

	return n, false
}

// Prev returns the greatest value equal to or less than the qname according to Less().
func (t *Tree) Prev(qname string) (*Elem, bool) {
	if t.Root == nil {
		return nil, false
	}

	n := t.Root.floor(qname)
	if n == nil {
		return nil, false
	}
	return n.Elem, true
}

// Next returns the smallest value equal to or greater than the qname according to Less().
func (t *Tree) Next(qname string) (*Elem, bool) {
	if t.Root == nil {
		return nil, false
	}
	n := t.Root.ceil(qname)
	if n == nil {
		return nil, false
	}
	return n.Elem, true
}

// NameFromRight returns the labels from the right, staring with the
// origin and then i labels extra. When we are overshooting the name
// the returned boolean is set to true.
func (z *Zone) nameFromRight(qname string, i int) (string, bool) {
	if i <= 0 {
		return z.origin, false
	}

	for j := 1; j <= z.origLen; j++ {
		if _, shot := /*dns.*/ PrevLabel(qname, j); shot {
			return qname, shot
		}
	}

	k := 0
	var shot bool
	for j := 1; j <= i; j++ {
		k, shot = /*dns.*/ PrevLabel(qname, j+z.origLen)
		if shot {
			return qname, shot
		}
	}
	return qname[k:], false
}

// ClosestEncloser returns the closest encloser for qname.
func (z *Zone) ClosestEncloser(qname string) (* /*tree.*/ Elem, bool) {
	offset, end := /*dns.*/ NextLabel(qname, 0)
	for !end {
		elem, _ := z.Tree.Search(qname)
		if elem != nil {
			return elem, true
		}
		qname = qname[offset:]

		offset, end = /*dns.*/ NextLabel(qname, offset)
	}

	return z.Tree.Search(z.origin)
}

// replaceWithAsteriskLabel replaces the left most label with '*'.
func replaceWithAsteriskLabel(qname string) (wildcard string) {
	i, shot := /*dns.*/ NextLabel(qname, 0)
	if shot {
		return ""
	}

	return "*." + qname[i:]
}

// Type returns the RRs with type qtype from e.
func (e *Elem) Type(qtype uint16) [] /*dns.*/ RR { return e.m[qtype] }

// Name returns the name for this node.
func (e *Elem) Name() string {
	if e.name != "" {
		return e.name
	}

	// TODO: this is wicked - a getter method mutating states
	// yes it is a memoize trick, but since Elem is part of the configuration
	// this will not work for Iceberg.
	// Instead, when generating the config, make sure to pre-set e.name.

	for _, rrs := range e.m {
		e.name = rrs[0].Header().Name
		return e.name
	}
	return ""
}

// TypeForWildcard returns the RRs with type qtype from e. The ownername returned is set to qname.
func (e *Elem) TypeForWildcard(qtype uint16, qname string) [] /*dns.*/ RR {
	rrs := e.m[qtype]

	if rrs == nil {
		return nil
	}

	copied := make([] /*dns.*/ RR, len(rrs))
	for i := range rrs {
		copied[i] = /*dns.*/ Copy(rrs[i])
		copied[i].Header().Name = qname
	}
	return copied
}

// synthesizeCNAME returns a CNAME RR pointing to the resulting name of
// the DNAME substitution. The owner name of the CNAME is the QNAME of
// the query and the TTL is the same as the corresponding DNAME RR.
//
// It returns nil if the DNAME substitution has no match.
func synthesizeCNAME(qname string, d * /*dns.*/ DNAME) * /*dns.*/ CNAME {
	target := substituteDNAME(qname, d.Header().Name, d.Target)
	if target == "" {
		return nil
	}

	r := new( /*dns.*/ CNAME)
	r.Hdr = /*dns.*/ RR_Header{
		Name: qname,
		Rrtype:/*dns.*/ TypeCNAME,
		Class:/*dns.*/ ClassINET,
		Ttl: d.Header().Ttl,
	}
	r.Target = target

	return r
}

// SubTypeSignature returns the RRSIG for the subtype.
func SubTypeSignature(rrs [] /*dns.*/ RR, subtype uint16) [] /*dns.*/ RR {
	sigs := [] /*dns.*/ RR{}
	// there may be multiple keys that have signed this subtype
	for _, sig := range rrs {
		if s, ok := sig.(* /*dns.*/ RRSIG); ok {
			if s.TypeCovered == subtype {
				sigs = append(sigs, s)
			}
		}
	}
	return sigs
}

// md is metadata information storage.
// type md map[string]Func

// key defines the type of key that is used to save metadata into the context.
// type key struct{}

// SetValueFunc set the metadata label to the value function. If no metadata can be found this is a noop and
// false is returned. Any existing value is overwritten.
func SetValueFunc(ctx context.Context, label string, f func() string) bool {
	// if metadata := ctx.Value(key{}); metadata != nil {
	// 	if m, ok := metadata.(md); ok {
	// 		m[label] = f
	// 		return true
	// 	}
	// }
	return false
}

// typeFromElem returns the type tp from e and adds signatures (if they exist) and do is true.
func typeFromElem(elem *Elem, tp uint16, do bool) []RR {
	rrs := elem.Type(tp)
	if do {
		sigs := elem.Type(TypeRRSIG)
		sigs = SubTypeSignature(sigs, tp)
		rrs = append(rrs, sigs...)
	}
	return rrs
}

func (a Apex) soa(do bool) []RR {
	if do {
		ret := append([]RR{a.SOA}, a.SIGSOA...)
		return ret
	}
	return []RR{a.SOA}
}

func (a Apex) ns(do bool) []RR {
	if do {
		ret := append(a.NS, a.SIGNS...)
		return ret
	}
	return a.NS
}

// externalLookup adds signatures and tries to resolve CNAMEs that point to external names.
func (z *Zone) externalLookup(ctx context.Context, state Request, elem *Elem, rrs []RR) ([]RR, []RR, []RR, Result) {
	qtype := state.QType()
	do := state.Do()

	if do {
		sigs := elem.Type(TypeRRSIG)
		sigs = SubTypeSignature(sigs, TypeCNAME)
		rrs = append(rrs, sigs...)
	}

	targetName := rrs[0].(*CNAME).Target
	elem, _ = z.Tree.Search(targetName)
	if elem == nil {
		lookupRRs, result := z.doLookup(ctx, state, targetName, qtype)
		rrs = append(rrs, lookupRRs...)
		return rrs, z.Apex.ns(do), nil, result
	}

	i := 0

Redo:
	cname := elem.Type(TypeCNAME)
	if len(cname) > 0 {
		rrs = append(rrs, cname...)

		if do {
			sigs := elem.Type(TypeRRSIG)
			sigs = SubTypeSignature(sigs, TypeCNAME)
			rrs = append(rrs, sigs...)
		}
		targetName := cname[0].(*CNAME).Target
		elem, _ = z.Tree.Search(targetName)
		if elem == nil {
			lookupRRs, result := z.doLookup(ctx, state, targetName, qtype)
			rrs = append(rrs, lookupRRs...)
			return rrs, z.Apex.ns(do), nil, result
		}

		i++
		if i > 3 { //  This actually controls CNAME loop count
			return rrs, z.Apex.ns(do), nil, Success
		}

		goto Redo
	}

	targets := elem.Type(qtype)
	if len(targets) > 0 {
		rrs = append(rrs, targets...)

		if do {
			sigs := elem.Type(TypeRRSIG)
			sigs = SubTypeSignature(sigs, qtype)
			rrs = append(rrs, sigs...)
		}
	}

	return rrs, z.Apex.ns(do), nil, Success
}

func (z *Zone) doLookup(ctx context.Context, state Request, target string, qtype uint16) ([]RR, Result) {
	m, e := z.Upstream.Lookup(ctx, state, target, qtype)
	if e != nil {
		return nil, ServerFailure
	}
	if m == nil {
		return nil, Success
	}
	if m.Rcode == RcodeNameError {
		return m.Answer, NameError
	}
	if m.Rcode == RcodeServerFailure {
		return m.Answer, ServerFailure
	}
	if m.Rcode == RcodeSuccess && len(m.Answer) == 0 {
		return m.Answer, NoData
	}
	return m.Answer, Success
}

// additionalProcessing checks the current answer section and retrieves A or AAAA records
// (and possible SIGs) to need to be put in the additional section.
func (z *Zone) additionalProcessing(answer []RR, do bool) (extra []RR) {
	for _, rr := range answer {
		name := ""
		switch x := rr.(type) {
		case *SRV:
			name = x.Target
		case *MX:
			name = x.Mx
		}
		if len(name) == 0 || !IsSubDomain(z.origin, name) {
			continue
		}

		elem, _ := z.Tree.Search(name)
		if elem == nil {
			continue
		}

		sigs := elem.Type(TypeRRSIG)
		for _, addr := range []uint16{TypeA, TypeAAAA} {
			if a := elem.Type(addr); a != nil {
				extra = append(extra, a...)
				if do {
					sig := SubTypeSignature(sigs, addr)
					extra = append(extra, sig...)
				}
			}
		}
	}

	return extra
}

// IsSubDomain checks if child is indeed a child of the parent. If child and parent
// are the same domain true is returned as well.
func IsSubDomain(parent, child string) bool {
	// Entire child is contained in parent
	return CompareDomainName(parent, child) == CountLabel(parent)
}

// Lookup routes lookups to our selves to make it follow the plugin chain *again*, but with a (possibly) new query. As
// we are doing the query against ourselves again, there is no actual new hop, as such RFC 6891 does not apply and we
// need the EDNS0 option present in the *original* query to be present here too.
func (u *Upstream) Lookup(ctx context.Context, state /* request. */ Request, name string, typ uint16) (* /*dns.*/ Msg, error) {
	// server, ok := ctx.Value( /*dnsserver.*/ Key{}).(* /*dnsserver.*/ Server)
	file, _ := ctx.Value( /*dnsserver.*/ Key{}).(* /*dnsserver.*/ File)
	// if !ok {
	// 	return nil, fmt.Errorf("no full server is running")
	// }
	req := state.NewWithQuestion(name, typ)

	nw := /*nonwriter.*/ New(state.W)
	// server.ServeDNS(ctx, nw, req.Req)
	file.ServeDNS(ctx, nw, req.Req)

	// As Iceberg bypassed writers, 
	// capture the response manually

	// return nw.Msg, nil
	return req.Req, nil
}

func (n *Node) floor(qname string) *Node {
	if n == nil {
		return nil
	}
	switch c := Less(n.Elem, qname); {
	case c == 0:
		return n
	case c <= 0:
		return n.Left.floor(qname)
	default:
		if r := n.Right.floor(qname); r != nil {
			return r
		}
	}
	return n
}

func (n *Node) ceil(qname string) *Node {
	if n == nil {
		return nil
	}
	switch c := Less(n.Elem, qname); {
	case c == 0:
		return n
	case c > 0:
		return n.Right.ceil(qname)
	default:
		if l := n.Left.ceil(qname); l != nil {
			return l
		}
	}
	return n
}

// PrevLabel returns the index of the label when starting from the right and
// jumping n labels to the left.
// The bool start is true when the start of the string has been overshot.
// Also see NextLabel.
func PrevLabel(s string, n int) (i int, start bool) {
	if s == "" {
		return 0, true
	}
	if n == 0 {
		return len(s), false
	}

	l := len(s) - 1
	if s[l] == '.' {
		l--
	}

	for ; l >= 0 && n > 0; l-- {
		if s[l] != '.' {
			continue
		}
		j := l - 1
		for j >= 0 && s[j] == '\\' {
			j--
		}

		if (j-l)%2 == 0 {
			continue
		}

		n--
		if n == 0 {
			return l + 1, false
		}
	}

	return 0, n > 1
}

// NextLabel returns the index of the start of the next label in the
// string s starting at offset. A negative offset will cause a panic.
// The bool end is true when the end of the string has been reached.
// Also see PrevLabel.
func NextLabel(s string, offset int) (i int, end bool) {
	if s == "" {
		return 0, true
	}
	for i = offset; i < len(s)-1; i++ {
		if s[i] != '.' {
			continue
		}
		j := i - 1
		for j >= 0 && s[j] == '\\' {
			j--
		}

		if (j-i)%2 == 0 {
			continue
		}

		return i + 1, false
	}
	return i + 1, true
}

// Copy returns a new RR which is a deep-copy of r.
func Copy(r RR) RR { return r.copy() }

// SetReply creates a reply message from a request message.
func (dns *Msg) SetReply(request *Msg) *Msg {
	dns.Id = request.Id
	dns.Response = true
	dns.Opcode = request.Opcode
	if dns.Opcode == OpcodeQuery {
		dns.RecursionDesired = request.RecursionDesired // Copy rd bit
		dns.CheckingDisabled = request.CheckingDisabled // Copy cd bit
	}
	dns.Rcode = RcodeSuccess
	if len(request.Question) > 0 {
		dns.Question = make([]Question, 1)
		dns.Question[0] = request.Question[0]
	}
	return dns
}

// substituteDNAME performs the DNAME substitution defined by RFC 6672,
// assuming the QTYPE of the query is not DNAME. It returns an empty
// string if there is no match.
func substituteDNAME(qname, owner, target string) string {
	if /*dns.*/ IsSubDomain(owner, qname) && qname != owner {
		labels := /*dns.*/ SplitDomainName(qname)
		labels = append(labels[0:len(labels)- /*dns.*/ CountLabel(owner)] /*dns.*/, SplitDomainName(target)...)

		return /*dnsutil.*/ Join(labels...)
	}

	return ""
}

// CompareDomainName compares the names s1 and s2 and
// returns how many labels they have in common starting from the *right*.
// The comparison stops at the first inequality. The names are downcased
// before the comparison.
//
// www.miek.nl. and miek.nl. have two labels in common: miek and nl
// www.miek.nl. and www.bla.nl. have one label in common: nl
//
// s1 and s2 must be syntactically valid domain names.
func CompareDomainName(s1, s2 string) (n int) {
	// the first check: root label
	if s1 == "." || s2 == "." {
		return 0
	}

	l1 := Split(s1)
	l2 := Split(s2)

	j1 := len(l1) - 1 // end
	i1 := len(l1) - 2 // start
	j2 := len(l2) - 1
	i2 := len(l2) - 2
	// the second check can be done here: last/only label
	// before we fall through into the for-loop below
	if equal(s1[l1[j1]:], s2[l2[j2]:]) {
		n++
	} else {
		return
	}
	for {
		if i1 < 0 || i2 < 0 {
			break
		}
		if equal(s1[l1[i1]:l1[j1]], s2[l2[i2]:l2[j2]]) {
			n++
		} else {
			break
		}
		j1--
		i1--
		j2--
		i2--
	}
	return
}

// Split splits a name s into its label indexes.
// www.miek.nl. returns []int{0, 4, 9}, www.miek.nl also returns []int{0, 4, 9}.
// The root name (.) returns nil. Also see SplitDomainName.
// s must be a syntactically valid domain name.
func Split(s string) []int {
	if s == "." {
		return nil
	}
	idx := make([]int, 1, 3)
	off := 0
	end := false

	for {
		off, end = NextLabel(s, off)
		if end {
			return idx
		}
		idx = append(idx, off)
	}
}

// equal compares a and b while ignoring case. It returns true when equal otherwise false.
func equal(a, b string) bool {
	// might be lifted into API function.
	la := len(a)
	lb := len(b)
	if la != lb {
		return false
	}

	for i := la - 1; i >= 0; i-- {
		ai := a[i]
		bi := b[i]
		if ai >= 'A' && ai <= 'Z' {
			ai |= 'a' - 'A'
		}
		if bi >= 'A' && bi <= 'Z' {
			bi |= 'a' - 'A'
		}
		if ai != bi {
			return false
		}
	}
	return true
}

// CountLabel counts the number of labels in the string s.
// s must be a syntactically valid domain name.
func CountLabel(s string) (labels int) {
	if s == "." {
		return
	}
	off := 0
	end := false
	for {
		off, end = NextLabel(s, off)
		labels++
		if end {
			return
		}
	}
}

// SplitDomainName splits a name string into it's labels.
// www.miek.nl. returns []string{"www", "miek", "nl"}
// .www.miek.nl. returns []string{"", "www", "miek", "nl"},
// The root label (.) returns nil. Note that using
// strings.Split(s) will work in most cases, but does not handle
// escaped dots (\.) for instance.
// s must be a syntactically valid domain name, see IsDomainName.
func SplitDomainName(s string) (labels []string) {
	if s == "" {
		return nil
	}
	fqdnEnd := 0 // offset of the final '.' or the length of the name
	idx := Split(s)
	begin := 0
	if IsFqdn(s) {
		fqdnEnd = len(s) - 1
	} else {
		fqdnEnd = len(s)
	}

	switch len(idx) {
	case 0:
		return nil
	case 1:
		// no-op
	default:
		for _, end := range idx[1:] {
			labels = append(labels, s[begin:end-1])
			begin = end
		}
	}

	return append(labels, s[begin:fqdnEnd])
}

// IsFqdn checks if a domain name is fully qualified.
func IsFqdn(s string) bool {
	// Check for (and remove) a trailing dot, returning if there isn't one.
	if s == "" || s[len(s)-1] != '.' {
		return false
	}
	s = s[:len(s)-1]

	// If we don't have an escape sequence before the final dot, we know it's
	// fully qualified and can return here.
	if s == "" || s[len(s)-1] != '\\' {
		return true
	}

	// Otherwise we have to check if the dot is escaped or not by checking if
	// there are an odd or even number of escape sequences before the dot.
	i := StringsLastIndexFunc(s, func(r rune) bool {
		return r != '\\'
	})
	return (len(s)-i)%2 != 0
}

// Join joins labels to form a fully qualified domain name. If the last label is
// the root label it is ignored. Not other syntax checks are performed.
func Join(labels ...string) string {
	ll := len(labels)
	if labels[ll-1] == "." {
		return StringsJoin(labels[:ll-1], ".") + "."
	}
	return Fqdn(StringsJoin(labels, "."))
}

// IsEdns0 checks if the message has a EDNS0 (OPT) record, any EDNS0
// record in the additional section will do. It returns the OPT record
// found or nil.
func (dns *Msg) IsEdns0() *OPT {
	// RFC 6891, Section 6.1.1 allows the OPT record to appear
	// anywhere in the additional record section, but it's usually at
	// the end so start there.
	for i := len(dns.Extra) - 1; i >= 0; i-- {
		if dns.Extra[i].Header().Rrtype == TypeOPT {
			return dns.Extra[i].(*OPT)
		}
	}
	return nil
}

// UDPSize returns the UDP buffer size.
func (rr *OPT) UDPSize() uint16 {
	return rr.Hdr.Class
}

// Do returns the value of the DO (DNSSEC OK) bit.
func (rr *OPT) Do() bool {
	return rr.Hdr.Ttl&_DO == _DO
}

// Size returns a normalized size based on proto.
func Size(proto string, size uint16) uint16 {
	if proto == "tcp" {
		return MaxMsgSize
	}
	if size < MinMsgSize {
		return MinMsgSize
	}
	return size
}

// Proto gets the protocol used as the transport. This will be udp or tcp.
func (r *Request) Proto() string {
	if _, ok := r.W.RemoteAddr().(*net.UDPAddr); ok {
		return "udp"
	}
	if _, ok := r.W.RemoteAddr().(*net.TCPAddr); ok {
		return "tcp"
	}
	return "udp"
}

// Less is a tree helper function that calls less.
func Less(a *Elem, name string) int { return less(name, a.Name()) }

// less returns <0 when a is less than b, 0 when they are equal and
// >0 when a is larger than b.
// The function orders names in DNSSEC canonical order: RFC 4034s section-6.1
//
// See https://bert-hubert.blogspot.co.uk/2015/10/how-to-do-fast-canonical-ordering-of.html
// for a blog article on this implementation, although here we still go label by label.
//
// The values of a and b are *not* lowercased before the comparison!
func less(a, b string) int {
	i := 1
	aj := len(a)
	bj := len(b)
	for {
		ai, oka := /*dns.*/ PrevLabel(a, i)
		bi, okb := /*dns.*/ PrevLabel(b, i)
		if oka && okb {
			return 0
		}

		// sadly this []byte will allocate... TODO(miek): check if this is needed
		// for a name, otherwise compare the strings.
		ab := []byte(a[ai:aj])
		bb := []byte(b[bi:bj])
		doDDD(ab)
		doDDD(bb)

		res := BytesCompare(ab, bb)
		if res != 0 {
			return res
		}

		i++
		aj, bj = ai, bi
	}
}

func doDDD(b []byte) {
	lb := len(b)
	for i := 0; i < lb; i++ {
		if i+3 < lb && b[i] == '\\' && isDigit(b[i+1]) && isDigit(b[i+2]) && isDigit(b[i+3]) {
			b[i] = dddToByte(b[i:])
			for j := i + 1; j < lb-3; j++ {
				b[j] = b[j+3]
			}
			lb -= 3
		}
	}
}

func isDigit(b byte) bool     { return b >= '0' && b <= '9' }
func dddToByte(s []byte) byte { return (s[1]-'0')*100 + (s[2]-'0')*10 + (s[3] - '0') }

// NewWithQuestion returns a new request based on the old, but with a new question
// section in the request.
func (r *Request) NewWithQuestion(name string, typ uint16) Request {
	req1 := Request{W: r.W, Req: r.Req.Copy()}
	req1.Req.Question[0] = /*dns.*/ Question{Name: /*dns.*/ Fqdn(name), Qclass: /*dns.*/ ClassINET, Qtype: typ}
	return req1
}

// New makes and returns a new NonWriter.
func New(w ResponseWriter) *NonWriter { return &NonWriter{ResponseWriter: w} }

// Fqdn return the fully qualified domain name from s.
// If s is already fully qualified, it behaves as the identity function.
func Fqdn(s string) string {
	if IsFqdn(s) {
		return s
	}
	return s + "."
}

// Copy returns a new *Msg which is a deep-copy of dns.
func (dns *Msg) Copy() *Msg { return dns.CopyTo(new(Msg)) }

// CopyTo copies the contents to the provided message using a deep-copy and returns the copy.
func (dns *Msg) CopyTo(r1 *Msg) *Msg {
	r1.MsgHdr = dns.MsgHdr
	r1.Compress = dns.Compress

	if len(dns.Question) > 0 {
		// TODO(miek): Question is an immutable value, ok to do a shallow-copy
		r1.Question = cloneSlice(dns.Question)
	}

	rrArr := make([]RR, len(dns.Answer)+len(dns.Ns)+len(dns.Extra))
	r1.Answer, rrArr = rrArr[:0:len(dns.Answer)], rrArr[len(dns.Answer):]
	r1.Ns, rrArr = rrArr[:0:len(dns.Ns)], rrArr[len(dns.Ns):]
	r1.Extra = rrArr[:0:len(dns.Extra)]

	for _, r := range dns.Answer {
		r1.Answer = append(r1.Answer, r.copy())
	}

	for _, r := range dns.Ns {
		r1.Ns = append(r1.Ns, r.copy())
	}

	for _, r := range dns.Extra {
		r1.Extra = append(r1.Extra, r.copy())
	}

	return r1
}

// cloneSlice returns a shallow copy of s.
// [E any, S ~[]E] => Question, []Question
func cloneSlice(s []Question) []Question {
	if s == nil {
		return nil
	}
	return append([]Question(nil), s...)
}

type dnsName string

// String returns the string representation for the name n.
func (n dnsName) String() string {
	return sprintName(string(n))
}

func sprintName(s string) string {
	var dst StringsBuilder

	for i := 0; i < len(s); {
		if s[i] == '.' {
			if dst.Len() != 0 {
				dst.WriteByte('.')
			}
			i++
			continue
		}

		b, n := nextByte(s, i)
		if n == 0 {
			// Drop "dangling" incomplete escapes.
			if dst.Len() == 0 {
				return s[:i]
			}
			break
		}
		if isDomainNameLabelSpecial(b) {
			if dst.Len() == 0 {
				dst.Grow(len(s) * 2)
				dst.WriteString(s[:i])
			}
			dst.WriteByte('\\')
			dst.WriteByte(b)
		} else if b < ' ' || b > '~' { // unprintable, use \DDD
			if dst.Len() == 0 {
				dst.Grow(len(s) * 2)
				dst.WriteString(s[:i])
			}
			dst.WriteString(escapeByte(b))
		} else {
			if dst.Len() != 0 {
				dst.WriteByte(b)
			}
		}
		i += n
	}
	if dst.Len() == 0 {
		return s
	}
	return dst.String()
}

func nextByte(s string, offset int) (byte, int) {
	if offset >= len(s) {
		return 0, 0
	}
	if s[offset] != '\\' {
		// not an escape sequence
		return s[offset], 1
	}
	switch len(s) - offset {
	case 1: // dangling escape
		return 0, 0
	case 2, 3: // too short to be \ddd
	default: // maybe \ddd
		if isDDD2(s[offset+1:]) {
			return dddToByte2(s[offset+1:]), 4
		}
	}
	// not \ddd, just an RFC 1035 "quoted" character
	return s[offset+1], 2
}

// [T ~[]byte | ~string] => string
func isDDD2(s string) bool {
	return len(s) >= 3 && isDigit(s[0]) && isDigit(s[1]) && isDigit(s[2])
}

// [T ~[]byte | ~string] => string
func dddToByte2(s string) byte {
	_ = s[2] // bounds check hint to compiler; see golang.org/issue/14808
	return byte((s[0]-'0')*100 + (s[1]-'0')*10 + (s[2] - '0'))
}

// isDomainNameLabelSpecial returns true if
// a domain name label byte should be prefixed
// with an escaping backslash.
func isDomainNameLabelSpecial(b byte) bool {
	switch b {
	case '.', ' ', '\'', '@', ';', '(', ')', '"', '\\':
		return true
	}
	return false
}

const (
	escapedByteSmall = "" +
		`\000\001\002\003\004\005\006\007\008\009` +
		`\010\011\012\013\014\015\016\017\018\019` +
		`\020\021\022\023\024\025\026\027\028\029` +
		`\030\031`
	escapedByteLarge = `\127\128\129` +
		`\130\131\132\133\134\135\136\137\138\139` +
		`\140\141\142\143\144\145\146\147\148\149` +
		`\150\151\152\153\154\155\156\157\158\159` +
		`\160\161\162\163\164\165\166\167\168\169` +
		`\170\171\172\173\174\175\176\177\178\179` +
		`\180\181\182\183\184\185\186\187\188\189` +
		`\190\191\192\193\194\195\196\197\198\199` +
		`\200\201\202\203\204\205\206\207\208\209` +
		`\210\211\212\213\214\215\216\217\218\219` +
		`\220\221\222\223\224\225\226\227\228\229` +
		`\230\231\232\233\234\235\236\237\238\239` +
		`\240\241\242\243\244\245\246\247\248\249` +
		`\250\251\252\253\254\255`
)

// escapeByte returns the \DDD escaping of b which must
// satisfy b < ' ' || b > '~'.
func escapeByte(b byte) string {
	if b < ' ' {
		return escapedByteSmall[b*4 : b*4+4]
	}

	b -= '~' + 1
	// The cast here is needed as b*4 may overflow byte.
	return escapedByteLarge[int(b)*4 : int(b)*4+4]
}
