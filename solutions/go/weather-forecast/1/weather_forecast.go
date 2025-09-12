// Package weather provides a forecast for a location.
package weather

// CurrentCondition stores the weather condition.
var CurrentCondition string

// CurrentLocation stores the weather location.
var CurrentLocation string

// Forecast returns the weather condition for a location.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
