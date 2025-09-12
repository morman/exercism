defmodule LanguageList do
  # return an empty language list
  def new() do
    []
  end

  # add a language to the list
  def add(list, language) do
    # return the head of language to the tail of list
    [language | list]
  end

  # remove the first language from the list
  def remove(list) do
    # if a language is in the list, remove it and return the tail
    tl(list)
  end

  # return the first lange from the list
  def first(list) do
    hd(list)
  end

  # return the number of languages in the list
  def count(list) do
   length(list)
  end

  # determine if list contains 'Elixir' via in
  def functional_list?(list) do
    if "Elixir" in list do
      true
    else
      false
    end
  end

end
