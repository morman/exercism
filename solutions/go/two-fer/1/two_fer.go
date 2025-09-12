/*
Package twofer receives a NAME and responds with "One for NAME, one for me." unless name is undefined.
If name is undefined, the second person singular "you" is used instead of NAME>.
 */
package twofer

import (
	"fmt"
)

// ShareWith Receives a name and returns a sharing phrase, based on whether name is empty or not
func ShareWith(name string) string {
	// test if name is defined
	if name != "" {
		// format the string with the provided name
		return fmt.Sprintf("One for %s, one for me.", name)
	} else {
		// lacking name, use the second person pronoun
		return "One for you, one for me."
	}
}
