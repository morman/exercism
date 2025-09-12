defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()

  # thousands case
  def numeral(number) when number >= 1000 do
    # append thousands digit, reduce total, and recur
    "M" <> numeral(number - 1000)
  end

  # 900 case
  def numeral(number) when number >= 900 do
    # append thousands less one hundreds digits, reduce total, and recur
    "CM" <> numeral(number - 900)
  end

  # 500 case
  def numeral(number) when number >= 500 do
    # append five hundreds digit, reduce total, append and recur
    "D" <> numeral(number - 500)
  end

  # 400 case
  def numeral(number) when number >= 400 do
    # append five hundreds less one hundreds digits, reduce total, append and recur
    "CD" <> numeral(number - 400)
  end

  # hundreds case
  def numeral(number) when number >= 100 do
    # append hundreds digit, reduce total, append and recur
    "C" <> numeral(number - 100)
  end

  # 90 case
  def numeral(number) when number >= 90 do
    # append hundred less ten digits, reduce total, append and recur
    "XC" <> numeral(number - 90)
  end

  # 50 case
  def numeral(number) when number >= 50 do
    # append fifty digit, reduce total, append and recur
    "L" <> numeral(number - 50)
  end

  # 40 case
  def numeral(number) when number >= 40 do
    # append fifty less ten digits, reduce total, append and recur
    "XL" <> numeral(number - 40)
  end

  # tens case
  def numeral(number) when number >= 10 do
    # append tens digit, reduce total, append and recur
    "X" <> numeral(number - 10)
  end

  # nine case
  def numeral(number) when number >= 9 do
    # append ten less one digits, reduce total, append and recur
    "IX" <> numeral(number - 9)
  end

  # five case
  def numeral(number) when number >= 5 do
    # append tens digit, reduce total, append and recur
    "V" <> numeral(number - 5)
  end

  # four case
  def numeral(number) when number >= 4 do
    # append five less one digits, reduce total, append and recur
    "IV" <> numeral(number - 4)
  end

  # ones case
  def numeral(number) when number >= 1 do
    # append ones digit and recur
    "I" <> numeral(number - 1)
  end

  # zero case
  def numeral(number) when number == 0 do
    # return empty
    ""
  end

end
