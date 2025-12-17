package coredns

import (
	"context"
	"net"
	"net/http"
	"sync"
	"time"
)

// A ResponseWriter interface is used by an DNS handler to
// construct an DNS response.
type ResponseWriter interface {
	// LocalAddr returns the net.Addr of the server
	LocalAddr() net.Addr
	// RemoteAddr returns the net.Addr of the client that sent the current request.
	RemoteAddr() net.Addr
	// WriteMsg writes a reply back to the client.
	WriteMsg(*Msg) error
	// Write writes a raw buffer back to the client.
	Write([]byte) (int, error)
	// Close closes the connection.
	Close() error
	// TsigStatus returns the status of the Tsig.
	TsigStatus() error
	// TsigTimersOnly sets the tsig timers only boolean.
	TsigTimersOnly(bool)
	// Hijack lets the caller take over the connection.
	// After a call to Hijack(), the DNS package will not do anything with the connection.
	Hijack()
}

// Msg contains the layout of a DNS message.
type Msg struct {
	MsgHdr
	Compress bool       `json:"-"` // If true, the message will be compressed when converted to wire format.
	Question []Question // Holds the RR(s) of the question section.
	Answer   []RR       // Holds the RR(s) of the answer section.
	Ns       []RR       // Holds the RR(s) of the authority section.
	Extra    []RR       // Holds the RR(s) of the additional section.
}

// MsgHdr is a a manually-unpacked version of (id, bits).
type MsgHdr struct {
	Id                 uint16
	Response           bool
	Opcode             int
	Authoritative      bool
	Truncated          bool
	RecursionDesired   bool
	RecursionAvailable bool
	Zero               bool
	AuthenticatedData  bool
	CheckingDisabled   bool
	Rcode              int
}

// An RR represents a resource record.
type RR interface {
	// Header returns the header of an resource record. The header contains
	// everything up to the rdata.
	Header() *RR_Header
	// String returns the text representation of the resource record.
	// String() string

	// copy returns a copy of the RR
	copy() RR

	// len returns the length (in octets) of the compressed or uncompressed RR in wire format.
	//
	// If compression is nil, the uncompressed size will be returned, otherwise the compressed
	// size will be returned and domain names will be added to the map for future compression.
	// len(off int, compression map[string]struct{}) int

	// pack packs the records RDATA into wire format. The header will
	// already have been packed into msg.
	// pack(msg []byte, off int, compression compressionMap, compress bool) (off1 int, err error)

	// unpack unpacks an RR from wire format.
	//
	// This will only be called on a new and empty RR type with only the header populated. It
	// will only be called if the record's RDATA is non-empty.
	// unpack(msg []byte, off int) (off1 int, err error)

	// parse parses an RR from zone file format.
	//
	// This will only be called on a new and empty RR type with only the header populated.
	// parse(c *zlexer, origin string) *ParseError

	// isDuplicate returns whether the two RRs are duplicates.
	// isDuplicate(r2 RR) bool
}

// RR_Header is the header all DNS resource records share.
type RR_Header struct {
	Name     string `dns:"cdomain-name"`
	Rrtype   uint16
	Class    uint16
	Ttl      uint32
	Rdlength uint16 // Length of data after header.
}

// Header returns itself. This is here to make RR_Header implements the RR interface.
func (h *RR_Header) Header() *RR_Header { return h }

// Just to implement the RR interface.
func (h *RR_Header) copy() RR { return nil }

// compressionMap is used to allow a more efficient compression map
// to be used for internal packDomainName calls without changing the
// signature or functionality of public API.
//
// In particular, map[string]uint16 uses 25% less per-entry memory
// than does map[string]int.
type compressionMap struct {
	ext map[string]int    // external callers
	int map[string]uint16 // internal callers
}

// Question holds a DNS question. Usually there is just one. While the
// original DNS RFCs allow multiple questions in the question section of a
// message, in practice it never works. Because most DNS servers see multiple
// questions as an error, it is recommended to only have one question per
// message.
type Question struct {
	Name   string `dns:"cdomain-name"` // "cdomain-name" specifies encoding (and may be compressed)
	Qtype  uint16
	Qclass uint16
}

