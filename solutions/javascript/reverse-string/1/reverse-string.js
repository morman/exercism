//
// Given a string, reverse it and return it
// For example: input: "cool" output: "looc"
//

export const reverseString = (string) => {
  // initialize result as empty string
  let reversed_string = '';
  // loop over length of string, back to front
  for (let i = string.length - 1; i >= 0; i--) {
    // append character to reversed string
    reversed_string += string[i];
  }
  // return reversed string to the caller
  return reversed_string;
};
