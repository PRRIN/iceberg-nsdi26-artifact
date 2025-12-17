package coredns

func BytesCompare(a, b []byte) int {
	l := len(a)
	if len(b) < l {
		l = len(b)
	}
	if l == 0 || &a[0] == &b[0] {
		goto samebytes
	}
	for i := 0; i < l; i++ {
		c1, c2 := a[i], b[i]
		if c1 < c2 {
			return -1
		}
		if c1 > c2 {
			return +1
		}
	}
samebytes:
	if len(a) < len(b) {
		return -1
	}
	if len(a) > len(b) {
		return +1
	}
	return 0
}