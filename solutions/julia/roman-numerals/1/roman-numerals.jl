function to_roman(number)
    # guard against Arabic number zero or negative 
    if number <= 0
        throw(ErrorException("Cannot convert Arabic numbers of zero or less to Roman numerals."))
    end
    
    # guard against Arabic numbers greater than 3999
    if number > 3999
        throw(ErrorException("Cannot convert Arabic numbers greater than 3999 to Roman numerals."))
    end

    # initialize Roman number
    roman_number = ""

    # loop while we still have numbers
    while number > 0

        # iteratively match rules, append Roman, and decrement Arabic
        if number >= 1000
            # append Roman
            roman_number *= "M"
            # decrement Arabic
            number -= 1000
        elseif number >= 900
            # append Roman
            roman_number *= "CM"
            # decrement Arabic 
            number -= 900
        elseif number >= 500
            # append Roman
            roman_number *= "D" 
            # decrement Arabic
            number -= 500
        elseif number >= 400
            # append Roman
            roman_number *= "CD"
            # decrement Arabic
            number -= 400
        elseif number >= 100
             # append Roman
            roman_number *= "C"
            # decrement Arabic
            number -= 100
        elseif number >= 90
            # append Roman
            roman_number *= "XC"
            # decrement Arabic
            number -= 90
        elseif number >= 50
            # append Roman
            roman_number *= "L" 
            # decrement Arabic
            number -= 50
        elseif number >= 40
            # append Roman
            roman_number *= "XL" 
            # decrement Arabic
            number -= 40
        elseif number >= 10
             # append Roman
            roman_number *= "X" 
            # decrement Arabic
            number -= 10
        elseif number >= 9
             # append Roman
            roman_number *= "IX" 
            # decrement Arabic
            number -= 9
        elseif number >= 5
             # append Roman
            roman_number *= "V" 
            # decrement Arabic
            number -= 5
        elseif number >= 4
            # append Roman
            roman_number *= "IV"
            # decrement Arabic
            number -= 4
        elseif number >= 1
            # append Roman
            roman_number *= "I"
            # decrement Arabic
            number -= 1 
        end
    end

    # send back Roman number
    return roman_number
end
