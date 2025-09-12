package scrabble

import "unicode"

func Score(word string) int {
	var score int
	letters := []rune(word)
	for _, letter := range letters {
		letter := unicode.ToUpper(letter)
		switch letter {
		case 'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T':
			score = score + 1
		case 'D', 'G':
			score = score + 2
		case 'B', 'C', 'M', 'P':
			score = score + 3
		case 'F', 'H', 'V', 'W', 'Y':
			score = score + 4
		case 'K':
			score = score + 5
		case 'J', 'X':
			score = score + 8
		case 'Q', 'Z':
			score = score + 10
		}
	}

	return score
}
