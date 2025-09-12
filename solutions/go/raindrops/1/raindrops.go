/*
Package raindrops receives and integer and plays raindrop sounds based on factors of 3, 5, and 7.
If the integer cannot be divided by factors, the integer is returned.
*/
package raindrops

import "strconv"

// Convert receives an integer and returns a string
func Convert(number int) string {
	// test if number cannot be divided by all factors
	if (number%3 != 0) && (number%5 != 0) && (number%7 != 0) {
		// convert number to string to maintain function type signature
		return strconv.Itoa(number)
	}

	// initialize response string of raindrop sounds
	var sounds string

	// test if number can be divied by 3
	if number%3 == 0 {
		// append 'Pling' to string
		sounds += "Pling"
	}

	// test if number can be divied by 5
	if number%5 == 0 {
		// append 'Plang' to string
		sounds += "Plang"
	}

	// test if number can be divied by 5
	if number%7 == 0 {
		// append 'Plang' to string
		sounds += "Plong"
	}

	return sounds
}
