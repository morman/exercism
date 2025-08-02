# predefine default value for name above the function's lexical scope
name <- "you"
# given input, responed with sharing phrase
two_fer <- function(name) {
  # return sharing phrase
  sprintf ("One for %s, one for me.", name)
}
