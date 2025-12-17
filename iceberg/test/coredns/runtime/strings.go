package coredns

import (
	"unsafe"
)

// --- unicode

const (
	MaxRune         = '\U0010FFFF' // Maximum valid Unicode code point.
	ReplacementChar = '\uFFFD'     // Represents invalid code points.
	MaxASCII        = '\u007F'     // maximum ASCII value.
	MaxLatin1       = '\u00FF'     // maximum Latin-1 value.
)

// Indices into the Delta arrays inside CaseRanges for case mapping.
const (
	UpperCase = iota
	LowerCase
	TitleCase
	MaxCase
)

type d [MaxCase]rune // to make the CaseRanges text shorter

const (
	UpperLower = MaxRune + 1 // (Cannot be a valid delta.)
)

// CaseRange represents a range of Unicode code points for simple (one
// code point to one code point) case conversion.
// The range runs from Lo to Hi inclusive, with a fixed stride of 1. Deltas
// are the number to add to the code point to reach the code point for a
// different case for that character. They may be negative. If zero, it
// means the character is in the corresponding case. There is a special
// case representing sequences of alternating corresponding Upper and Lower
// pairs. It appears with a fixed Delta of
//
//	{UpperLower, UpperLower, UpperLower}
//
// The constant UpperLower has an otherwise impossible delta value.
type CaseRange struct {
	Lo    uint32
	Hi    uint32
	Delta d
}

