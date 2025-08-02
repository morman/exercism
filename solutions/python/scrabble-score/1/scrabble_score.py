def score(word):
    # create dictionary of values
    letter_values = {
        'a': 1,
        'b': 3,
        'c': 3,
        'd': 2,
        'e': 1,
        'f': 4,
        'g': 2,
        'h': 4,
        'i': 1,
        'j': 8,
        'k': 5,
        'l': 1,
        'm': 3,
        'n': 1,
        'o': 1,
        'p': 3,
        'q': 10,
        'r': 1,
        's': 1,
        't': 1,
        'u': 1,
        'v': 4,
        'w': 4,
        'x': 8,
        'y': 4,
        'z': 10
    }
    # initialize score
    scrabble_score = 0
    # convert word to lowercase
    word = word.lower()

    # loop over letters in word
    for letter in word:
        # compare to dictionary and add to score
        scrabble_score += letter_values[letter]

    return scrabble_score

