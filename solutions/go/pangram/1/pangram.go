package pangram

import (
	"strings"
)

func IsPangram(input string) bool {
	// is the input string empty
	if len(input) == 0 {
		return false
	}
	// make a map of all the letters needed
	lettersNeeded := make(map[string]bool)

	// loop from a to z to build the map
	for r := 'a'; r < 'z'; r++ {
		// initialize the needed letter as false
		lettersNeeded[string(r)] = false
	}

	// loop over the letters needed
	for k, _ := range lettersNeeded {
		// test if lower case input matches letter needed
		if strings.Contains(strings.ToLower(input), k) {
			// update the map with a match
			lettersNeeded[k] = true
		}
	}

	// loop over the map
	for _, value := range lettersNeeded {
		// if we found a false value
		if value == false {
			// this is not a pangram
			return false
		}
	}

	// didn't find a false key, so it's a pangram
	return true
}
