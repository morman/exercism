/*
Package accumulate performs an operation on each element of the collection,
returning a new collection containing the result of applying that operation
to each element of the input collection.
*/
package accumulate

// Accumulate receives a collection and an operation, return a collection
func Accumulate(collection []string, operation func(string) string) []string {

	var operatedCollection = []string{}

	for _, member := range collection {
		operatedCollection = append(
			operatedCollection,
			operation(member),
		)
	}

	return operatedCollection
}
