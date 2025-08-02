/*
Package twofer receives a NAME and responds with "One for NAME, one for me." unless name is undefined.
If name is undefined, the second person singular "you" is used instead of NAME.
*/
package twofer

import (
	"fmt"
)

// ShareWith Receives a name and returns a sharing phrase, based on whether name is empty or not
func ShareWith(name string) string {
	// test if name is undefined
	if name == "" {
		// if name is empty, set to second person singular pronoun
		name = "you"
	}

	// respond with given name or pronoun 
	return fmt.Sprintf("One for %s, one for me.", name)
}