// Config configuration for a single server.
type Config struct {
	// The zone of the site.
	Zone string

	// one or several hostnames to bind the server to.
	// defaults to a single empty string that denote the wildcard address
	ListenHosts []string

	// The port to listen on.
	Port string

	// Root points to a base directory we find user defined "things".
	// First consumer is the file plugin to looks for zone files in this place.
	Root string

	// Debug controls the panic/recover mechanism that is enabled by default.
	Debug bool

	// Stacktrace controls including stacktrace as part of log from recover mechanism, it is disabled by default.
	Stacktrace bool

	// The transport we implement, normally just "dns" over TCP/UDP, but could be
	// DNS-over-TLS or DNS-over-gRPC.
	Transport string

	// If this function is not nil it will be used to inspect and validate
	// HTTP requests. Although this isn't referenced in-tree, external plugins
	// may depend on it.
	HTTPRequestValidateFunc func(*http.Request) bool

	// FilterFuncs is used to further filter access
	// to this handler. E.g. to limit access to a reverse zone
	// on a non-octet boundary, i.e. /17
	FilterFuncs []FilterFunc

	// ViewName is the name of the Viewer PLugin defined in the Config
	ViewName string

	// TLSConfig when listening for encrypted connections (gRPC, DNS-over-TLS).
	// TLSConfig *tls.Config

	// Timeouts for TCP, TLS and HTTPS servers.
	ReadTimeout  time.Duration
	WriteTimeout time.Duration
	IdleTimeout  time.Duration

	// TSIG secrets, [name]key.
	TsigSecret map[string]string

	// Plugin stack.
	Plugin [] /*plugin.*/ Plugin

	// Compiled plugin stack.
	pluginChain/*plugin.*/ Handler

	// Plugin interested in announcing that they exist, so other plugin can call methods
	// on them should register themselves here. The name should be the name as return by the
	// Handler's Name method.
	registry map[string] /*plugin.*/ Handler

	// firstConfigInBlock is used to reference the first config in a server block, for the
	// purpose of sharing single instance of each plugin among all zones in a server block.
	firstConfigInBlock *Config

	// metaCollector references the first MetadataCollector plugin, if one exists
	metaCollector MetadataCollector
}

// FilterFunc is a function that filters requests from the Config
type FilterFunc func(context.Context, * /*request.*/ Request) bool

// MetadataCollector is a plugin that can retrieve metadata functions from all metadata providing plugins
type MetadataCollector interface {
	Collect(context.Context /*request.*/, Request) context.Context
}

type (
	// Plugin is a middle layer which represents the traditional
	// idea of plugin: it chains one Handler to the next by being
	// passed the next Handler in the chain.
	Plugin func(Handler) Handler

	// Handler is like dns.Handler except ServeDNS may return an rcode
	// and/or error.
	//
	// If ServeDNS writes to the response body, it should return a status
	// code. CoreDNS assumes *no* reply has yet been written if the status
	// code is one of the following:
	//
	// * SERVFAIL (dns.RcodeServerFailure)
	//
	// * REFUSED (dns.RecodeRefused)
	//
	// * FORMERR (dns.RcodeFormatError)
	//
	// * NOTIMP (dns.RcodeNotImplemented)
	//
	// All other response codes signal other handlers above it that the
	// response message is already written, and that they should not write
	// to it also.
	//
	// If ServeDNS encounters an error, it should return the error value
	// so it can be logged by designated error-handling plugin.
	//
	// If writing a response after calling another ServeDNS method, the
	// returned rcode SHOULD be used when writing the response.
	//
	// If handling errors after calling another ServeDNS method, the
	// returned error value SHOULD be logged or handled accordingly.
	//
	// Otherwise, return values should be propagated down the plugin
	// chain by returning them unchanged.
	Handler interface {
		ServeDNS(context.Context /*dns.*/, ResponseWriter, * /*dns.*/ Msg) (int, error)
		Name() string
	}

	// HandlerFunc is a convenience type like dns.HandlerFunc, except
	// ServeDNS returns an rcode and an error. See Handler
	// documentation for more information.
	HandlerFunc func(context.Context /*dns.*/, ResponseWriter, * /*dns.*/ Msg) (int, error)
)