// CaseRanges is the table describing case mappings for all letters with
// non-self mappings.
var CaseRanges = _CaseRanges
var _CaseRanges = []CaseRange{
	{0x0041, 0x005A, d{0, 32, 0}},
	{0x0061, 0x007A, d{-32, 0, -32}},
	{0x00B5, 0x00B5, d{743, 0, 743}},
	{0x00C0, 0x00D6, d{0, 32, 0}},
	{0x00D8, 0x00DE, d{0, 32, 0}},
	{0x00E0, 0x00F6, d{-32, 0, -32}},
	{0x00F8, 0x00FE, d{-32, 0, -32}},
	{0x00FF, 0x00FF, d{121, 0, 121}},
	{0x0100, 0x012F, d{UpperLower, UpperLower, UpperLower}},
	{0x0130, 0x0130, d{0, -199, 0}},
	{0x0131, 0x0131, d{-232, 0, -232}},
	{0x0132, 0x0137, d{UpperLower, UpperLower, UpperLower}},
	{0x0139, 0x0148, d{UpperLower, UpperLower, UpperLower}},
	{0x014A, 0x0177, d{UpperLower, UpperLower, UpperLower}},
	{0x0178, 0x0178, d{0, -121, 0}},
	{0x0179, 0x017E, d{UpperLower, UpperLower, UpperLower}},
	{0x017F, 0x017F, d{-300, 0, -300}},
	{0x0180, 0x0180, d{195, 0, 195}},
	{0x0181, 0x0181, d{0, 210, 0}},
	{0x0182, 0x0185, d{UpperLower, UpperLower, UpperLower}},
	{0x0186, 0x0186, d{0, 206, 0}},
	{0x0187, 0x0188, d{UpperLower, UpperLower, UpperLower}},
	{0x0189, 0x018A, d{0, 205, 0}},
	{0x018B, 0x018C, d{UpperLower, UpperLower, UpperLower}},
	{0x018E, 0x018E, d{0, 79, 0}},
	{0x018F, 0x018F, d{0, 202, 0}},
	{0x0190, 0x0190, d{0, 203, 0}},
	{0x0191, 0x0192, d{UpperLower, UpperLower, UpperLower}},
	{0x0193, 0x0193, d{0, 205, 0}},
	{0x0194, 0x0194, d{0, 207, 0}},
	{0x0195, 0x0195, d{97, 0, 97}},
	{0x0196, 0x0196, d{0, 211, 0}},
	{0x0197, 0x0197, d{0, 209, 0}},
	{0x0198, 0x0199, d{UpperLower, UpperLower, UpperLower}},
	{0x019A, 0x019A, d{163, 0, 163}},
	{0x019C, 0x019C, d{0, 211, 0}},
	{0x019D, 0x019D, d{0, 213, 0}},
	{0x019E, 0x019E, d{130, 0, 130}},
	{0x019F, 0x019F, d{0, 214, 0}},
	{0x01A0, 0x01A5, d{UpperLower, UpperLower, UpperLower}},
	{0x01A6, 0x01A6, d{0, 218, 0}},
	{0x01A7, 0x01A8, d{UpperLower, UpperLower, UpperLower}},
	{0x01A9, 0x01A9, d{0, 218, 0}},
	{0x01AC, 0x01AD, d{UpperLower, UpperLower, UpperLower}},
	{0x01AE, 0x01AE, d{0, 218, 0}},
	{0x01AF, 0x01B0, d{UpperLower, UpperLower, UpperLower}},
	{0x01B1, 0x01B2, d{0, 217, 0}},
	{0x01B3, 0x01B6, d{UpperLower, UpperLower, UpperLower}},
	{0x01B7, 0x01B7, d{0, 219, 0}},
	{0x01B8, 0x01B9, d{UpperLower, UpperLower, UpperLower}},
	{0x01BC, 0x01BD, d{UpperLower, UpperLower, UpperLower}},
	{0x01BF, 0x01BF, d{56, 0, 56}},
	{0x01C4, 0x01C4, d{0, 2, 1}},
	{0x01C5, 0x01C5, d{-1, 1, 0}},
	{0x01C6, 0x01C6, d{-2, 0, -1}},
	{0x01C7, 0x01C7, d{0, 2, 1}},
	{0x01C8, 0x01C8, d{-1, 1, 0}},
	{0x01C9, 0x01C9, d{-2, 0, -1}},
	{0x01CA, 0x01CA, d{0, 2, 1}},
	{0x01CB, 0x01CB, d{-1, 1, 0}},
	{0x01CC, 0x01CC, d{-2, 0, -1}},
	{0x01CD, 0x01DC, d{UpperLower, UpperLower, UpperLower}},
	{0x01DD, 0x01DD, d{-79, 0, -79}},
	{0x01DE, 0x01EF, d{UpperLower, UpperLower, UpperLower}},
	{0x01F1, 0x01F1, d{0, 2, 1}},
	{0x01F2, 0x01F2, d{-1, 1, 0}},
	{0x01F3, 0x01F3, d{-2, 0, -1}},
	{0x01F4, 0x01F5, d{UpperLower, UpperLower, UpperLower}},
	{0x01F6, 0x01F6, d{0, -97, 0}},
	{0x01F7, 0x01F7, d{0, -56, 0}},
	{0x01F8, 0x021F, d{UpperLower, UpperLower, UpperLower}},
	{0x0220, 0x0220, d{0, -130, 0}},
	{0x0222, 0x0233, d{UpperLower, UpperLower, UpperLower}},
	{0x023A, 0x023A, d{0, 10795, 0}},
	{0x023B, 0x023C, d{UpperLower, UpperLower, UpperLower}},
	{0x023D, 0x023D, d{0, -163, 0}},
	{0x023E, 0x023E, d{0, 10792, 0}},
	{0x023F, 0x0240, d{10815, 0, 10815}},
	{0x0241, 0x0242, d{UpperLower, UpperLower, UpperLower}},
	{0x0243, 0x0243, d{0, -195, 0}},
	{0x0244, 0x0244, d{0, 69, 0}},
	{0x0245, 0x0245, d{0, 71, 0}},
	{0x0246, 0x024F, d{UpperLower, UpperLower, UpperLower}},
	{0x0250, 0x0250, d{10783, 0, 10783}},
	{0x0251, 0x0251, d{10780, 0, 10780}},
	{0x0252, 0x0252, d{10782, 0, 10782}},
	{0x0253, 0x0253, d{-210, 0, -210}},
	{0x0254, 0x0254, d{-206, 0, -206}},
	{0x0256, 0x0257, d{-205, 0, -205}},
	{0x0259, 0x0259, d{-202, 0, -202}},
	{0x025B, 0x025B, d{-203, 0, -203}},
	{0x025C, 0x025C, d{42319, 0, 42319}},
	{0x0260, 0x0260, d{-205, 0, -205}},
	{0x0261, 0x0261, d{42315, 0, 42315}},
	{0x0263, 0x0263, d{-207, 0, -207}},
	{0x0265, 0x0265, d{42280, 0, 42280}},
	{0x0266, 0x0266, d{42308, 0, 42308}},
	{0x0268, 0x0268, d{-209, 0, -209}},
	{0x0269, 0x0269, d{-211, 0, -211}},
	{0x026A, 0x026A, d{42308, 0, 42308}},
	{0x026B, 0x026B, d{10743, 0, 10743}},
	{0x026C, 0x026C, d{42305, 0, 42305}},
	{0x026F, 0x026F, d{-211, 0, -211}},
	{0x0271, 0x0271, d{10749, 0, 10749}},
	{0x0272, 0x0272, d{-213, 0, -213}},
	{0x0275, 0x0275, d{-214, 0, -214}},
	{0x027D, 0x027D, d{10727, 0, 10727}},
	{0x0280, 0x0280, d{-218, 0, -218}},
	{0x0282, 0x0282, d{42307, 0, 42307}},
	{0x0283, 0x0283, d{-218, 0, -218}},
	{0x0287, 0x0287, d{42282, 0, 42282}},
	{0x0288, 0x0288, d{-218, 0, -218}},
	{0x0289, 0x0289, d{-69, 0, -69}},
	{0x028A, 0x028B, d{-217, 0, -217}},
	{0x028C, 0x028C, d{-71, 0, -71}},
	{0x0292, 0x0292, d{-219, 0, -219}},
	{0x029D, 0x029D, d{42261, 0, 42261}},
	{0x029E, 0x029E, d{42258, 0, 42258}},
	{0x0345, 0x0345, d{84, 0, 84}},
	{0x0370, 0x0373, d{UpperLower, UpperLower, UpperLower}},
	{0x0376, 0x0377, d{UpperLower, UpperLower, UpperLower}},
	{0x037B, 0x037D, d{130, 0, 130}},
	{0x037F, 0x037F, d{0, 116, 0}},
	{0x0386, 0x0386, d{0, 38, 0}},
	{0x0388, 0x038A, d{0, 37, 0}},
	{0x038C, 0x038C, d{0, 64, 0}},
	{0x038E, 0x038F, d{0, 63, 0}},
	{0x0391, 0x03A1, d{0, 32, 0}},
	{0x03A3, 0x03AB, d{0, 32, 0}},
	{0x03AC, 0x03AC, d{-38, 0, -38}},
	{0x03AD, 0x03AF, d{-37, 0, -37}},
	{0x03B1, 0x03C1, d{-32, 0, -32}},
	{0x03C2, 0x03C2, d{-31, 0, -31}},
	{0x03C3, 0x03CB, d{-32, 0, -32}},
	{0x03CC, 0x03CC, d{-64, 0, -64}},
	{0x03CD, 0x03CE, d{-63, 0, -63}},
	{0x03CF, 0x03CF, d{0, 8, 0}},
	{0x03D0, 0x03D0, d{-62, 0, -62}},
	{0x03D1, 0x03D1, d{-57, 0, -57}},
	{0x03D5, 0x03D5, d{-47, 0, -47}},
	{0x03D6, 0x03D6, d{-54, 0, -54}},
	{0x03D7, 0x03D7, d{-8, 0, -8}},
	{0x03D8, 0x03EF, d{UpperLower, UpperLower, UpperLower}},
	{0x03F0, 0x03F0, d{-86, 0, -86}},
	{0x03F1, 0x03F1, d{-80, 0, -80}},
	{0x03F2, 0x03F2, d{7, 0, 7}},
	{0x03F3, 0x03F3, d{-116, 0, -116}},
	{0x03F4, 0x03F4, d{0, -60, 0}},
	{0x03F5, 0x03F5, d{-96, 0, -96}},
	{0x03F7, 0x03F8, d{UpperLower, UpperLower, UpperLower}},
	{0x03F9, 0x03F9, d{0, -7, 0}},
	{0x03FA, 0x03FB, d{UpperLower, UpperLower, UpperLower}},
	{0x03FD, 0x03FF, d{0, -130, 0}},
	{0x0400, 0x040F, d{0, 80, 0}},
	{0x0410, 0x042F, d{0, 32, 0}},
	{0x0430, 0x044F, d{-32, 0, -32}},
	{0x0450, 0x045F, d{-80, 0, -80}},
	{0x0460, 0x0481, d{UpperLower, UpperLower, UpperLower}},
	{0x048A, 0x04BF, d{UpperLower, UpperLower, UpperLower}},
	{0x04C0, 0x04C0, d{0, 15, 0}},
	{0x04C1, 0x04CE, d{UpperLower, UpperLower, UpperLower}},
	{0x04CF, 0x04CF, d{-15, 0, -15}},
	{0x04D0, 0x052F, d{UpperLower, UpperLower, UpperLower}},
	{0x0531, 0x0556, d{0, 48, 0}},
	{0x0561, 0x0586, d{-48, 0, -48}},
	{0x10A0, 0x10C5, d{0, 7264, 0}},
	{0x10C7, 0x10C7, d{0, 7264, 0}},
	{0x10CD, 0x10CD, d{0, 7264, 0}},
	{0x10D0, 0x10FA, d{3008, 0, 0}},
	{0x10FD, 0x10FF, d{3008, 0, 0}},
	{0x13A0, 0x13EF, d{0, 38864, 0}},
	{0x13F0, 0x13F5, d{0, 8, 0}},
	{0x13F8, 0x13FD, d{-8, 0, -8}},
	{0x1C80, 0x1C80, d{-6254, 0, -6254}},
	{0x1C81, 0x1C81, d{-6253, 0, -6253}},
	{0x1C82, 0x1C82, d{-6244, 0, -6244}},
	{0x1C83, 0x1C84, d{-6242, 0, -6242}},
	{0x1C85, 0x1C85, d{-6243, 0, -6243}},
	{0x1C86, 0x1C86, d{-6236, 0, -6236}},
	{0x1C87, 0x1C87, d{-6181, 0, -6181}},
	{0x1C88, 0x1C88, d{35266, 0, 35266}},
	{0x1C90, 0x1CBA, d{0, -3008, 0}},
	{0x1CBD, 0x1CBF, d{0, -3008, 0}},
	{0x1D79, 0x1D79, d{35332, 0, 35332}},
	{0x1D7D, 0x1D7D, d{3814, 0, 3814}},
	{0x1D8E, 0x1D8E, d{35384, 0, 35384}},
	{0x1E00, 0x1E95, d{UpperLower, UpperLower, UpperLower}},
	{0x1E9B, 0x1E9B, d{-59, 0, -59}},
	{0x1E9E, 0x1E9E, d{0, -7615, 0}},
	{0x1EA0, 0x1EFF, d{UpperLower, UpperLower, UpperLower}},
	{0x1F00, 0x1F07, d{8, 0, 8}},
	{0x1F08, 0x1F0F, d{0, -8, 0}},
	{0x1F10, 0x1F15, d{8, 0, 8}},
	{0x1F18, 0x1F1D, d{0, -8, 0}},
	{0x1F20, 0x1F27, d{8, 0, 8}},
	{0x1F28, 0x1F2F, d{0, -8, 0}},
	{0x1F30, 0x1F37, d{8, 0, 8}},
	{0x1F38, 0x1F3F, d{0, -8, 0}},
	{0x1F40, 0x1F45, d{8, 0, 8}},
	{0x1F48, 0x1F4D, d{0, -8, 0}},
	{0x1F51, 0x1F51, d{8, 0, 8}},
	{0x1F53, 0x1F53, d{8, 0, 8}},
	{0x1F55, 0x1F55, d{8, 0, 8}},
	{0x1F57, 0x1F57, d{8, 0, 8}},
	{0x1F59, 0x1F59, d{0, -8, 0}},
	{0x1F5B, 0x1F5B, d{0, -8, 0}},
	{0x1F5D, 0x1F5D, d{0, -8, 0}},
	{0x1F5F, 0x1F5F, d{0, -8, 0}},
	{0x1F60, 0x1F67, d{8, 0, 8}},
	{0x1F68, 0x1F6F, d{0, -8, 0}},
	{0x1F70, 0x1F71, d{74, 0, 74}},
	{0x1F72, 0x1F75, d{86, 0, 86}},
	{0x1F76, 0x1F77, d{100, 0, 100}},
	{0x1F78, 0x1F79, d{128, 0, 128}},
	{0x1F7A, 0x1F7B, d{112, 0, 112}},
	{0x1F7C, 0x1F7D, d{126, 0, 126}},
	{0x1F80, 0x1F87, d{8, 0, 8}},
	{0x1F88, 0x1F8F, d{0, -8, 0}},
	{0x1F90, 0x1F97, d{8, 0, 8}},
	{0x1F98, 0x1F9F, d{0, -8, 0}},
	{0x1FA0, 0x1FA7, d{8, 0, 8}},
	{0x1FA8, 0x1FAF, d{0, -8, 0}},
	{0x1FB0, 0x1FB1, d{8, 0, 8}},
	{0x1FB3, 0x1FB3, d{9, 0, 9}},
	{0x1FB8, 0x1FB9, d{0, -8, 0}},
	{0x1FBA, 0x1FBB, d{0, -74, 0}},
	{0x1FBC, 0x1FBC, d{0, -9, 0}},
	{0x1FBE, 0x1FBE, d{-7205, 0, -7205}},
	{0x1FC3, 0x1FC3, d{9, 0, 9}},
	{0x1FC8, 0x1FCB, d{0, -86, 0}},
	{0x1FCC, 0x1FCC, d{0, -9, 0}},
	{0x1FD0, 0x1FD1, d{8, 0, 8}},
	{0x1FD8, 0x1FD9, d{0, -8, 0}},
	{0x1FDA, 0x1FDB, d{0, -100, 0}},
	{0x1FE0, 0x1FE1, d{8, 0, 8}},
	{0x1FE5, 0x1FE5, d{7, 0, 7}},
	{0x1FE8, 0x1FE9, d{0, -8, 0}},
	{0x1FEA, 0x1FEB, d{0, -112, 0}},
	{0x1FEC, 0x1FEC, d{0, -7, 0}},
	{0x1FF3, 0x1FF3, d{9, 0, 9}},
	{0x1FF8, 0x1FF9, d{0, -128, 0}},
	{0x1FFA, 0x1FFB, d{0, -126, 0}},
	{0x1FFC, 0x1FFC, d{0, -9, 0}},
	{0x2126, 0x2126, d{0, -7517, 0}},
	{0x212A, 0x212A, d{0, -8383, 0}},
	{0x212B, 0x212B, d{0, -8262, 0}},
	{0x2132, 0x2132, d{0, 28, 0}},
	{0x214E, 0x214E, d{-28, 0, -28}},
	{0x2160, 0x216F, d{0, 16, 0}},
	{0x2170, 0x217F, d{-16, 0, -16}},
	{0x2183, 0x2184, d{UpperLower, UpperLower, UpperLower}},
	{0x24B6, 0x24CF, d{0, 26, 0}},
	{0x24D0, 0x24E9, d{-26, 0, -26}},
	{0x2C00, 0x2C2F, d{0, 48, 0}},
	{0x2C30, 0x2C5F, d{-48, 0, -48}},
	{0x2C60, 0x2C61, d{UpperLower, UpperLower, UpperLower}},
	{0x2C62, 0x2C62, d{0, -10743, 0}},
	{0x2C63, 0x2C63, d{0, -3814, 0}},
	{0x2C64, 0x2C64, d{0, -10727, 0}},
	{0x2C65, 0x2C65, d{-10795, 0, -10795}},
	{0x2C66, 0x2C66, d{-10792, 0, -10792}},
	{0x2C67, 0x2C6C, d{UpperLower, UpperLower, UpperLower}},
	{0x2C6D, 0x2C6D, d{0, -10780, 0}},
	{0x2C6E, 0x2C6E, d{0, -10749, 0}},
	{0x2C6F, 0x2C6F, d{0, -10783, 0}},
	{0x2C70, 0x2C70, d{0, -10782, 0}},
	{0x2C72, 0x2C73, d{UpperLower, UpperLower, UpperLower}},
	{0x2C75, 0x2C76, d{UpperLower, UpperLower, UpperLower}},
	{0x2C7E, 0x2C7F, d{0, -10815, 0}},
	{0x2C80, 0x2CE3, d{UpperLower, UpperLower, UpperLower}},
	{0x2CEB, 0x2CEE, d{UpperLower, UpperLower, UpperLower}},
	{0x2CF2, 0x2CF3, d{UpperLower, UpperLower, UpperLower}},
	{0x2D00, 0x2D25, d{-7264, 0, -7264}},
	{0x2D27, 0x2D27, d{-7264, 0, -7264}},
	{0x2D2D, 0x2D2D, d{-7264, 0, -7264}},
	{0xA640, 0xA66D, d{UpperLower, UpperLower, UpperLower}},
	{0xA680, 0xA69B, d{UpperLower, UpperLower, UpperLower}},
	{0xA722, 0xA72F, d{UpperLower, UpperLower, UpperLower}},
	{0xA732, 0xA76F, d{UpperLower, UpperLower, UpperLower}},
	{0xA779, 0xA77C, d{UpperLower, UpperLower, UpperLower}},
	{0xA77D, 0xA77D, d{0, -35332, 0}},
	{0xA77E, 0xA787, d{UpperLower, UpperLower, UpperLower}},
	{0xA78B, 0xA78C, d{UpperLower, UpperLower, UpperLower}},
	{0xA78D, 0xA78D, d{0, -42280, 0}},
	{0xA790, 0xA793, d{UpperLower, UpperLower, UpperLower}},
	{0xA794, 0xA794, d{48, 0, 48}},
	{0xA796, 0xA7A9, d{UpperLower, UpperLower, UpperLower}},
	{0xA7AA, 0xA7AA, d{0, -42308, 0}},
	{0xA7AB, 0xA7AB, d{0, -42319, 0}},
	{0xA7AC, 0xA7AC, d{0, -42315, 0}},
	{0xA7AD, 0xA7AD, d{0, -42305, 0}},
	{0xA7AE, 0xA7AE, d{0, -42308, 0}},
	{0xA7B0, 0xA7B0, d{0, -42258, 0}},
	{0xA7B1, 0xA7B1, d{0, -42282, 0}},
	{0xA7B2, 0xA7B2, d{0, -42261, 0}},
	{0xA7B3, 0xA7B3, d{0, 928, 0}},
	{0xA7B4, 0xA7C3, d{UpperLower, UpperLower, UpperLower}},
	{0xA7C4, 0xA7C4, d{0, -48, 0}},
	{0xA7C5, 0xA7C5, d{0, -42307, 0}},
	{0xA7C6, 0xA7C6, d{0, -35384, 0}},
	{0xA7C7, 0xA7CA, d{UpperLower, UpperLower, UpperLower}},
	{0xA7D0, 0xA7D1, d{UpperLower, UpperLower, UpperLower}},
	{0xA7D6, 0xA7D9, d{UpperLower, UpperLower, UpperLower}},
	{0xA7F5, 0xA7F6, d{UpperLower, UpperLower, UpperLower}},
	{0xAB53, 0xAB53, d{-928, 0, -928}},
	{0xAB70, 0xABBF, d{-38864, 0, -38864}},
	{0xFF21, 0xFF3A, d{0, 32, 0}},
	{0xFF41, 0xFF5A, d{-32, 0, -32}},
	{0x10400, 0x10427, d{0, 40, 0}},
	{0x10428, 0x1044F, d{-40, 0, -40}},
	{0x104B0, 0x104D3, d{0, 40, 0}},
	{0x104D8, 0x104FB, d{-40, 0, -40}},
	{0x10570, 0x1057A, d{0, 39, 0}},
	{0x1057C, 0x1058A, d{0, 39, 0}},
	{0x1058C, 0x10592, d{0, 39, 0}},
	{0x10594, 0x10595, d{0, 39, 0}},
	{0x10597, 0x105A1, d{-39, 0, -39}},
	{0x105A3, 0x105B1, d{-39, 0, -39}},
	{0x105B3, 0x105B9, d{-39, 0, -39}},
	{0x105BB, 0x105BC, d{-39, 0, -39}},
	{0x10C80, 0x10CB2, d{0, 64, 0}},
	{0x10CC0, 0x10CF2, d{-64, 0, -64}},
	{0x118A0, 0x118BF, d{0, 32, 0}},
	{0x118C0, 0x118DF, d{-32, 0, -32}},
	{0x16E40, 0x16E5F, d{0, 32, 0}},
	{0x16E60, 0x16E7F, d{-32, 0, -32}},
	{0x1E900, 0x1E921, d{0, 34, 0}},
	{0x1E922, 0x1E943, d{-34, 0, -34}},
}


