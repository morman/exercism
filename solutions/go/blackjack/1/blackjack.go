package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
	switch card {
	case "one":
		return 1
	case "two":
		return 2
	case "three":
		return 3
	case "four":
		return 4
	case "five":
		return 5
	case "six":
		return 6
	case "seven":
		return 7
	case "eight":
		return 8
	case "nine":
		return 9
	case "ten", "jack", "queen", "king":
		return 10
	case "ace":
		return 11
	default:
		return 0
	}
}

// IsBlackjack returns true if the player has a blackjack, false otherwise.
func IsBlackjack(card1, card2 string) bool {
	if ParseCard(card1)+ParseCard(card2) == 21 {
		return true
	} else {
		return false
	}
}

// LargeHand implements the decision tree for hand scores larger than 20 points.
func LargeHand(isBlackjack bool, dealerScore int) string {
	if isBlackjack && dealerScore == 11 {
		return "S"
	} else if isBlackjack && dealerScore < 10 {
		return "W"
	} else if isBlackjack && dealerScore > 9 {
		return "S"
	} else {
		// not a blackjack but over 20 thus two aces, so split
		return "P"
	}
}

// SmallHand implements the decision tree for hand scores with less than 21 points.
func SmallHand(handScore, dealerScore int) string {
	if handScore > 16 {
		return "S"
	} else if handScore < 12 {
		return "H"
	} else if dealerScore > 6 {
		return "H"
	} else {
		return "S"
	}
}