// Request contains some connection state and is useful in plugin.
type Request struct {
	Req * /*dns.*/ Msg
	W/*dns.*/ ResponseWriter

	// Optional lowercased zone of this query.
	Zone string

	// Cache size after first call to Size or Do. If size is zero nothing has been cached yet.
	// Both Size and Do set these values (and cache them).
	size uint16 // UDP buffer size, or 64K in case of TCP.
	do   bool   // DNSSEC OK value

	// Caches
	family    int8   // transport's family.
	name      string // lowercase qname.
	ip        string // client's ip.
	port      string // client's port.
	localPort string // server's port.
	localIP   string // server's ip.
}

// Wire constants and supported types.
const (
	// valid RR_Header.Rrtype and Question.qtype

	TypeNone       uint16 = 0
	TypeA          uint16 = 1
	TypeNS         uint16 = 2
	TypeMD         uint16 = 3
	TypeMF         uint16 = 4
	TypeCNAME      uint16 = 5
	TypeSOA        uint16 = 6
	TypeMB         uint16 = 7
	TypeMG         uint16 = 8
	TypeMR         uint16 = 9
	TypeNULL       uint16 = 10
	TypePTR        uint16 = 12
	TypeHINFO      uint16 = 13
	TypeMINFO      uint16 = 14
	TypeMX         uint16 = 15
	TypeTXT        uint16 = 16
	TypeRP         uint16 = 17
	TypeAFSDB      uint16 = 18
	TypeX25        uint16 = 19
	TypeISDN       uint16 = 20
	TypeRT         uint16 = 21
	TypeNSAPPTR    uint16 = 23
	TypeSIG        uint16 = 24
	TypeKEY        uint16 = 25
	TypePX         uint16 = 26
	TypeGPOS       uint16 = 27
	TypeAAAA       uint16 = 28
	TypeLOC        uint16 = 29
	TypeNXT        uint16 = 30
	TypeEID        uint16 = 31
	TypeNIMLOC     uint16 = 32
	TypeSRV        uint16 = 33
	TypeATMA       uint16 = 34
	TypeNAPTR      uint16 = 35
	TypeKX         uint16 = 36
	TypeCERT       uint16 = 37
	TypeDNAME      uint16 = 39
	TypeOPT        uint16 = 41 // EDNS
	TypeAPL        uint16 = 42
	TypeDS         uint16 = 43
	TypeSSHFP      uint16 = 44
	TypeIPSECKEY   uint16 = 45
	TypeRRSIG      uint16 = 46
	TypeNSEC       uint16 = 47
	TypeDNSKEY     uint16 = 48
	TypeDHCID      uint16 = 49
	TypeNSEC3      uint16 = 50
	TypeNSEC3PARAM uint16 = 51
	TypeTLSA       uint16 = 52
	TypeSMIMEA     uint16 = 53
	TypeHIP        uint16 = 55
	TypeNINFO      uint16 = 56
	TypeRKEY       uint16 = 57
	TypeTALINK     uint16 = 58
	TypeCDS        uint16 = 59
	TypeCDNSKEY    uint16 = 60
	TypeOPENPGPKEY uint16 = 61
	TypeCSYNC      uint16 = 62
	TypeZONEMD     uint16 = 63
	TypeSVCB       uint16 = 64
	TypeHTTPS      uint16 = 65
	TypeSPF        uint16 = 99
	TypeUINFO      uint16 = 100
	TypeUID        uint16 = 101
	TypeGID        uint16 = 102
	TypeUNSPEC     uint16 = 103
	TypeNID        uint16 = 104
	TypeL32        uint16 = 105
	TypeL64        uint16 = 106
	TypeLP         uint16 = 107
	TypeEUI48      uint16 = 108
	TypeEUI64      uint16 = 109
	TypeURI        uint16 = 256
	TypeCAA        uint16 = 257
	TypeAVC        uint16 = 258
	TypeAMTRELAY   uint16 = 260

	TypeTKEY uint16 = 249
	TypeTSIG uint16 = 250

	// valid Question.Qtype only
	TypeIXFR  uint16 = 251
	TypeAXFR  uint16 = 252
	TypeMAILB uint16 = 253
	TypeMAILA uint16 = 254
	TypeANY   uint16 = 255

	TypeTA       uint16 = 32768
	TypeDLV      uint16 = 32769
	TypeReserved uint16 = 65535

	// valid Question.Qclass
	ClassINET   = 1
	ClassCSNET  = 2
	ClassCHAOS  = 3
	ClassHESIOD = 4
	ClassNONE   = 254
	ClassANY    = 255

	// Message Response Codes, see https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml
	RcodeSuccess        = 0  // NoError   - No Error                          [DNS]
	RcodeFormatError    = 1  // FormErr   - Format Error                      [DNS]
	RcodeServerFailure  = 2  // ServFail  - Server Failure                    [DNS]
	RcodeNameError      = 3  // NXDomain  - Non-Existent Domain               [DNS]
	RcodeNotImplemented = 4  // NotImp    - Not Implemented                   [DNS]
	RcodeRefused        = 5  // Refused   - Query Refused                     [DNS]
	RcodeYXDomain       = 6  // YXDomain  - Name Exists when it should not    [DNS Update]
	RcodeYXRrset        = 7  // YXRRSet   - RR Set Exists when it should not  [DNS Update]
	RcodeNXRrset        = 8  // NXRRSet   - RR Set that should exist does not [DNS Update]
	RcodeNotAuth        = 9  // NotAuth   - Server Not Authoritative for zone [DNS Update]
	RcodeNotZone        = 10 // NotZone   - Name not contained in zone        [DNS Update/TSIG]
	RcodeBadSig         = 16 // BADSIG    - TSIG Signature Failure            [TSIG]
	RcodeBadVers        = 16 // BADVERS   - Bad OPT Version                   [EDNS0]
	RcodeBadKey         = 17 // BADKEY    - Key not recognized                [TSIG]
	RcodeBadTime        = 18 // BADTIME   - Signature out of time window      [TSIG]
	RcodeBadMode        = 19 // BADMODE   - Bad TKEY Mode                     [TKEY]
	RcodeBadName        = 20 // BADNAME   - Duplicate key name                [TKEY]
	RcodeBadAlg         = 21 // BADALG    - Algorithm not supported           [TKEY]
	RcodeBadTrunc       = 22 // BADTRUNC  - Bad Truncation                    [TSIG]
	RcodeBadCookie      = 23 // BADCOOKIE - Bad/missing Server Cookie         [DNS Cookies]

	// Message Opcodes. There is no 3.
	OpcodeQuery  = 0
	OpcodeIQuery = 1
	OpcodeStatus = 2
	OpcodeNotify = 4
	OpcodeUpdate = 5
)

