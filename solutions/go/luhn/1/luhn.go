package luhn

import (
	"strings"
	"unicode"
)

func Valid(id string) bool {
	// remove spaces
	id = strings.ReplaceAll(id, " ", "")

	var total int

	// cast string to array of runes
	numbers := []rune(id)

	// do we have non-digits? not a valid Luhn number
	for _, element := range numbers {
		if unicode.IsDigit(element) == false {
			// invalid Luhn
			return false
		}
	}

	// fewer than two numbers? not a valid Luhn number
	if len(numbers) < 2 {
		// invalid Luhn
		return false
	}

	// iterate over the numbers two at a time, right to left
	for index := len(numbers) - 2; index >= 0; index -= 2 {
		// convert the rune into a digit
		digit := int(numbers[index] - '0')

		// double the digit
		doubleDigit := digit * 2

		// digits greater than 9 are reduced by 9
		if doubleDigit > 9 {
			doubleDigit -= 9
		}

		// swap this digit with the existing rune
		numbers[index] = rune('0' + doubleDigit)
	}

	// loop over array of rune digits
	for _, element := range numbers {
		// add the integer value of this rune to total
		// convert rune to integer
		number := int(element - '0')
		// add this digit to the total
		total += number

	}
	
	// if the total is evenly divisible by 10, this is a Luhn number
	if total%10 == 0 {
		return true
	} else {
		return false
	}

}
