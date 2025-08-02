leap <- function(year) {
  # is this year for divisible by 4?
  if (year %% 4 == 0) {
    # is this year divisible by 100?
    if (year %% 100 == 0) {
      # is this year divisible by 400?
      if (year %% 400 == 0) {
        # this year, divisible by 400, is a leap year
        return(TRUE)
      }
      # this year, divisible by 100, but not by 400, is not a leap year
      return(FALSE)
    }
    # this year, divisble by 4, but not by 100, is a leap year
    return(TRUE)
  }
  # this year, not divisible by 4, is not a leap year
  return(FALSE)
}