// EDNS0 Option codes.
const (
	EDNS0LLQ          = 0x1     // long lived queries: http://tools.ietf.org/html/draft-sekar-dns-llq-01
	EDNS0UL           = 0x2     // update lease draft: http://files.dns-sd.org/draft-sekar-dns-ul.txt
	EDNS0NSID         = 0x3     // nsid (See RFC 5001)
	EDNS0ESU          = 0x4     // ENUM Source-URI draft: https://datatracker.ietf.org/doc/html/draft-kaplan-enum-source-uri-00
	EDNS0DAU          = 0x5     // DNSSEC Algorithm Understood
	EDNS0DHU          = 0x6     // DS Hash Understood
	EDNS0N3U          = 0x7     // NSEC3 Hash Understood
	EDNS0SUBNET       = 0x8     // client-subnet (See RFC 7871)
	EDNS0EXPIRE       = 0x9     // EDNS0 expire
	EDNS0COOKIE       = 0xa     // EDNS0 Cookie
	EDNS0TCPKEEPALIVE = 0xb     // EDNS0 tcp keep alive (See RFC 7828)
	EDNS0PADDING      = 0xc     // EDNS0 padding (See RFC 7830)
	EDNS0EDE          = 0xf     // EDNS0 extended DNS errors (See RFC 8914)
	EDNS0LOCALSTART   = 0xFDE9  // Beginning of range reserved for local/experimental use (See RFC 6891)
	EDNS0LOCALEND     = 0xFFFE  // End of range reserved for local/experimental use (See RFC 6891)
	_DO               = 1 << 15 // DNSSEC OK
)

// ScrubWriter will, when writing the message, call scrub to make it fit the client's buffer.
type ScrubWriter struct {
	/*dns.*/ ResponseWriter
	req * /*dns.*/ Msg // original request
}

// OPT is the EDNS0 RR appended to messages to convey extra (meta) information.
// See RFC 6891.
type OPT struct {
	Hdr    RR_Header
	Option []EDNS0 `dns:"opt"`
}

