package secret

func Handshake(code uint) []string {
	// initially attempted this with a map, but sorting uint keys proved unfeasible...

	// initialize the secret handshake response
	var handshake []string

	// translate secrets into handshakes
	if code&0b00001 > 0 {
		handshake = append(handshake, "wink")
	}
	if code&0b00010 > 0 {
		handshake = append(handshake, "double blink")
	}
	if code&0b00100 > 0 {
		handshake = append(handshake, "close your eyes")
	}
	if code&0b01000 > 0 {
		handshake = append(handshake, "jump")
	}

	// test for Uno reverse
	if code&0b10000 > 0 {
		for i, j := 0, len(handshake)-1; i < j; i, j = i+1, j-1 {
			// reverse the elements in the array
			handshake[i], handshake[j] = handshake[j], handshake[i]
		}
	}

	// send back the secret handshake
	return handshake
}
