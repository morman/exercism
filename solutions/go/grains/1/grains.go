package grains

import "errors"

func Square(number int) (uint64, error) {
	var total uint64 = 1

	if number < 1 || number > 64 {
		return 0, errors.New("Out of bounds")
	}

	for i := 1; i < number; i++ {
		total = total + total
	}

	return total, nil
}

func Total() uint64 {
	var grandTotal uint64
	for i := 1; i < 65; i++ {
		square, _ := Square(i)
		grandTotal = grandTotal + square
	}
	return grandTotal
}
