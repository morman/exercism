/**
* Your implementation of the Diamond exercise
*/
component {
	
	/**
	* @returns 
	*/
	array function rows( letter ) {
		// Implement me here
		// total chars = 26
		// ASCII for A = 65
		// ASCII for Z = 90
		// ASCII total offset = 219

		// initialize row array
		rowArray = [];

		// determine width based on position in alphabet
		characterPosition = getCharacterPosition(letter);

		// loop over letters and build rows
		for (i=1; i <= characterPosition; i++) {
			if (i eq 1) {
				// TODO: add appropriate spaces
				row = RepeatString(" ", characterPosition - 1)
				& "A"
				& RepeatString(" ", characterPosition - 1) ;

				arrayAppend(rowArray, row);
			} else {
				row = RepeatString(" ", characterPosition - i)
				& chr(i + 64)
				& RepeatString(" ", (2 * (i-1) - 1))
				& chr(i + 64)
				& RepeatString(" ", characterPosition - i);

				arrayAppend(rowArray, row);
			}
		}

		// loop backward over position
		for (i=characterPosition - 1; i > 0; i--) {
			// TODO: add appropriate spaces
			if (i eq 1) {
				row = RepeatString(" ", characterPosition -1 )
				& "A"
				& RepeatString(" ", characterPosition -1 ) ;

				arrayAppend(rowArray, row);
			} else {
				row = RepeatString(" ", characterPosition - i)
				& chr(i + 64)
				& RepeatString(" ", (2 * (i-1) - 1))
				& chr(i + 64)
				& RepeatString(" ", characterPosition - i);

				arrayAppend(rowArray, row);
			}

		}

		return rowArray;
	}

	function getCharacterPosition(character) {
		return asc(character) - 64;
	}
	
}