// ToLower maps the rune to lower case.
func unicodeToLower(r rune) rune {
	if r <= MaxASCII {
		if 'A' <= r && r <= 'Z' {
			r += 'a' - 'A'
		}
		return r
	}
	return To(LowerCase, r)
}

// To maps the rune to the specified case: [UpperCase], [LowerCase], or [TitleCase].
func To(_case int, r rune) rune {
	r, _ = to(_case, r, CaseRanges)
	return r
}

// to maps the rune using the specified case mapping.
// It additionally reports whether caseRange contained a mapping for r.
func to(_case int, r rune, caseRange []CaseRange) (mappedRune rune, foundMapping bool) {
	if _case < 0 || MaxCase <= _case {
		return ReplacementChar, false // as reasonable an error as any
	}
	// binary search over ranges
	lo := 0
	hi := len(caseRange)
	for lo < hi {
		m := int(uint(lo+hi) >> 1)
		cr := caseRange[m]
		if rune(cr.Lo) <= r && r <= rune(cr.Hi) {
			delta := cr.Delta[_case]
			if delta > MaxRune {
				// In an Upper-Lower sequence, which always starts with
				// an UpperCase letter, the real deltas always look like:
				//	{0, 1, 0}    UpperCase (Lower is next)
				//	{-1, 0, -1}  LowerCase (Upper, Title are previous)
				// The characters at even offsets from the beginning of the
				// sequence are upper case; the ones at odd offsets are lower.
				// The correct mapping can be done by clearing or setting the low
				// bit in the sequence offset.
				// The constants UpperCase and TitleCase are even while LowerCase
				// is odd so we take the low bit from _case.
				return rune(cr.Lo) + ((r-rune(cr.Lo))&^1 | rune(_case&1)), true
			}
			return r + delta, true
		}
		if r < rune(cr.Lo) {
			hi = m
		} else {
			lo = m + 1
		}
	}
	return r, false
}

