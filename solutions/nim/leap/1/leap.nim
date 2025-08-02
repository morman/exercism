# As was done with Raindrops, do computation at compile time by buildling a lookup table
const lookup = block:

  # generates the lookup table of leap years for the next ten thousand years 
  func genLookup: array[400, bool] = 
    # loop over years and leap
    for year, leap in result.mpairs():
      # test year versus divisors
      if year mod 400 == 0:
        leap = true
      elif year mod 100 == 0:
        leap = false
      elif year mod 4 == 0:
        leap = true
      else: 
        leap = false

  # create the lookup table 
  genLookup()    

# is year or any multiple of year a leap year in the table 
proc isLeapYear*(year: int): bool =
  # if this number is a factor of the table 
  lookup[year mod lookup.len]