// EDNS0 defines an EDNS0 Option. An OPT RR can have multiple options appended to it.
type EDNS0 interface {
	// Option returns the option code for the option.
	Option() uint16
	// pack returns the bytes of the option data.
	// pack() ([]byte, error)
	// unpack sets the data as found in the buffer. Is also sets
	// the length of the slice as the length of the option data.
	// unpack([]byte) error
	// String returns the string representation of the option.
	String() string
	// copy returns a deep-copy of the option.
	copy() EDNS0
}

// The EDNS0_COOKIE option is used to add a DNS Cookie to a message.
//
//	o := new(dns.OPT)
//	o.Hdr.Name = "."
//	o.Hdr.Rrtype = dns.TypeOPT
//	e := new(dns.EDNS0_COOKIE)
//	e.Code = dns.EDNS0COOKIE
//	e.Cookie = "24a5ac.."
//	o.Option = append(o.Option, e)
//
// The Cookie field consists out of a client cookie (RFC 7873 Section 4), that is
// always 8 bytes. It may then optionally be followed by the server cookie. The server
// cookie is of variable length, 8 to a maximum of 32 bytes. In other words:
//
//	cCookie := o.Cookie[:16]
//	sCookie := o.Cookie[16:]
//
// There is no guarantee that the Cookie string has a specific length.
type EDNS0_COOKIE struct {
	Code   uint16 // Always EDNS0COOKIE
	Cookie string // Hex-encoded cookie data
}

// func (e *EDNS0_COOKIE) pack() ([]byte, error) {
// 	h, err := hex.DecodeString(e.Cookie)
// 	if err != nil {
// 		return nil, err
// 	}
// 	return h, nil
// }

// // Option implements the EDNS0 interface.
func (e *EDNS0_COOKIE) Option() uint16        { return EDNS0COOKIE }
// func (e *EDNS0_COOKIE) unpack(b []byte) error { e.Cookie = hex.EncodeToString(b); return nil }
func (e *EDNS0_COOKIE) String() string        { return e.Cookie }
func (e *EDNS0_COOKIE) copy() EDNS0           { return &EDNS0_COOKIE{e.Code, e.Cookie} }

const (
	year68     = 1 << 31 // For RFC1982 (Serial Arithmetic) calculations in 32 bits.
	defaultTtl = 3600    // Default internal TTL.

	// DefaultMsgSize is the standard default for messages larger than 512 bytes.
	DefaultMsgSize = 4096
	// MinMsgSize is the minimal size of a DNS packet.
	MinMsgSize = 512
	// MaxMsgSize is the largest possible DNS packet.
	MaxMsgSize = 65535
)

type supported struct {
	m map[uint16]struct{}
	sync.RWMutex
}

var sup = &supported{m: make(map[uint16]struct{})}

// Transfer is a plugin that handles zone transfers.
type Transfer struct {
	Transferers []Transferer // List of plugins that implement Transferer
	// xfrs        []*xfr
	tsigSecret map[string]string
	Next       Handler
}

// Transferer may be implemented by plugins to enable zone transfers
type Transferer interface {
	// Transfer returns a channel to which it writes responses to the transfer request.
	// If the plugin is not authoritative for the zone, it should immediately return the
	// transfer.ErrNotAuthoritative error. This is important otherwise the transfer plugin can
	// use plugin X while it should transfer the data from plugin Y.
	//
	// If serial is 0, handle as an AXFR request. Transfer should send all records
	// in the zone to the channel. The SOA should be written to the channel first, followed
	// by all other records, including all NS + glue records. The implemenation is also responsible
	// for sending the last SOA record (to signal end of the transfer). This plugin will just grab
	// these records and send them back to the requester, there is little validation done.
	//
	// If serial is not 0, it will be handled as an IXFR request. If the serial is equal to or greater (newer) than
	// the current serial for the zone, send a single SOA record to the channel and then close it.
	// If the serial is less (older) than the current serial for the zone, perform an AXFR fallback
	// by proceeding as if an AXFR was requested (as above).
	Transfer(zone string, serial uint32) (<-chan []RR, error)
}

// Zone is a structure that contains all data related to a DNS zone.
type Zone struct {
	origin  string
	origLen int
	file    string
	*Tree
	Apex
	Expired bool

	sync.RWMutex

	StartupOnce  sync.Once
	TransferFrom []string

	ReloadInterval time.Duration
	reloadShutdown chan bool

	Upstream *Upstream // Upstream for looking up external names during the resolution process.
}

