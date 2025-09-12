# given input, responed with sharing phrase
two_fer <- function(input) {
  # if input is missing, respond with you, otherwise with name
  if (missing(input)) {
    print ("One for you, one for me.")
  } else {
    sprintf ("One for %s, one for me.", input)
  }
}