// ---

// --- unicode.utf8

// The conditions RuneError==unicode.ReplacementChar and
// MaxRune==unicode.MaxRune are verified in the tests.
// Defining them locally avoids this package depending on package unicode.

// Numbers fundamental to the encoding.
const (
	RuneError = '\uFFFD'     // the "error" Rune or "Unicode replacement character"
	RuneSelf  = 0x80         // characters below RuneSelf are represented as themselves in a single byte.
	//MaxRune   = '\U0010FFFF' // Maximum valid Unicode code point.
	UTFMax    = 4            // maximum number of bytes of a UTF-8 encoded Unicode character.
)

// Code points in the surrogate range are not valid for UTF-8.
const (
	surrogateMin = 0xD800
	surrogateMax = 0xDFFF
)

const (
	t1 = 0b00000000
	tx = 0b10000000
	t2 = 0b11000000
	t3 = 0b11100000
	t4 = 0b11110000
	t5 = 0b11111000

	maskx = 0b00111111
	mask2 = 0b00011111
	mask3 = 0b00001111
	mask4 = 0b00000111

	rune1Max = 1<<7 - 1
	rune2Max = 1<<11 - 1
	rune3Max = 1<<16 - 1

	// The default lowest and highest continuation byte.
	locb = 0b10000000
	hicb = 0b10111111

	// These names of these constants are chosen to give nice alignment in the
	// table below. The first nibble is an index into acceptRanges or F for
	// special one-byte cases. The second nibble is the Rune length or the
	// Status for the special one-byte case.
	xx = 0xF1 // invalid: size 1
	as = 0xF0 // ASCII: size 1
	s1 = 0x02 // accept 0, size 2
	s2 = 0x13 // accept 1, size 3
	s3 = 0x03 // accept 0, size 3
	s4 = 0x23 // accept 2, size 3
	s5 = 0x34 // accept 3, size 4
	s6 = 0x04 // accept 0, size 4
	s7 = 0x44 // accept 4, size 4
)

