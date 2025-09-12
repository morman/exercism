/*
Package space calculates age in planetary years for specific planets: Earth and beyond
Given a person's age in Earth seconds, compute their age in years on another planet
 */
package space

// create a type of planet, each with a different orbital period
type Planet string

// given Earth seconds and a specific planet, return age on that planet
func Age(seconds float64, planet Planet) float64 {
	// define seconds per Earth year
	const earthYearSeconds float64 = 31557600.0

	// build a map of planet names and their orbital periods in Earth years
	var orbitalPeriods = make(map[Planet]float64)

	// populate the map with planets as documented in README.md file
	orbitalPeriods["Mercury"] = 0.2408467
	orbitalPeriods["Venus"] = 0.61519726
	orbitalPeriods["Earth"] = 1.0
	orbitalPeriods["Mars"] = 1.8808158
	orbitalPeriods["Jupiter"] = 11.862615
	orbitalPeriods["Saturn"] = 29.447498
	orbitalPeriods["Uranus"] = 84.016846
	orbitalPeriods["Neptune"] = 164.79132

	// calculate age on a specific planet by dividing age by fraction of Earth year via planet's orbital period
	return seconds / earthYearSeconds / orbitalPeriods[planet]
}

