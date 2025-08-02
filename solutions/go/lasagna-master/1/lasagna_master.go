package lasagna

// PreparationTime returns the total preparation time
// given layers and preparation time for each ingredient.
// NOTE: if preperation time is zero or less, a default of 2 will be used instead
func PreparationTime(layers []string, time int) int {
	if time <= 0 {
		time = 2
	}
	return time * len(layers)
}

// Quantities returns the volume of noodles and sauce, given layers
func Quantities(layers []string) (int, float64) {
	// For each noodle layer in your lasagna, you will need 50 grams of noodles.
	// For each sauce layer in your lasagna, you will need 0.2 liters of sauce
	var gramsNoodles int
	var litersSauce float64

	for _, layer := range layers {
		if layer == "noodles" {
			gramsNoodles += 50
		}
		if layer == "sauce" {
			litersSauce += 0.2
		}
	}

	return gramsNoodles, litersSauce
}

// AddSecretIngredient returns a list of ingredients,
// given my friend's list of ingredients, the last of which is the secret ingredient
// and my list of ingredients
func AddSecretIngredient(friendsIngredients []string, myIngredients []string) []string {
	// take the last element from the friends ingredients,
	secretIngredient := friendsIngredients[len(friendsIngredients)-1]
	// and replace it with the last element of my ingredients
	myIngredients[len(myIngredients)-1] = secretIngredient
	return myIngredients
}

// ScaleRecipe returns amounts of ingredients needed for the desired number of portions,
// given the amounts needed for two portions,
// and the desired number of portions you want to cook.
func ScaleRecipe(amountsForTwo []float64, numberOfPortions int) []float64 {
	var amounts []float64
	// for each amount, adjust by ratio of portions to original 2 portions
	for _, amount := range amountsForTwo {
		amounts = append(amounts, amount*(float64(numberOfPortions)/2.0))
	}
	return amounts
}
