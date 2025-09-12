package speed

// Car defines the 'Car' type struct.
type Car struct {
	battery      int
	batteryDrain int
	speed        int
	distance     int
}

// NewCar creates a new remote controlled car with full battery and given specifications.
func NewCar(speed, batteryDrain int) Car {
	car := Car{
		speed:        speed,
		batteryDrain: batteryDrain,
		battery:      100,
	}
	return car
}

// Track defines the 'Track' type struct
type Track struct {
	distance int
}

// NewTrack created a new track
func NewTrack(distance int) Track {
	track := Track{
		distance: distance,
	}
	return track
}

// Drive drives the car one time. If there is not enough battery to drive on more time,
// the car will not move.
func Drive(car Car) Car {
	// first check the car's battery
	if car.battery == 0 || car.batteryDrain >= car.battery {
		car.distance = 0
		return car
	}

	// update car distance based on speed
	car.distance = car.distance + car.speed
	// update car battery based on drain
	car.battery = car.battery - car.batteryDrain
	return car
}

// CanFinish checks if a car is able to finish a certain track.
func CanFinish(car Car, track Track) bool {
	// the car can finish the race if its speed over the distance doesn't drain the battery to zero
	if track.distance/car.speed*car.batteryDrain <= car.battery {
		return true
	} else {
		return false
	}
}
