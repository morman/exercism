package romannumerals

import (
	"errors"
	"sort"
)

// ToRomanNumeral converts an Arabic integer into a Roman string
func ToRomanNumeral(arabicNumeral int) (string, error) {
	// guard against numbers out of range
	if arabicNumeral < 1 || arabicNumeral > 3999 {
		return "", errors.New("provided Arabic numeral outside of Roman range")
	}

	// initialize return string
	var romanNumerals string

	// build a map of Roman bases and their corresponding Arabic equivalents
	mapArabicToRoman := make(map[int]string)
	mapArabicToRoman[1000] = "M"
	mapArabicToRoman[900] = "CM"
	mapArabicToRoman[500] = "D"
	mapArabicToRoman[400] = "CD"
	mapArabicToRoman[100] = "C"
	mapArabicToRoman[90] = "XC"
	mapArabicToRoman[50] = "L"
	mapArabicToRoman[40] = "XL"
	mapArabicToRoman[10] = "X"
	mapArabicToRoman[9] = "IX"
	mapArabicToRoman[5] = "V"
	mapArabicToRoman[4] = "IV"
	mapArabicToRoman[1] = "I"

	// build a sorted list of keys
	keys := make([]int, 0, len(mapArabicToRoman))
	for k := range mapArabicToRoman {
		keys = append(keys, k)
	}

	// sort bases high to low
	sort.Sort(sort.Reverse(sort.IntSlice(keys)))

	// iterate over arabicNumerals and build up romanNumerals
	for arabicNumeral > 0 {
		for _, arabic := range keys {
			// test if the Arabic number is more than this base
			if arabicNumeral >= arabic {
				// reduce the Arabic by this base
				arabicNumeral -= arabic
				// add the text for this base to the string
				romanNumerals = romanNumerals + mapArabicToRoman[arabic]
				// we've matched so move on
				break
			}
		}
	}
	return romanNumerals, nil
}