type Result int

const (
	// Success is a successful lookup.
	Success Result = iota
	// NameError indicates a nameerror
	NameError
	// Delegation indicates the lookup resulted in a delegation.
	Delegation
	// NoData indicates the lookup resulted in a NODATA.
	NoData
	// ServerFailure indicates a server failure during the lookup.
	ServerFailure
)

// Upstream is used to resolve CNAME or other external targets via CoreDNS itself.
type Upstream struct{}

type (
	// Key is the context key for the current server added to the context.
	Key struct{}

	// LoopKey is the context key to detect server wide loops.
	LoopKey struct{}

	// ViewKey is the context key for the current view, if defined
	ViewKey struct{}
)

const (
	tcp = 0
	udp = 1

	tcpMaxQueries = -1
)

// Writer is a type of ResponseWriter that captures the message, but never writes to the client.
type NonWriter struct {
	ResponseWriter
	Msg *Msg
}

// Apex contains the apex records of a zone: SOA, NS and their potential signatures.
type Apex struct {
	SOA    *SOA
	NS     []RR
	SIGSOA []RR
	SIGNS  []RR
}

// A RR. See RFC 1035.
type A struct {
	Hdr RR_Header
	A   net.IP `dns:"a"`
}

// AAAA RR. See RFC 3596.
type AAAA struct {
	Hdr  RR_Header
	AAAA net.IP `dns:"aaaa"`
}

// SOA RR. See RFC 1035.
type SOA struct {
	Hdr     RR_Header
	Ns      string `dns:"cdomain-name"`
	Mbox    string `dns:"cdomain-name"`
	Serial  uint32
	Refresh uint32
	Retry   uint32
	Expire  uint32
	Minttl  uint32
}

// A Color represents the color of a Node.
type Color bool

const (
	// Red as false give us the defined behaviour that new nodes are red. Although this
	// is incorrect for the root node, that is resolved on the first insertion.
	red   Color = false
	black Color = true
)

// A Node represents a node in the LLRB tree.
type Node struct {
	Elem        *Elem
	Left, Right *Node
	Color       Color
}

// A Tree manages the root node of an LLRB tree. Public methods are exposed through this type.
type Tree struct {
	Root  *Node // Root node of the tree.
	Count int   // Number of elements stored.
}

// Elem is an element in the tree.
type Elem struct {
	m    map[uint16][]RR
	name string // owner name
}

// DNAME RR. See RFC 2672.
type DNAME struct {
	Hdr    RR_Header
	Target string `dns:"domain-name"`
}

// CNAME RR. See RFC 1034.
type CNAME struct {
	Hdr    RR_Header
	Target string `dns:"cdomain-name"`
}

// SRV RR. See RFC 2782.
type SRV struct {
	Hdr      RR_Header
	Priority uint16
	Weight   uint16
	Port     uint16
	Target   string `dns:"domain-name"`
}

// MX RR. See RFC 1035.
type MX struct {
	Hdr        RR_Header
	Preference uint16
	Mx         string `dns:"cdomain-name"`
}

// NS RR. See RFC 1035.
type NS struct {
	Hdr RR_Header
	Ns  string `dns:"cdomain-name"`
}

// RRSIG RR. See RFC 4034 and RFC 3755.
type RRSIG struct {
	Hdr         RR_Header
	TypeCovered uint16
	Algorithm   uint8
	Labels      uint8
	OrigTtl     uint32
	Expiration  uint32
	Inception   uint32
	KeyTag      uint16
	SignerName  string `dns:"domain-name"`
	Signature   string `dns:"base64"`
}

// TXT RR. See RFC 1035.
type TXT struct {
	Hdr RR_Header
	Txt []string `dns:"txt"`
}

// DS RR. See RFC 4034 and RFC 3658.
type DS struct {
	Hdr        RR_Header
	KeyTag     uint16
	Algorithm  uint8
	DigestType uint8
	Digest     string `dns:"hex"`
}

// NSEC RR. See RFC 4034 and RFC 3755.
type NSEC struct {
	Hdr        RR_Header
	NextDomain string   `dns:"domain-name"`
	TypeBitMap []uint16 `dns:"nsec"`
}

// type Func func() string

/* ztypes.go */

