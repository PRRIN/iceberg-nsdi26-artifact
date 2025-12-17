package coredns

// import (
// 	"unsafe"
// )

// type maptype struct {
// 	Type
// 	Key    *Type
// 	Elem   *Type
// 	Bucket *Type // internal type representing a hash bucket
// 	// function for hashing keys (ptr to key, seed) -> hash
// 	Hasher     func(unsafe.Pointer, uintptr) uintptr
// 	KeySize    uint8  // size of key slot
// 	ValueSize  uint8  // size of elem slot
// 	BucketSize uint16 // size of bucket
// 	Flags      uint32
// }

// // Map constants common to several packages
// // runtime/runtime-gdb.py:MapTypePrinter contains its own copy
// const (
// 	MapBucketCountBits = 3 // log2 of number of elements in a bucket.
// 	MapBucketCount     = 1 << MapBucketCountBits
// 	MapMaxKeyBytes     = 128 // Must fit in a uint8.
// 	MapMaxElemBytes    = 128 // Must fit in a uint8.
// )

// // ZeroValSize is the size in bytes of runtime.zeroVal.
// const ZeroValSize = 1024

// const (
// 	// Maximum number of key/elem pairs a bucket can hold.
// 	bucketCntBits = MapBucketCountBits
// 	bucketCnt     = MapBucketCount

// 	// Maximum average load of a bucket that triggers growth is bucketCnt*13/16 (about 80% full)
// 	// Because of minimum alignment rules, bucketCnt is known to be at least 8.
// 	// Represent as loadFactorNum/loadFactorDen, to allow integer math.
// 	loadFactorDen = 2
// 	loadFactorNum = loadFactorDen * bucketCnt * 13 / 16

// 	// Maximum key or elem size to keep inline (instead of mallocing per element).
// 	// Must fit in a uint8.
// 	// Fast versions cannot handle big elems - the cutoff size for
// 	// fast versions in cmd/compile/internal/gc/walk.go must be at most this elem.
// 	maxKeySize  = MapMaxKeyBytes
// 	maxElemSize = MapMaxElemBytes

// 	// data offset should be the size of the bmap struct, but needs to be
// 	// aligned correctly. For amd64p32 this means 64-bit alignment
// 	// even though pointers are 32 bit.
// 	dataOffset = unsafe.Offsetof(struct {
// 		b bmap
// 		v int64
// 	}{}.v)

// 	// Possible tophash values. We reserve a few possibilities for special marks.
// 	// Each bucket (including its overflow buckets, if any) will have either all or none of its
// 	// entries in the evacuated* states (except during the evacuate() method, which only happens
// 	// during map writes and thus no one else can observe the map during that time).
// 	emptyRest      = 0 // this cell is empty, and there are no more non-empty cells at higher indexes or overflows.
// 	emptyOne       = 1 // this cell is empty
// 	evacuatedX     = 2 // key/elem is valid.  Entry has been evacuated to first half of larger table.
// 	evacuatedY     = 3 // same as above, but evacuated to second half of larger table.
// 	evacuatedEmpty = 4 // cell is empty, bucket is evacuated.
// 	minTopHash     = 5 // minimum tophash for a normal filled cell.

// 	// flags
// 	iterator     = 1 // there may be an iterator using buckets
// 	oldIterator  = 2 // there may be an iterator using oldbuckets
// 	hashWriting  = 4 // a goroutine is writing to the map
// 	sameSizeGrow = 8 // the current map growth is to a new map of the same size

// 	// sentinel bucket ID for iterator checks
// 	noCheck = 1<<(8*/* goarch.PtrSize */ 8) - 1
// )

// // A header for a Go map.
// type hmap struct {
// 	// Note: the format of the hmap is also encoded in cmd/compile/internal/reflectdata/reflect.go.
// 	// Make sure this stays in sync with the compiler's definition.
// 	count     int // # live cells == size of map.  Must be first (used by len() builtin)
// 	flags     uint8
// 	B         uint8  // log_2 of # of buckets (can hold up to loadFactor * 2^B items)
// 	noverflow uint16 // approximate number of overflow buckets; see incrnoverflow for details
// 	hash0     uint32 // hash seed

// 	buckets    unsafe.Pointer // array of 2^B Buckets. may be nil if count==0.
// 	oldbuckets unsafe.Pointer // previous bucket array of half the size, non-nil only when growing
// 	nevacuate  uintptr        // progress counter for evacuation (buckets less than this have been evacuated)

// 	extra *mapextra // optional fields
// }

// // mapextra holds fields that are not present on all maps.
// type mapextra struct {
// 	// If both key and elem do not contain pointers and are inline, then we mark bucket
// 	// type as containing no pointers. This avoids scanning such maps.
// 	// However, bmap.overflow is a pointer. In order to keep overflow buckets
// 	// alive, we store pointers to all overflow buckets in hmap.extra.overflow and hmap.extra.oldoverflow.
// 	// overflow and oldoverflow are only used if key and elem do not contain pointers.
// 	// overflow contains overflow buckets for hmap.buckets.
// 	// oldoverflow contains overflow buckets for hmap.oldbuckets.
// 	// The indirection allows to store a pointer to the slice in hiter.
// 	overflow    *[]*bmap
// 	oldoverflow *[]*bmap

// 	// nextOverflow holds a pointer to a free overflow bucket.
// 	nextOverflow *bmap
// }

