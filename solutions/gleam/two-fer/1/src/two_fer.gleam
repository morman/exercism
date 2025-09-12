// bring in our options
import gleam/option.{None,Option, Some}
// bring in our string contactenator
import gleam/string.{concat}

// given a name, or not, respond with two-fer
pub fn two_fer(name: Option(String)) -> String {
  case name {
    // if name inject name into concatenation
    Some(name) -> concat(["One for ", name, ", one for me."])
    // guard for empty case
    None -> "One for you, one for me."
  }

}
