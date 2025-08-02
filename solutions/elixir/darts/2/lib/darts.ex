defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    # distance from the bullseye is the square of the sum of the squares
    # apparently we need to use Erlang's math modules in Elixir?
    distance = :math.sqrt(:math.pow(x, 2) + :math.pow(y, 2))
    # determine score based on distance
    cond do
      distance <= 1 -> 10
      distance <= 5 -> 5
      distance <= 10 -> 1
      # STRANGELY, when I run the ExUnit tests, only this case is tested, all other tests are tagged @pending
      true -> 0
    end
  end
end
