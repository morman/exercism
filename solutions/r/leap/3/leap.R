leap <- function(year) {
  # per the README, a leap year is clealy divisible by 4, and not by 100, unless by 400
  if ((year %% 4 == 0) & ((year %% 100 != 0) | (year %% 400 == 0))) {
    return(TRUE)
  }
  return(FALSE)
}
