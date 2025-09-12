// given two lists, add all items in the second list to the end of the first list
func append<T> (_ list1: [T], _ list2: [T]) -> [T] {
    // initialize composite array with first list
    var composite: [T] = list1
    // get items in second list and append to composite
    for element in list2 {
        composite.append(element)
    }
    return composite
}

// given a series of lists, combine all items in all lists into one flattened list
func concat<T> (_ lists: [T] ...) -> [T] {
    // initialize composite array
    var composite: [T] = []
    // loop over lists of lists, appending to composite
    for list in lists {
        // re-use append to add list to composite
        composite = append(composite, list)
    }
    return composite;
}

// given a predicate and a list, return the list of all items for which predicate(item) is True
func filter<T> (_ list: [T], _ predicate: (T) -> Bool) -> [T] {
    // initialize filtered array
    var filtered: [T] = []
    // loop over elements and apply function, appending if True
    for element in list {
        // test if the predicate applied to the element is true
        if predicate(element) {
            // add this element to the filtered array
            filtered.append(element)
        }
    }
    
    return filtered
}

// given a list, return the total number of items within it
func length<T> (_ list: [T]) -> Int {
    // guard against empty list
    if list.isEmpty {
        return 0
    } else {
        // add 1, drop the first element, and recur
        return 1 + length(Array(list.dropFirst()))
    }
}

// given a function and a list, return the list of the results of applying function(item) on all items
func map<T, U> (_ list: [T], _ function: (T) -> (U)) -> [U] {
    // initialize mapped array
    var mapped: [U] = []
    // loop over elements and apply function
    for element in list {
        // add this functioned element to the array
        mapped.append(function(element))
    }
    
    return mapped
}

// given a function, a list, and initial accumulator, fold (reduce) each item into the accumulator from the left using function(accumulator, item)
func foldLeft<T, U> (_ list: [T], accumulated: U, combine: (U, T) -> U) -> U {
    // if we no longer hve elements in the list, return the accumulator
    if list.isEmpty {
        return accumulated
    } else {
        // initialize folded with accumulator
        var folded = accumulated
        // loop over elements and apply combine
        for element in list {
            // set folded to the combination of folded and the element
            folded = combine(folded, element)
        }
        return folded
    }

}

// given a list, an initial accumulator, and a function, fold (reduce) each item into the accumulator from the right using function(item, accumulator)
func foldRight<T, A>(_ list: [T], accumulated: A, combine: (T, A) -> A) -> A {
    // if we no longer hve elements in the list, return the accumulator
    if list.isEmpty {
        return accumulated
    } else {
        // recur with head, if it exists, folding on tail with function to accumulator
        return combine(list.first!, foldRight(Array(list.dropFirst()), accumulated: accumulated, combine: combine))
    }
}

//
func reverse<T>(_ list: [T]) -> [T] {
    if list.isEmpty {
        return [T]()
    } else {
        let tail = Array(list.dropFirst())
        if let head = list.first {
            return reverse(tail) + [head]
        } else {
            return [T]()
        }
        
    }
}
