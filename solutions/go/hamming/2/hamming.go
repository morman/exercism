/*
Package hamming computes the Hamming distance between two strands of DNA.
For context see https://en.wikipedia.org/wiki/Hamming_distance
*/
package hamming

import "errors"

// Distance takes two strings of DNA and calculates their Hamming distance.
func Distance(a, b string) (int, error) {
	// convert strings of byte slices into arrays of runes
	aRunes := []rune(a)
	bRunes := []rune(b)

	// initialize Hamming distance
	var distance int

	// test if strings have different lengths
	if len(aRunes) != len(bRunes) {
		return 0, errors.New("strings are different sizes: cannot calculate Hamming distance")
	}

	// loop over the first string on letter at a time
	for position := range aRunes {
		// compare this rune to same rune in the second string and add distance if different
		if aRunes[position] != bRunes[position] {
			distance++
		}
	}

	// return data without error
	return distance, nil
}