// first is information about the first byte in a UTF-8 sequence.
var first = [256]uint8{
	//   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x00-0x0F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x10-0x1F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x20-0x2F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x30-0x3F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x40-0x4F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x50-0x5F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x60-0x6F
	as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, as, // 0x70-0x7F
	//   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F
	xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0x80-0x8F
	xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0x90-0x9F
	xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xA0-0xAF
	xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xB0-0xBF
	xx, xx, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, // 0xC0-0xCF
	s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, s1, // 0xD0-0xDF
	s2, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s3, s4, s3, s3, // 0xE0-0xEF
	s5, s6, s6, s6, s7, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, xx, // 0xF0-0xFF
}

// acceptRange gives the range of valid values for the second byte in a UTF-8
// sequence.
type acceptRange struct {
	lo uint8 // lowest value for second byte.
	hi uint8 // highest value for second byte.
}

// acceptRanges has size 16 to avoid bounds checks in the code that uses it.
var acceptRanges = [16]acceptRange{
	0: {locb, hicb},
	1: {0xA0, hicb},
	2: {locb, 0x9F},
	3: {0x90, hicb},
	4: {locb, 0x8F},
}

// AppendRune appends the UTF-8 encoding of r to the end of p and
// returns the extended buffer. If the rune is out of range,
// it appends the encoding of [RuneError].
func AppendRune(p []byte, r rune) []byte {
	// This function is inlineable for fast handling of ASCII.
	if uint32(r) <= rune1Max {
		return append(p, byte(r))
	}
	return appendRuneNonASCII(p, r)
}

func appendRuneNonASCII(p []byte, r rune) []byte {
	// Negative values are erroneous. Making it unsigned addresses the problem.
	switch i := uint32(r); {
	case i <= rune2Max:
		return append(p, t2|byte(r>>6), tx|byte(r)&maskx)
	case i > MaxRune, surrogateMin <= i && i <= surrogateMax:
		r = RuneError
		fallthrough
	case i <= rune3Max:
		return append(p, t3|byte(r>>12), tx|byte(r>>6)&maskx, tx|byte(r)&maskx)
	default:
		return append(p, t4|byte(r>>18), tx|byte(r>>12)&maskx, tx|byte(r>>6)&maskx, tx|byte(r)&maskx)
	}
}

