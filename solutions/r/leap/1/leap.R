leap <- function(year) {
  # first test the year for divisible by 4
  if (year %% 4 == 0) {
    # then test the year for divisible by 100
    if (year %% 100 == 0) {
      # finally test the year for divisible by 400
      if (year %% 400 == 0) {
        # this year, divisible buy 400, is a leap year
        return(TRUE)
      }
      # this year, divisble by 100, but not 400, not a leap year
      return(FALSE)
    }
    # this year, divisble by 4, but not 100, is a leap year
    return(TRUE)
  }
  # this year, not divislbe by 4, is not a leap year
  return(FALSE)
}