// // A bucket for a Go map.
// type bmap struct {
// 	// tophash generally contains the top byte of the hash value
// 	// for each key in this bucket. If tophash[0] < minTopHash,
// 	// tophash[0] is a bucket evacuation state instead.
// 	tophash [bucketCnt]uint8
// 	// Followed by bucketCnt keys and then bucketCnt elems.
// 	// NOTE: packing all the keys together and then all the elems together makes the
// 	// code a bit more complicated than alternating key/elem/key/elem/... but it allows
// 	// us to eliminate padding which would be needed for, e.g., map[int64]int8.
// 	// Followed by an overflow pointer.
// }


// // mapaccess1 returns a pointer to h[key].  Never returns nil, instead
// // it will return a reference to the zero object for the elem type if
// // the key is not in the map.
// // NOTE: The returned pointer may keep the whole map live, so don't
// // hold onto it for very long.
// //go:linkname Mapaccess1 runtime.mapaccess1
// func Mapaccess1(t *maptype, h *hmap, key unsafe.Pointer) unsafe.Pointer {
// 	// if raceenabled && h != nil {
// 	// 	callerpc := getcallerpc()
// 	// 	pc := abi.FuncPCABIInternal(mapaccess1)
// 	// 	racereadpc( /*unsafe.*/ Pointer(h), callerpc, pc)
// 	// 	raceReadObjectPC(t.Key, key, callerpc, pc)
// 	// }
// 	// if msanenabled && h != nil {
// 	// 	msanread(key, t.Key.Size_)
// 	// }
// 	// if asanenabled && h != nil {
// 	// 	asanread(key, t.Key.Size_)
// 	// }

// 	if h == nil || h.count == 0 {
// 		// if t.HashMightPanic() {
// 		// 	t.Hasher(key, 0) // see issue 23734
// 		// }
// 		return unsafe.Pointer(&zeroVal[0])
// 	}

// 	// if h.flags&hashWriting != 0 {
// 	// 	fatal("concurrent map read and map write")
// 	// }

// 	hash := t.Hasher(key, uintptr(h.hash0))
// 	m := bucketMask(h.B)
// 	b := (*bmap)(add(h.buckets, (hash&m)*uintptr(t.BucketSize)))
// 	if c := h.oldbuckets; c != nil {
// 		if !h.sameSizeGrow() {
// 			// There used to be half as many buckets; mask down one more power of two.
// 			m >>= 1
// 		}
// 		oldb := (*bmap)(add(c, (hash&m)*uintptr(t.BucketSize)))
// 		if !evacuated(oldb) {
// 			b = oldb
// 		}
// 	}
// 	top := tophash(hash)
// bucketloop:
// 	for ; b != nil; b = b.overflow(t) {
// 		for i := uintptr(0); i < bucketCnt; i++ {
// 			if b.tophash[i] != top {
// 				if b.tophash[i] == emptyRest {
// 					break bucketloop
// 				}
// 				continue
// 			}
// 			k := add(unsafe.Pointer(b), dataOffset+i*uintptr(t.KeySize))
// 			if t.IndirectKey() {
// 				k = *((*unsafe.Pointer)(k))
// 			}
// 			if t.Key.Equal(key, k) {
// 				e := add(unsafe.Pointer(b), dataOffset+bucketCnt*uintptr(t.KeySize)+i*uintptr(t.ValueSize))
// 				if t.IndirectElem() {
// 					e = *((*unsafe.Pointer)(e))
// 				}
// 				return e
// 			}
// 		}
// 	}
// 	return unsafe.Pointer(&zeroVal[0])
// }

// /* Dependencies */
// var zeroVal [ZeroValSize]byte


// // bucketShift returns 1<<b, optimized for code generation.
// func bucketShift(b uint8) uintptr {
// 	// Masking the shift amount allows overflow checks to be elided.
// 	return uintptr(1) << (b & ( /*goarch.PtrSize*/ 8*8 - 1))
// }

// // bucketMask returns 1<<b - 1, optimized for code generation.
// func bucketMask(b uint8) uintptr {
// 	return bucketShift(b) - 1
// }

// func add(p unsafe.Pointer, x uintptr) unsafe.Pointer {
// 	return unsafe.Pointer(uintptr(p) + x)
// }

// // sameSizeGrow reports whether the current growth is to a map of the same size.
// func (h *hmap) sameSizeGrow() bool {
// 	return h.flags&sameSizeGrow != 0
// }

// func evacuated(b *bmap) bool {
// 	h := b.tophash[0]
// 	return h > emptyOne && h < minTopHash
// }

// // tophash calculates the tophash value for hash.
// func tophash(hash uintptr) uint8 {
// 	top := uint8(hash >> ( /*goarch.PtrSize*/ 8*8 - 8))
// 	if top < minTopHash {
// 		top += minTopHash
// 	}
// 	return top
// }

// // Note: flag values must match those used in the TMAP case
// // in ../cmd/compile/internal/reflectdata/reflect.go:writeType.
// func (mt *maptype) IndirectKey() bool { // store ptr to key instead of key itself
// 	return mt.Flags&1 != 0
// }
// func (mt *maptype) IndirectElem() bool { // store ptr to elem instead of elem itself
// 	return mt.Flags&2 != 0
// }

// func (b *bmap) overflow(t *maptype) *bmap {
// 	return *(**bmap)(add(unsafe.Pointer(b), uintptr(t.BucketSize)-/* goarch.PtrSize */8))
// }