// DecodeRuneInString is like DecodeRune but its input is a string. If s is
// empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it
// returns (RuneError, 1). Both are impossible results for correct, non-empty
// UTF-8.
//
// An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
// out of range, or is not the shortest possible UTF-8 encoding for the
// value. No other validation is performed.
func DecodeRuneInString(s string) (r rune, size int) {
	n := len(s)
	if n < 1 {
		return RuneError, 0
	}
	s0 := s[0]
	x := first[s0]
	if x >= as {
		// The following code simulates an additional check for x == xx and
		// handling the ASCII and invalid cases accordingly. This mask-and-or
		// approach prevents an additional branch.
		mask := rune(x) << 31 >> 31 // Create 0x0000 or 0xFFFF.
		return rune(s[0])&^mask | RuneError&mask, 1
	}
	sz := int(x & 7)
	accept := acceptRanges[x>>4]
	if n < sz {
		return RuneError, 1
	}
	s1 := s[1]
	if s1 < accept.lo || accept.hi < s1 {
		return RuneError, 1
	}
	if sz <= 2 { // <= instead of == to help the compiler eliminate some bounds checks
		return rune(s0&mask2)<<6 | rune(s1&maskx), 2
	}
	s2 := s[2]
	if s2 < locb || hicb < s2 {
		return RuneError, 1
	}
	if sz <= 3 {
		return rune(s0&mask3)<<12 | rune(s1&maskx)<<6 | rune(s2&maskx), 3
	}
	s3 := s[3]
	if s3 < locb || hicb < s3 {
		return RuneError, 1
	}
	return rune(s0&mask4)<<18 | rune(s1&maskx)<<12 | rune(s2&maskx)<<6 | rune(s3&maskx), 4
}

// RuneLen returns the number of bytes required to encode the rune.
// It returns -1 if the rune is not a valid value to encode in UTF-8.
func RuneLen(r rune) int {
	switch {
	case r < 0:
		return -1
	case r <= rune1Max:
		return 1
	case r <= rune2Max:
		return 2
	case surrogateMin <= r && r <= surrogateMax:
		return -1
	case r <= rune3Max:
		return 3
	case r <= MaxRune:
		return 4
	}
	return -1
}

// decoderune returns the non-ASCII rune at the start of
// s[k:] and the index after the rune in s.
//
// decoderune assumes that caller has checked that
// the to be decoded rune is a non-ASCII rune.
//
// If the string appears to be incomplete or decoding problems
// are encountered (runeerror, k + 1) is returned to ensure
// progress when decoderune is used to iterate over a string.
//go:linkname Decoderune runtime.decoderune
func Decoderune(s string, k int) (r rune, pos int) {
	pos = k

	if k >= len(s) {
		return RuneError, k + 1
	}

	s = s[k:]

	switch {
	case t2 <= s[0] && s[0] < t3:
		// 0080-07FF two byte sequence
		if len(s) > 1 && (locb <= s[1] && s[1] <= hicb) {
			r = rune(s[0]&mask2)<<6 | rune(s[1]&maskx)
			pos += 2
			if rune1Max < r {
				return
			}
		}
	case t3 <= s[0] && s[0] < t4:
		// 0800-FFFF three byte sequence
		if len(s) > 2 && (locb <= s[1] && s[1] <= hicb) && (locb <= s[2] && s[2] <= hicb) {
			r = rune(s[0]&mask3)<<12 | rune(s[1]&maskx)<<6 | rune(s[2]&maskx)
			pos += 3
			if rune2Max < r && !(surrogateMin <= r && r <= surrogateMax) {
				return
			}
		}
	case t4 <= s[0] && s[0] < t5:
		// 10000-1FFFFF four byte sequence
		if len(s) > 3 && (locb <= s[1] && s[1] <= hicb) && (locb <= s[2] && s[2] <= hicb) && (locb <= s[3] && s[3] <= hicb) {
			r = rune(s[0]&mask4)<<18 | rune(s[1]&maskx)<<12 | rune(s[2]&maskx)<<6 | rune(s[3]&maskx)
			pos += 4
			if rune3Max < r && r <= MaxRune {
				return
			}
		}
	}

	return RuneError, k + 1
}

// --- strings


// // The constant is known to the compiler.
// // There is no fundamental theory behind this number.
// const tmpStringBufSize = 32

// type tmpBuf [tmpStringBufSize]byte

// // concatstrings implements a Go string concatenation x+y+z+...
// // The operands are passed in the slice a.
// // If buf != nil, the compiler has determined that the result does not
// // escape the calling function, so the string data can be stored in buf
// // if small enough.
// //go:linkname Concatstrings runtime.concatstrings
// func Concatstrings(_buf unsafe.Pointer, _a unsafe.Pointer, _a_len int) string {
// 	buf := (*tmpBuf)(_buf)
// 	// idx := 0
// 	l := 0
// 	count := 0
// 	_a_cur := _a
// 	for i := 0; i < _a_len; i++ {
// 		x := *(*string)(_a_cur)
// 		_a_cur = unsafe.Pointer(uintptr(_a_cur) + unsafe.Sizeof(string))
// 		n := len(x)
// 		if n == 0 {
// 			continue
// 		}
// 		if l+n < l {
// 			panic("string concatenation too long")
// 		}
// 		l += n
// 		count++
// 		// idx = i
// 	}
// 	// for i, x := range a {
// 	// 	n := len(x)
// 	// 	if n == 0 {
// 	// 		continue
// 	// 	}
// 	// 	if l+n < l {
// 	// 		panic("string concatenation too long")
// 	// 	}
// 	// 	l += n
// 	// 	count++
// 	// 	idx = i
// 	// }
// 	if count == 0 {
// 		return ""
// 	}

// 	// If there is just one string and either it is not on the stack
// 	// or our result does not escape the calling frame (buf != nil),
// 	// then we can return that string directly.
// 	// if count == 1 && (buf != nil || !stringDataOnStack(a[idx])) {
// 	if count == 1 && buf != nil {
// 		// return a[idx]
// 		return *(*string)(_a)
// 	}
// 	s, b := rawstringtmp(buf, l)
// 	// for _, x := range a {
// 	for i := 0; i < _a_len; i++ {
// 		x := *(*string)(_a)
// 		_a = unsafe.Pointer(uintptr(_a) + unsafe.Sizeof(string))

// 		copy(b, x)
// 		b = b[len(x):]
// 	}
// 	return s
// }

