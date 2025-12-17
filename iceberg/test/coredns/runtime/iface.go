package coredns

import (
	"unsafe"
)

type _type Type


// The representation of an empty interface.
// See comment in iface.go for more details on this struct.
type eface struct {
	_type *_type
	data  unsafe.Pointer
}

// The representation of a non-empty interface.
// See comment in iface.go for more details on this struct.
type iface struct {
	tab  unsafe.Pointer
	data unsafe.Pointer
}


// Return whether two type descriptors are equal.
func eqtype(t1, t2 *_type) bool {
	return t1 == t2
}

//go:linkname IfaceE2T2P runtime.ifaceE2T2P
func IfaceE2T2P(t *_type, e eface) (unsafe.Pointer, bool) {
	if !eqtype(t, e._type) {
		return nil, false
	} else {
		return e.data, true
	}
}

// Convert an empty interface to a non-pointer non-interface type.
//go:linkname IfaceE2T2 runtime.ifaceE2T2
func IfaceE2T2(t *_type, e eface, ret unsafe.Pointer) bool {
	if !eqtype(t, e._type) {
		typedmemclr(t, ret)
		return false
	} else {
		if isDirectIface(t) {
			*(*unsafe.Pointer)(ret) = e.data
		} else {
			typedmemmove(t, ret, e.data)
		}
		return true
	}
}

// Convert a non-empty interface to a pointer non-interface type.
//go:linkname IfaceI2T2P runtime.ifaceI2T2P
func IfaceI2T2P(t *_type, i iface) (unsafe.Pointer, bool) {
	if i.tab == nil || !eqtype(t, *(**_type)(i.tab)) {
		return nil, false
	} else {
		return i.data, true
	}
}

//go:linkname Ifaceeq runtime.ifaceeq
func Ifaceeq(x, y iface) bool {
	xtab := x.tab
	if xtab == nil && y.tab == nil {
		return true
	}
	if xtab == nil || y.tab == nil {
		return false
	}
	t := *(**_type)(xtab)
	if !eqtype(t, *(**_type)(y.tab)) {
		return false
	}
	eq := t.Equal
	if eq == nil {
		panic("comparing uncomparable type")
	}
	if isDirectIface(t) {
		// Direct interface types are ptr, chan, map, func, and single-element structs/arrays thereof.
		// Maps and funcs are not comparable, so they can't reach here.
		// Ptrs, chans, and single-element items can be compared directly using ==.
		return x.data == y.data
	}
	return eq(x.data, y.data)
}

// isDirectIface reports whether t is stored directly in an interface value.
func isDirectIface(t *_type) bool {
	return t.Kind_&KindDirectIface != 0
}

//go:noescape
//go:linkname typedmemmove runtime.typedmemmove
func typedmemmove(typ *_type, dst, src unsafe.Pointer)

//go:noescape
//go:linkname typedmemclr runtime.typedmemclr
func typedmemclr(typ *_type, ptr unsafe.Pointer)