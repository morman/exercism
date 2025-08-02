/**
* Your implementation of the Anagram exercise
*/
component {
	
	/**
	* @returns a list of candidates that are anagrams for subject
	*/
	function anagrams( string subject, array candidates ) {
		// initialize anagram set
		anagramList = [];
		// loop over the candidates and compare to subject
		for (candidate in candidates) {
			// equivalency case, reject equality
			if (CompareNoCase(candidate, subject) eq 0) {
				// do candidate letters match subject letters? skip
				continue;
			}

			// convert both strings to lists, sort them, then compare
			sortedCandidate = listSort(candidate, "textnocase", "asc", "");
			sortedSubject = listSort(subject, "textnocase", "asc", "");

			// if the sorted lists have the same characters, add to anagram set
			if (CompareNoCase(sortedCandidate, sortedSubject) eq 0) {
				arrayAppend(anagramList, candidate);
			}

		}
		return anagramList;
	}
}