func (rr *A) Header() *RR_Header          { return &rr.Hdr }
func (rr *AAAA) Header() *RR_Header       { return &rr.Hdr }
// func (rr *AFSDB) Header() *RR_Header      { return &rr.Hdr }
// func (rr *AMTRELAY) Header() *RR_Header   { return &rr.Hdr }
// func (rr *ANY) Header() *RR_Header        { return &rr.Hdr }
// func (rr *APL) Header() *RR_Header        { return &rr.Hdr }
// func (rr *AVC) Header() *RR_Header        { return &rr.Hdr }
// func (rr *CAA) Header() *RR_Header        { return &rr.Hdr }
// func (rr *CDNSKEY) Header() *RR_Header    { return &rr.Hdr }
// func (rr *CDS) Header() *RR_Header        { return &rr.Hdr }
// func (rr *CERT) Header() *RR_Header       { return &rr.Hdr }
func (rr *CNAME) Header() *RR_Header { return &rr.Hdr }

// func (rr *CSYNC) Header() *RR_Header      { return &rr.Hdr }
// func (rr *DHCID) Header() *RR_Header      { return &rr.Hdr }
// func (rr *DLV) Header() *RR_Header        { return &rr.Hdr }
func (rr *DNAME) Header() *RR_Header { return &rr.Hdr }

// func (rr *DNSKEY) Header() *RR_Header     { return &rr.Hdr }

func (rr *DS) Header() *RR_Header         { return &rr.Hdr }

// func (rr *EID) Header() *RR_Header        { return &rr.Hdr }
// func (rr *EUI48) Header() *RR_Header      { return &rr.Hdr }
// func (rr *EUI64) Header() *RR_Header      { return &rr.Hdr }
// func (rr *GID) Header() *RR_Header        { return &rr.Hdr }
// func (rr *GPOS) Header() *RR_Header       { return &rr.Hdr }
// func (rr *HINFO) Header() *RR_Header      { return &rr.Hdr }
// func (rr *HIP) Header() *RR_Header        { return &rr.Hdr }
// func (rr *HTTPS) Header() *RR_Header      { return &rr.Hdr }
// func (rr *IPSECKEY) Header() *RR_Header   { return &rr.Hdr }
// func (rr *KEY) Header() *RR_Header        { return &rr.Hdr }
// func (rr *KX) Header() *RR_Header         { return &rr.Hdr }
// func (rr *L32) Header() *RR_Header        { return &rr.Hdr }
// func (rr *L64) Header() *RR_Header        { return &rr.Hdr }
// func (rr *LOC) Header() *RR_Header        { return &rr.Hdr }
// func (rr *LP) Header() *RR_Header         { return &rr.Hdr }
// func (rr *MB) Header() *RR_Header         { return &rr.Hdr }
// func (rr *MD) Header() *RR_Header         { return &rr.Hdr }
// func (rr *MF) Header() *RR_Header         { return &rr.Hdr }
// func (rr *MG) Header() *RR_Header         { return &rr.Hdr }
// func (rr *MINFO) Header() *RR_Header      { return &rr.Hdr }
// func (rr *MR) Header() *RR_Header         { return &rr.Hdr }
func (rr *MX) Header() *RR_Header { return &rr.Hdr }

// func (rr *NAPTR) Header() *RR_Header      { return &rr.Hdr }
// func (rr *NID) Header() *RR_Header        { return &rr.Hdr }
// func (rr *NIMLOC) Header() *RR_Header     { return &rr.Hdr }
// func (rr *NINFO) Header() *RR_Header      { return &rr.Hdr }
func (rr *NS) Header() *RR_Header { return &rr.Hdr }

// func (rr *NSAPPTR) Header() *RR_Header    { return &rr.Hdr }

func (rr *NSEC) Header() *RR_Header       { return &rr.Hdr }

// func (rr *NSEC3) Header() *RR_Header      { return &rr.Hdr }
// func (rr *NSEC3PARAM) Header() *RR_Header { return &rr.Hdr }
// func (rr *NULL) Header() *RR_Header       { return &rr.Hdr }
// func (rr *OPENPGPKEY) Header() *RR_Header { return &rr.Hdr }
func (rr *OPT) Header() *RR_Header { return &rr.Hdr }

