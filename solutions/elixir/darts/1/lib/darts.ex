defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    # bring in squares and square roots
    # import Math, only: [pow: 2]
    # import Math, only: [sqrt: 1]
    # distance from the bullseye is the square of the sum of the squares
    distance = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
    # determine score based on distance
    cond do
      distance <= 1 -> 10
      distance <= 5 -> 5
      distance <= 10 -> 1
      true -> 0
    end

  end
end
