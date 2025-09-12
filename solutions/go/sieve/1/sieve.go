package sieve

import (
	"sort"
)

func Sieve(limit int) []int {
	// create a map of all the potential primes between 2 and limit
	primesMap := make(map[int]bool)
	// let A be an array of Boolean values, indexed by integers 2 to n, initially all set to true.

	// initially set all the potential primes to true
	for i := 2; i <= limit; i++ {
		primesMap[i] = true
	}

	// loop over array of all numbers, less than the square root of the limit, as squared versus limit
	for i := 2; i*i <= limit; i++ {
		// if A[i] is true
		if primesMap[i] == true {
			// for twice the number, until it's less than the limit, incremented by the numbers in the array
			for j := i * 2; j <= limit; j += i {
				// this number is a multiple and thus not prime
				primesMap[j] = false
			}

		}

	}

	// initialize array of primes
	primes := make([]int, 0, len(primesMap))
	// loop over potential primes
	for i := 2; i <= limit; i++ {
		// test if this potential prime is true
		if primesMap[i] == true {
			// add this to the array of primes
			primes = append(primes, i)
		}
	}

	// sort the primes
	sort.Ints(primes)
	// send back the primes
	return primes
}
