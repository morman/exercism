=begin
If a given number:

is divisible by 3, add "Pling" to the result.
is divisible by 5, add "Plang" to the result.
is divisible by 7, add "Plong" to the result.
is not divisible by 3, 5, or 7, the result should be the number as a string.
=end

class Raindrops

  # given a number, return string based on "Raindrops" rules above
  def self.convert(number)
    # initialize result
    result = ''

    # test based on modulus division
    result.concat("Pling") if number.modulo(3).zero?
    result.concat("Plang") if number.modulo(5).zero?
    result.concat("Plong") if number.modulo(7).zero?

    # test if we've not yet received a result
    result.concat(number.to_s) if result.to_s.empty?

    # send result back to caller
    result
  end
  
end
