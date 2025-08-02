defmodule Pangram do
  @doc """
  Determines if a word or sentence is a pangram.
  A pangram is a sentence using every letter of the alphabet at least once.

  Returns a boolean.

    ## Examples

      iex> Pangram.pangram?("the quick brown fox jumps over the lazy dog")
      true

  """

  # define 26 letter English alphabet
  @alphabet "abcdefghijklmnopqrstuvwxyz"


  @spec pangram?(String.t()) :: boolean
  def pangram?(sentence) do
    # test for empty sentence that returns nil
    if byte_size(sentence) == 0 do nil end

    # pipe senence through various mutations to assist comparison
    sentence
    # convert sentence to lowercase
    |> String.downcase
    # convert to a list, removing whitespace
    |> String.split("", trim: true)
    # remove duplicate characters from trimmed sentence list
    |> Enum.uniq()
    # sort sentence list alphabetically to match alphabet
    |> Enum.sort()
    # convert sentence list to string
    |> Enum.join()
    # compare sentence string to alphabet string
    |> String.contains?(@alphabet)

  end
end