// func rawstringtmp(buf *tmpBuf, l int) (s string, b []byte) {
// 	if buf != nil && l <= len(buf) {
// 		b = buf[:l]
// 		// s = slicebytetostringtmp(&b[0], len(b))
// 		s = *(*string)(unsafe.Pointer(&b))
// 	} else {
// 		s, b = rawstring(l)
// 	}
// 	return
// }

// // rawstring allocates storage for a new string. The returned
// // string and byte slice both refer to the same storage.
// // The storage is not zeroed. Callers should use
// // b to set the string contents and then drop b.
// func rawstring(size int) (s string, b []byte) {
// 	tmp := make([]byte, size, 64)
// 	return *(*string)(unsafe.Pointer(&tmp)), tmp
// 	// p := mallocgc(uintptr(size), nil, false)
// 	// return unsafe.String((*byte)(p), size), unsafe.Slice((*byte)(p), size)
// }

// //go:linkname Stringtoslicebyte runtime.stringtoslicebyte
// func Stringtoslicebyte(buf *tmpBuf, s string) []byte {
// 	var b []byte
// 	if buf != nil && len(s) <= len(buf) {
// 		*buf = tmpBuf{}
// 		b = buf[:len(s)]
// 	} else {
// 		b = rawbyteslice(len(s))
// 	}
// 	copy(b, s)
// 	return b
// }

// // rawbyteslice allocates a new byte slice. The byte slice is not zeroed.
// func rawbyteslice(size int) (b []byte) {
// 	// cap := roundupsize(uintptr(size), true)
// 	// p := mallocgc(cap, nil, false)
// 	// if cap != uintptr(size) {
// 	// 	memclrNoHeapPointers(add(p, uintptr(size)), cap-uintptr(size))
// 	// }

// 	// *(*slice)(unsafe.Pointer(&b)) = slice{p, size, int(cap)}
// 	*(&b) = make([]byte, size, 64)
// 	return
// }

const maxInt = int(^uint(0) >> 1)

// LastIndexFunc returns the index into s of the last
// Unicode code point satisfying f(c), or -1 if none do.
func StringsLastIndexFunc(s string, f func(rune) bool) int {
	return lastIndexFunc(s, f, true)
}

// lastIndexFunc is the same as LastIndexFunc except that if
// truth==false, the sense of the predicate function is
// inverted.
func lastIndexFunc(s string, f func(rune) bool, truth bool) int {
	for i := len(s); i > 0; {
		r, size := decodeLastRuneInString(s[0:i])
		i -= size
		if f(r) == truth {
			return i
		}
	}
	return -1
}

// decodeLastRuneInString is like DecodeLastRune but its input is a string. If
// s is empty it returns (RuneError, 0). Otherwise, if the encoding is invalid,
// it returns (RuneError, 1). Both are impossible results for correct,
// non-empty UTF-8.
//
// An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
// out of range, or is not the shortest possible UTF-8 encoding for the
// value. No other validation is performed.
//go:noinline
func decodeLastRuneInString(s string) (r rune, size int) {
	end := len(s)
	if end == 0 {
		return RuneError, 0
	}
	start := end - 1
	r = rune(s[start])
	if r < RuneSelf {
		return r, 1
	}
	// guard against O(n^2) behavior when traversing
	// backwards through strings with long sequences of
	// invalid UTF-8.
	lim := end - UTFMax
	if lim < 0 {
		lim = 0
	}
	for start--; start >= lim; start-- {
		if runeStart(s[start]) {
			break
		}
	}
	if start < 0 {
		start = 0
	}
	r, size = decodeRuneInString(s[start:end])
	if start+size != end {
		return RuneError, 1
	}
	return r, size
}

// DecodeRuneInString is like DecodeRune but its input is a string. If s is
// empty it returns (RuneError, 0). Otherwise, if the encoding is invalid, it
// returns (RuneError, 1). Both are impossible results for correct, non-empty
// UTF-8.
//
// An encoding is invalid if it is incorrect UTF-8, encodes a rune that is
// out of range, or is not the shortest possible UTF-8 encoding for the
// value. No other validation is performed.
//go:noinline
func decodeRuneInString(s string) (r rune, size int) {
	n := len(s)
	if n < 1 {
		return RuneError, 0
	}
	s0 := s[0]
	x := first[s0]
	if x >= as {
		// The following code simulates an additional check for x == xx and
		// handling the ASCII and invalid cases accordingly. This mask-and-or
		// approach prevents an additional branch.
		mask := rune(x) << 31 >> 31 // Create 0x0000 or 0xFFFF.
		return rune(s[0])&^mask | RuneError&mask, 1
	}
	sz := int(x & 7)
	accept := acceptRanges[x>>4]
	if n < sz {
		return RuneError, 1
	}
	s1 := s[1]
	if s1 < accept.lo || accept.hi < s1 {
		return RuneError, 1
	}
	if sz <= 2 { // <= instead of == to help the compiler eliminate some bounds checks
		return rune(s0&mask2)<<6 | rune(s1&maskx), 2
	}
	s2 := s[2]
	if s2 < locb || hicb < s2 {
		return RuneError, 1
	}
	if sz <= 3 {
		return rune(s0&mask3)<<12 | rune(s1&maskx)<<6 | rune(s2&maskx), 3
	}
	s3 := s[3]
	if s3 < locb || hicb < s3 {
		return RuneError, 1
	}
	return rune(s0&mask4)<<18 | rune(s1&maskx)<<12 | rune(s2&maskx)<<6 | rune(s3&maskx), 4
}

// RuneStart reports whether the byte could be the first byte of an encoded,
// possibly invalid rune. Second and subsequent bytes always have the top two
// bits set to 10.
func runeStart(b byte) bool { return b&0xC0 != 0x80 }

// Join concatenates the elements of its first argument to create a single string. The separator
// string sep is placed between elements in the resulting string.
func StringsJoin(elems []string, sep string) string {
	switch len(elems) {
	case 0:
		return ""
	case 1:
		return elems[0]
	}

	var n int
	if len(sep) > 0 {
		if len(sep) >= maxInt/(len(elems)-1) {
			panic("strings: Join output length overflow")
		}
		n += len(sep) * (len(elems) - 1)
	}
	for _, elem := range elems {
		if len(elem) > maxInt-n {
			panic("strings: Join output length overflow")
		}
		n += len(elem)
	}

	var b StringsBuilder
	b.Grow(n)
	b.WriteString(elems[0])
	for _, s := range elems[1:] {
		b.WriteString(sep)
		b.WriteString(s)
	}
	return b.String()
}

