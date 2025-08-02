/*
Package hamming computes the Hamming distance between two strands of DNA.
For context see https://en.wikipedia.org/wiki/Hamming_distance
 */
package hamming

import "errors"

// Distance: given two strings of DNA, calculate their Hamming distance
func Distance(a, b string) (int, error) {

	// initialize Hamming distance
	var distance int

	// test if strings have different lengths
	if (len(a) != len(b)) { return 0, errors.New("Oops, strings are different sizes: cannot calculate Hamming distance!")}

	// loop over the first string on letter at a time
	for position, _ := range a {
		// compare this character to same character in the second string and add distance if different
		if a[position] != b[position] { distance++ }
	}

	// return data without error
	return distance, nil
}
