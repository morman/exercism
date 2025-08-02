def leap_year(year):
    """A simple function that determines if a year is a leap year."""
    # leap years are divisible by 400
    if year % 400 == 0:
        return True
    # but leap years are not divisible by 100
    elif year % 100 == 0:
        return False
    # but leap years are divisible by 4
    elif year % 4 == 0:
        return True
    # and years not divisible by 4 are not leap years
    else:
        return False