// ToLower returns s with all Unicode letters mapped to their lower case.
func StringsToLower(s string) string {
	isASCII, hasUpper := true, false
	for i := 0; i < len(s); i++ {
		c := s[i]
		if c >= RuneSelf {
			isASCII = false
			break
		}
		hasUpper = hasUpper || ('A' <= c && c <= 'Z')
	}

	if isASCII { // optimize for ASCII-only strings.
		if !hasUpper {
			return s
		}
		var (
			b   StringsBuilder
			pos int
		)
		b.Grow(len(s))
		for i := 0; i < len(s); i++ {
			c := s[i]
			if 'A' <= c && c <= 'Z' {
				c += 'a' - 'A'
				if pos < i {
					b.WriteString(s[pos:i])
				}
				b.WriteByte(c)
				pos = i + 1
			}
		}
		if pos < len(s) {
			b.WriteString(s[pos:])
		}
		return b.String()
	}
	return stringsMap(unicodeToLower, s)
}

// Map returns a copy of the string s with all its characters modified
// according to the mapping function. If mapping returns a negative value, the character is
// dropped from the string with no replacement.
func stringsMap(mapping func(rune) rune, s string) string {
	// In the worst case, the string can grow when mapped, making
	// things unpleasant. But it's so rare we barge in assuming it's
	// fine. It could also shrink but that falls out naturally.

	// The output buffer b is initialized on demand, the first
	// time a character differs.
	var b StringsBuilder

	for i, c := range s {
		r := mapping(c)
		if r == c && c != RuneError {
			continue
		}

		var width int
		if c == RuneError {
			c, width = DecodeRuneInString(s[i:])
			if width != 1 && r == c {
				continue
			}
		} else {
			width = RuneLen(c)
		}

		b.Grow(len(s) + UTFMax)
		b.WriteString(s[:i])
		if r >= 0 {
			b.WriteRune(r)
		}

		s = s[i+width:]
		break
	}

	// Fast path for unchanged input
	if b.Cap() == 0 { // didn't call b.Grow above
		return s
	}

	for _, c := range s {
		r := mapping(c)

		if r >= 0 {
			// common case
			// Due to inlining, it is more performant to determine if WriteByte should be
			// invoked rather than always call WriteRune
			if r < RuneSelf {
				b.WriteByte(byte(r))
			} else {
				// r is not an ASCII rune.
				b.WriteRune(r)
			}
		}
	}

	return b.String()
}




// --- strings.Builder

// A Builder is used to efficiently build a string using [Builder.Write] methods.
// It minimizes memory copying. The zero value is ready to use.
// Do not copy a non-zero Builder.
type StringsBuilder struct {
	addr *StringsBuilder // of receiver, to detect copies by value
	buf  []byte
}

// noescape hides a pointer from escape analysis. It is the identity function
// but escape analysis doesn't think the output depends on the input.
// noescape is inlined and currently compiles down to zero instructions.
// USE CAREFULLY!
// This was copied from the runtime; see issues 23382 and 7921.
//
//go:nosplit
//go:nocheckptr
func noescape(p unsafe.Pointer) unsafe.Pointer {
	x := uintptr(p)
	return unsafe.Pointer(x ^ 0)
}

func (b *StringsBuilder) copyCheck() {
	if b.addr == nil {
		// This hack works around a failing of Go's escape analysis
		// that was causing b to escape and be heap allocated.
		// See issue 23382.
		// TODO: once issue 7921 is fixed, this should be reverted to
		// just "b.addr = b".
		b.addr = (*StringsBuilder)(noescape(unsafe.Pointer(b)))
	} else if b.addr != b {
		panic("strings: illegal use of non-zero Builder copied by value")
	}
}

// String returns the accumulated string.
func (b *StringsBuilder) String() string {
	return *(*string)(unsafe.Pointer(&b.buf))
}

// Len returns the number of accumulated bytes; b.Len() == len(b.String()).
func (b *StringsBuilder) Len() int { return len(b.buf) }

// Cap returns the capacity of the builder's underlying byte slice. It is the
// total space allocated for the string being built and includes any bytes
// already written.
func (b *StringsBuilder) Cap() int { return cap(b.buf) }

// Reset resets the [Builder] to be empty.
func (b *StringsBuilder) Reset() {
	b.addr = nil
	b.buf = nil
}

// grow copies the buffer to a new, larger buffer so that there are at least n
// bytes of capacity beyond len(b.buf).
// func (b *StringsBuilder) grow(n int) {
// 	// buf := bytealg.MakeNoZero(2*cap(b.buf) + n)[:len(b.buf)]
// 	buf := make([]byte, len(b.buf), 2*cap(b.buf)+n)
// 	copy(buf, b.buf)
// 	b.buf = buf
// }

// Grow grows b's capacity, if necessary, to guarantee space for
// another n bytes. After Grow(n), at least n bytes can be written to b
// without another allocation. If n is negative, Grow panics.
func (b *StringsBuilder) Grow(n int) {
	b.copyCheck()
	if n < 0 {
		panic("strings.Builder.Grow: negative count")
	}

	// if cap(b.buf)-len(b.buf) < n {
	// 	b.grow(n)
	// }
	if b.buf == nil {
		b.buf = make([]byte, 0, 32)
	}
}

// Write appends the contents of p to b's buffer.
// Write always returns len(p), nil.
func (b *StringsBuilder) Write(p []byte) (int, error) {
	b.copyCheck()
	b.buf = append(b.buf, p...)
	return len(p), nil
}

// WriteByte appends the byte c to b's buffer.
// The returned error is always nil.
func (b *StringsBuilder) WriteByte(c byte) error {
	b.copyCheck()
	b.buf = append(b.buf, c)
	return nil
}

// WriteRune appends the UTF-8 encoding of Unicode code point r to b's buffer.
// It returns the length of r and a nil error.
func (b *StringsBuilder) WriteRune(r rune) (int, error) {
	b.copyCheck()
	n := len(b.buf)
	b.buf = AppendRune(b.buf, r)
	return len(b.buf) - n, nil
}

// WriteString appends the contents of s to b's buffer.
// It returns the length of s and a nil error.
func (b *StringsBuilder) WriteString(s string) (int, error) {
	b.copyCheck()
	b.buf = append(b.buf, s...)
	return len(s), nil
}

// ---
