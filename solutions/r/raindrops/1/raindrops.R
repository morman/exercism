raindrops <- function(number) {
  # initialize return value
  raindrop_sounds <- ""
  # test for 3 as a factor
  if (number %% 3 == 0) {
    # add sound
    raindrop_sounds = paste(raindrop_sounds, "Pling", sep = "")
  }
  # test for 5 as a factor
  if (number %% 5 == 0) {
    # add sound
    raindrop_sounds = paste(raindrop_sounds, "Plang", sep = "")    
  }
  # test for 7 as a factor
  if (number %% 7 == 0) {
    # add sound
    raindrop_sounds = paste(raindrop_sounds, "Plong", sep = "")    
  }
  
  # if none are factors, return number
  if (number %% 3 != 0 & number %% 5 != 0 & number %% 7 != 0) {
    return(toString(number))
  } else {
    # otherwise return sounds. 
    return(raindrop_sounds)
  }
}
