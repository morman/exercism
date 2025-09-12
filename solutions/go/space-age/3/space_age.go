/*
Package space calculates age in planetary years for specific planets: Earth and beyond
Given a person's age in Earth seconds, compute their age in years on another planet
*/
package space

// Planet stores the name of a planet
type Planet string

// define seconds per Earth year
const earthYearSeconds float64 = 31557600.0

// Age calculates the age in years on a specific planet, given age in Earth seconds
func Age(seconds float64, planet Planet) float64 {

	// initialize orbital period
	var orbitalPeriod float64

	// determine orbital period from known planets per README file
	switch planet {
	case "Mercury":
		orbitalPeriod = 0.2408467
	case "Venus":
		orbitalPeriod = 0.61519726
	case "Earth":
		orbitalPeriod = 1.0
	case "Mars":
		orbitalPeriod = 1.8808158
	case "Jupiter":
		orbitalPeriod = 11.862615
	case "Saturn":
		orbitalPeriod = 29.447498
	case "Uranus":
		orbitalPeriod = 84.016846
	case "Neptune":
		orbitalPeriod = 164.79132
    default:
        return -1
	}

	// calculate age on a specific planet by dividing age by fraction of Earth year via planet's orbital period
	return seconds / earthYearSeconds / orbitalPeriod
}
