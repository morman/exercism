/**
* Your implementation of the Acronym exercise
*/
component {
	
	/**
	* @returns 
	*/
	 function abbreviate( phrase ) {
		// Implement me here
		acronym = "";
		// split code into an array based on whitespace
		wordArray = listToArray(phrase, ' -' );
		// loop over word array and collect first letters
		 for (word in wordArray) {
			firstLetter = word.left(1);
			// add upppercase first letter to acronym
			acronym = acronym & uCase(firstLetter);
		}
		 return(acronym);
	}
	
}