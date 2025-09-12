/**
* Your implementation of the Bob exercise
*/
component {
	
	/**
	* @returns 
	*/
	function response( heyBob ) {
		// remove trailing whitespace
		heyBob = rtrim(heyBob);

		// initialize response
		// whatever default
		response = "Whatever.";

		// if it ends in a question
		if ( ( right (heyBob, 1) ) eq "?" ) {
			response = "Sure.";
		}

		// if we find uppercase and no lowercase
		// don't know why POSIX upper and lower aren't working here but to hell with it
		if ( ( refind( "[A-Z]", heyBob ) ) and ( not refind( "[a-z]", heyBob ) ) ) {
			// if it ends in a question
			if ( right(heyBob, 1) eq "?" ) {
				response = "Calm down, I know what I'm doing!";
			} else {
				response = "Whoa, chill out!";
			}
		}

		// if we find blank and no olphanumeric
		if ( (refind("[:space:]+", heyBob)) and ( not refind("[:alnum:]+", heyBob)) ) {
			response = "Fine. Be that way!";
		}

		// if we find zero length
		if (len(heyBob) eq 0 ) {
			response = "Fine. Be that way!";
		}

		return response;

	}
	
}