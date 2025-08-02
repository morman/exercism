# TODO: can we do this with base languages, or must we import strutils library?

# given a string, find the reverse: turn "stressed" into "desserts".
proc reverse*(s: string): string =
  # loop over the chracters in the string
  for character in s:
    # append the character to the head of the result, reversing the string s
    result = character & result
