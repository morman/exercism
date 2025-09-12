/**
* Your implementation of the AtbashCipher exercise
*/
component {
	
	function encode( phrase ) {
		// initialize encoded phrase
		encodedPhrase = "";
		// remove non-alphanumeric
		phrase = reReplaceNoCase(phrase, '[^[:alnum:]]', '', 'ALL');

		// initialize array of encoded characters
		encodedCharacters = [];

		// loop over characters in the list and convert
		// unless they are numbers
		characterArray = listToArray(phrase, "");

		for (i=1; i <= len(characterArray); i++) {
			// test if the character is a number
			if (isNumeric(characterArray[i])) {
				// append without encoding
				arrayAppend(encodedCharacters, characterArray[i]);
			} else {
				// encode and append
				encodedCharacter = encodeAtbash(characterArray[i]);
				arrayAppend(encodedCharacters, encodedCharacter);
			}
		}

		// add whitespace every 5 characters
		for (i = 1; i <= arrayLen(encodedCharacters); i++) {
			 // every 5th character, add a space
			 if (i MOD 6 eq 0) {
				arrayInsertAt(encodedCharacters, i, " ");
			}
		}

		// convert array to list
		phrase = arrayToList(encodedCharacters, "");

		return phrase;
	}
	
	function decode( phrase ) {
		// remove spaces
		phrase = reReplaceNoCase(phrase, '[[:space:]]', '', 'ALL');

		// initialize array of encoded characters
		decodedCharacters = [];

		// loop over characters in the list and convert
		// unless they are numbers
		characterArray = listToArray(phrase, "");

		for (i=1; i <= len(characterArray); i++) {
			// test if the character is a number
			if (isNumeric(characterArray[i])) {
				// append without encoding
				arrayAppend(decodedCharacters, characterArray[i]);
			} else {
				// encode and append
				encodedCharacter = encodeAtbash(characterArray[i]);
				arrayAppend(decodedCharacters, encodedCharacter);
			}
		}

		// convert array to list
		decodedPhrase = arrayToList(decodedCharacters, "");

		return decodedPhrase;
	}


	// given the ASCII character encoding number, do math to find it's reverse
	// Please note: this shit is _not_ i18n compliant! (But the tests will pass...)
	function encodeAtbash ( character ) {
		// total chars = 26
		// ASCII for a = 97
		// ASCII for z = 122
		// ASCII total offset = 219

		// convert character to lowercase
		character = lCase(character);
		// get ASCII code for character
		characterCode = asc(character);
		// apply offset to generate Atbash character
		atbashCode = chr(219 - characterCode);
		return atbashCode;
	}

}