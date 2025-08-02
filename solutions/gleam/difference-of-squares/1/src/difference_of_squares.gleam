// import the iterator
import gleam/iterator

// given an integer, compute the square of the range of summed integers
pub fn square_of_sum(n: Int) -> Int {
  // iterate from 1 to n, 
  iterator.range(from: 1, to: n)
  // pipe the range of integers into an accumulator fn
  |> iterator.fold(from: 0, with: fn(acc, element) { acc + element })
  // pipe that accumlated range to Square the sum.
  |> fn(sum) { sum * sum }
}

// given a number, compute the sum of the accumulated squares
pub fn sum_of_squares(n: Int) -> Int {
  // iterate from 1 to n, 
  iterator.range(from: 1, to: n)
  // pipe the range of integers into a multiplier
  |> iterator.map( fn(element) { element * element } )
  // reduce the accumulated multiplied range as above
  |> iterator.fold(from: 0, with: fn(sum, element) { sum + element })
}

// given a number, compare the difference between the square of sums and the sum of squares
pub fn difference(n: Int) -> Int {
  // reuse the fn's defined above
  square_of_sum(n) - sum_of_squares(n)
}
