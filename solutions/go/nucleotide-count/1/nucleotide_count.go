/*
Package dna computes how many times each nucleotide occurs in the DNA strand.
*/
package dna

import "fmt"

// Histogram is a mapping from nucleotide to its count in given DNA strand.
type Histogram map[rune]int

// DNA is a strand of nucleotides.
type DNA string

// Counts generates a histogram of valid nucleotides in the given DNA.
// Returns an error if d contains an invalid nucleotide.
func (d DNA) Counts() (Histogram, error) {
	// initialize histogram of counts per nucleotide
	h := Histogram{'A': 0, 'C': 0, 'G': 0, 'T': 0}
	// loop over nucleotides in DNA strand
	for _, nucleotide := range d {
		// trap against invalid nucleotide runes: only A,C,G,T are acceptable
		switch nucleotide {
		case 'A', 'C', 'T', 'G':
			// add this valid nucleotide to the histogram
			h[nucleotide]++
		default:
			// create an error specifying the invalid nucleotide
			error := fmt.Errorf(fmt.Sprintf("invalid nucleotide %c found in DNA", nucleotide))
			return h, error
		}

	}

	// return histogram without error
	return h, nil
}
