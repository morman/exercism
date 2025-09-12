/*
Packafe triangle receives determines if 3 numbers together are a triangle or not.
If they are a triangle, the triangle is tested to be equilateral, isosceles, or scalene.
At this time internal angles are not tested (right, oblique, acute, obtuse, degenerate).
 */
package triangle

import "math"

// Notice KindFromSides() returns this type.
type Kind int

const (
    NaT = iota // not a triangle
    Equ // equilateral
    Iso // isosceles
    Sca // scalene
)

// KindFromSides should have a comment documenting it.
func KindFromSides(a, b, c float64) Kind {
	// initialize the kind of triangle
	var k Kind
	// is it not a triangle because a side lacks length?
	if (a <= 0) || (b <= 0) || (c <= 0) {
		k = NaT
	// is it not a triangle because a side is longer than the other two together?
	} else if (a > (b + c)) || (b > (c + a)) || (c > (a + b)) {
		k = NaT
	// is it not a triangle because a side is not a number?
	} else if (math.IsNaN(a) || math.IsNaN(b) || math.IsNaN(c)) {
		k = NaT
		// is it not a triangle because a side is (positively or negatively) infinite?
	} else if (math.IsInf(a, 0) || math.IsInf(b, 0) || math.IsInf(c, 0)) {
		k = NaT
	// is it equilateral?
	} else if (a == b) && (b == c) {
		k = Equ
	// is it isosceles?
	} else if (a == b) || (b == c) || (c == a) {
		k = Iso
	// it must be scalene
	} else {
		k = Sca
	}
	return k
}
