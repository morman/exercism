/*
Package proverb generates a proverb from a list of inputs.
See https://en.wikipedia.org/wiki/For_Want_of_a_Nail for context.
 */
package proverb

import "fmt"

// Proverb takes an array of strings and returns a proverb as an array of strings
func Proverb(rhyme []string) []string {
	// initialize the proverb
	var proverb = []string{}

	// test if we've received any data for the rhyme
	if (len(rhyme) > 0) {
		// loop over want clauses, one less than provided words
		for i := 0; i < len(rhyme) - 1; i++ {
			// append a clause with the ith and ith plus one element
			proverb = append(proverb, fmt.Sprintf("For want of a %s the %s was lost.", rhyme[i], rhyme[i + 1]))
		}
		// append the first element to the final clause
		proverb = append(proverb, fmt.Sprintf("And all for the want of a %s.", rhyme[0]))
	}
	// returned proverb to caller
	return proverb
}
