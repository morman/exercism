/*
Package leap determines if a year is a leap year
See README for Gregorian calendar rules
 */
package leap

// IsLeapYear - given year, determine if leap year
func IsLeapYear(year int) bool {
	// first test if the year is divisible by four
	if year % 4 == 0 {
		// then test if the year is divisible by 100
		if year % 100 == 0 {
			// finally test if the year is divisible by 400
			if year % 400 == 0 {
				return true
			}
			return false
		}
		return true
	}
	return false
}
