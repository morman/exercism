package secret

func Handshake(code uint) []string {
	// initialize map of secrets
	secrets := make(map[uint]string)
	secrets[0b00001] = "wink"
	secrets[0b00010] = "double blink"
	secrets[0b00100] = "close your eyes"
	secrets[0b01000] = "jump"
	secrets[0b10000] = "reverse"

	// initialize the secret handshake response
	handshake := []string{}

	// loop over secrets and bitwise and each, appending secret to handshake if non-zero
	for k, v := range secrets {
		if k&code > 0 {
			// test for Uno reverse
			if v == "reverse" {
				// reverse the handshake
				if len(handshake) == 2 {
					// special dual case
					handshake[0], handshake[1] = handshake[1], handshake[0]
				} else {
					// non-dual case
					for i, j := 0, len(handshake)-1; i < j; i, j = i+1, j-1 {
						handshake[i], handshake[j] = handshake[j], handshake[i]
					}
				}

			} else {
				// add this secret to handshake
				handshake = append(handshake, v)
			}
		}
	}

	return handshake
}
