/*
Package strand returns an RNA complement, given a DNA strang.
For context see https://en.wikipedia.org/wiki/Complementarity_(molecular_biology)#DNA_and_RNA_base_pair_complementarity
*/
package strand

// ToRNA receives a DNA string and returns its RNA complement
func ToRNA(dna string) string {
	// initialize RNA
	var rna string

	// iterate over DNA received
	for _, nucleotide := range dna {
		switch nucleotide {
		case 'A':
			// build RNA with U nucleotide
			rna += "U"
		case 'C':
			// build RNA with G nucleotide
			rna += "G"
		case 'G':
			// build RNA with C nucleotide
			rna += "C"
		case 'T':
			// build RNA with A nucleotide
			rna += "A"
		}
	}

	// return transcribed RNA
	return rna
}
