package gross

// Units stores the Gross Store unit measurements.
func Units() map[string]int {
	m := make(map[string]int)
	m["quarter_of_a_dozen"] = 3
	m["half_of_a_dozen"] = 6
	m["dozen"] = 12
	m["small_gross"] = 120
	m["gross"] = 144
	m["great_gross"] = 1728
	return m
}

// NewBill creates a new bill.
func NewBill() map[string]int {
	m := make(map[string]int)
	return m
}

// AddItem adds an item to customer bill.
func AddItem(bill, units map[string]int, item, unit string) bool {
	// get units map
	units = Units()
	// test if unit provided is a valid key in the map
	_, ok := units[unit]
	// If the key exists
	if ok {
		// add item of units quantity to bill
		bill[item] += units[unit]
		return true
	} else {
		return false
	}
}

// RemoveItem removes an item from customer bill.
func RemoveItem(bill, units map[string]int, item, unit string) bool {
	// test if item not in bill
	_, present := bill[item]
	// If the key does not exist
	if !present {
		return false
	}

	// get units map
	units = Units()
	// test if unit provided is a valid key in the map
	_, ok := units[unit]
	// If the key exists
	if ok {
		// test if item quantity is less than unit volume removed
		if bill[item] < units[unit] {
			return false
		}
		// remove item of units quantity from bill
		bill[item] -= units[unit]
		// delete the item if there are zero
		if bill[item] == 0 {
			delete(bill, item)
		}
		return true
	} else {
		return false
	}
}

// GetItem returns the quantity of an item that the customer has in his/her bill.
func GetItem(bill map[string]int, item string) (int, bool) {
	// test if unit provided is a valid key in the map
	_, ok := bill[item]
	// If the key exists
	if ok {
		return bill[item], true
	} else {
		return 0, false
	}

}