// func (rr *PTR) Header() *RR_Header        { return &rr.Hdr }
// func (rr *PX) Header() *RR_Header         { return &rr.Hdr }
// func (rr *RFC3597) Header() *RR_Header    { return &rr.Hdr }
// func (rr *RKEY) Header() *RR_Header       { return &rr.Hdr }
// func (rr *RP) Header() *RR_Header         { return &rr.Hdr }
func (rr *RRSIG) Header() *RR_Header { return &rr.Hdr }

// func (rr *RT) Header() *RR_Header         { return &rr.Hdr }
// func (rr *SIG) Header() *RR_Header        { return &rr.Hdr }
// func (rr *SMIMEA) Header() *RR_Header     { return &rr.Hdr }
func (rr *SOA) Header() *RR_Header { return &rr.Hdr }

// func (rr *SPF) Header() *RR_Header        { return &rr.Hdr }
func (rr *SRV) Header() *RR_Header { return &rr.Hdr }

// func (rr *SSHFP) Header() *RR_Header      { return &rr.Hdr }
// func (rr *SVCB) Header() *RR_Header       { return &rr.Hdr }
// func (rr *TA) Header() *RR_Header         { return &rr.Hdr }
// func (rr *TALINK) Header() *RR_Header     { return &rr.Hdr }
// func (rr *TKEY) Header() *RR_Header       { return &rr.Hdr }
// func (rr *TLSA) Header() *RR_Header       { return &rr.Hdr }
// func (rr *TSIG) Header() *RR_Header       { return &rr.Hdr }

func (rr *TXT) Header() *RR_Header        { return &rr.Hdr }

// func (rr *UID) Header() *RR_Header        { return &rr.Hdr }
// func (rr *UINFO) Header() *RR_Header      { return &rr.Hdr }
// func (rr *URI) Header() *RR_Header        { return &rr.Hdr }
// func (rr *X25) Header() *RR_Header        { return &rr.Hdr }

func cloneIP(ip net.IP) []byte {
	if ip == nil {
		return nil
	}
	return append([]byte(nil), ip...)
}

func cloneStringSlice(s []string) []string {
	if s == nil {
		return nil
	}
	return append([]string(nil), s...)
}

func cloneU16Slice(s []uint16) []uint16 {
	if s == nil {
		return nil
	}
	return append([]uint16(nil), s...)
}


func (rr *A) copy() RR {
	return &A{rr.Hdr, cloneIP(rr.A)}
}

func (rr *AAAA) copy() RR {
	return &AAAA{rr.Hdr, cloneIP(rr.AAAA)}
}

func (rr *CNAME) copy() RR {
	return &CNAME{rr.Hdr, rr.Target}
}
func (rr *DNAME) copy() RR {
	return &DNAME{rr.Hdr, rr.Target}
}
func (rr *MX) copy() RR {
	return &MX{rr.Hdr, rr.Preference, rr.Mx}
}
func (rr *NS) copy() RR {
	return &NS{rr.Hdr, rr.Ns}
}
func (rr *OPT) copy() RR {
	Option := make([]EDNS0, len(rr.Option))
	for i, e := range rr.Option {
		Option[i] = e.copy()
	}
	return &OPT{rr.Hdr, Option}
}
func (rr *RRSIG) copy() RR {
	return &RRSIG{
		rr.Hdr,
		rr.TypeCovered,
		rr.Algorithm,
		rr.Labels,
		rr.OrigTtl,
		rr.Expiration,
		rr.Inception,
		rr.KeyTag,
		rr.SignerName,
		rr.Signature,
	}
}
func (rr *SOA) copy() RR {
	return &SOA{
		rr.Hdr,
		rr.Ns,
		rr.Mbox,
		rr.Serial,
		rr.Refresh,
		rr.Retry,
		rr.Expire,
		rr.Minttl,
	}
}
func (rr *SRV) copy() RR {
	return &SRV{
		rr.Hdr,
		rr.Priority,
		rr.Weight,
		rr.Port,
		rr.Target,
	}
}

func (rr *TXT) copy() RR {
	return &TXT{rr.Hdr, cloneStringSlice(rr.Txt)}
}

func (rr *DS) copy() RR {
	return &DS{
		rr.Hdr,
		rr.KeyTag,
		rr.Algorithm,
		rr.DigestType,
		rr.Digest,
	}
}

func (rr *NSEC) copy() RR {
	return &NSEC{rr.Hdr, rr.NextDomain, cloneU16Slice(rr.TypeBitMap)}
}
