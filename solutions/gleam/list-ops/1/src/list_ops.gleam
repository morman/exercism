pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  // guard on cases of first List sent to function 
  case first {
    // empty first List, return second List as is
    [] -> second
    // first List still has content, accumulate head and append it to second list via recursive tail call
    [head, ..tail] -> [head, ..append(tail, second)]
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  // guard on cases of lists sent to function 
  case lists {
    // empty lists, return empty lists
    [] -> []
    // lists contain Lists, append head list to tail call of concat lists
    [head, ..tail] -> append(head, concat(tail))
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  // guard on cases of lists for which the lists exists and function is true
  case list {
    // empty list, return empty list
    [] -> []
    // is the head of the list true for the function passed in?
    [head, ..tail] ->
      case function(head) {
        // function is true, append head to list and recur
        True -> [head, ..filter(tail, function)]
        // function is false, drop head and recur
        False -> filter(tail, function)
      }
  }
}

pub fn length(list: List(a)) -> Int {
  // guard on cases of list 
  case list {
    // empty list, return zero length
    [] -> 0
    // list has elements, ignore head, increment and recur 
    [_, ..tail] -> 1 + length(tail)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  // guard on cases of list 
  case list {
    // empty list, return empty list
    [] -> []
    // elements exist, apply function to head and recur 
    [head, ..tail] -> [function(head), ..map(tail, function)]
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  // guard on cases of list 
  case list {
    // empty list, return initial value
    [] -> initial
    // elements exist, recur on tail, applying function to head
    [head, ..tail] -> foldl(tail, function(initial, head), function)
  }
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  // guard on cases of list 
  case list {
    // empty list, return initial value
    [] -> initial
    // elements exist, apply function to result of recurring over tail and head
    [head, ..tail] -> function(foldr(tail, initial, function), head)
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  // based on function and test order, I assume this requires one of the fold functions above
  // fold over the list, starting with initial empty list, accumulating head-first via a lambda
  foldl(over: list, from: [], with: fn(acc, x) { [x, ..acc] })
}
