package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	// use reference time to format parser
	parsed, err := time.Parse("1/02/2006 15:04:05", date)
	// complain
	if err != nil {
		fmt.Println(err)
	}
	return parsed
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	// use reference time to format parser "October 3, 2019 20:32:00"
	parsed, err := time.Parse("January 2, 2006 15:04:05", date)
	// complain
	if err != nil {
		fmt.Println(err)
	}
	// is the time we parsed after the current time?
	if time.Now().After(parsed) {
		return true
	} else {
		return false
	}
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	// use reference time to format parser "Monday, January 2, 2006 15:04:05"
	parsed, err := time.Parse("Monday, January 2, 2006 15:04:05", date)
	// complain
	if err != nil {
		fmt.Println(err)
	}
	// is it afternoon?
	if parsed.Hour() > 11 && parsed.Hour() < 18 {
		return true
	} else {
		return false
	}
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	// use reference time to format parser with single digit month, damn it, so can't reuse Schedule()
	parsed, err := time.Parse("1/2/2006 15:04:05", date)
	// complain
	if err != nil {
		fmt.Println(err)
	}
	// format output
	// => "You have an appointment on Thursday, July 25, 2019, at 13:45."
	return fmt.Sprintf("You have an appointment on %s", parsed.Format("Monday, January 2, 2006, at 15:04."))
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	// build an anniversary timestamp, substituting the current year
	anniversary := fmt.Sprintf("%d-09-15", time.Now().Year())
	// parse now with year
	parsed, err := time.Parse("2006-01-2", anniversary)
	// complain
	if err != nil {
		fmt.Println(err)
	}
	return parsed
}
