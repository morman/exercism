/*
Package raindrops receives and integer and plays raindrop sounds based on factors of 3, 5, and 7.
If the integer cannot be divided by factors, the integer is returned.
*/
package raindrops

import "strconv"

// Convert receives an integer and returns a string of raindrop sounds
func Convert(number int) string {

	// initialize response string of raindrop sounds
	var sounds string

	// test if number can be diviedd by 3
	if number%3 == 0 {
		// append 'Pling' to string
		sounds += "Pling"
	}

	// test if number can be divided by 5
	if number%5 == 0 {
		// append 'Plang' to string
		sounds += "Plang"
	}

	// test if number can be divided by 7
	if number%7 == 0 {
		// append 'Plong' to string
		sounds += "Plong"
	}

	// test if we've not encountered numbers and sounds is empty
	if sounds == "" {
		// convert number to string to maintain function type signature
		return strconv.Itoa(number)
	}

	return sounds
}
