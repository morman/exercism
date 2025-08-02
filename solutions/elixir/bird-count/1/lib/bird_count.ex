defmodule BirdCount do
  # Check how many birds visited today, with no days
  def today([]) do
    # return nil for empty list
    nil
  end

  # Check how many birds visited today with some days
  def today([head | _tail]) do
    # return head of list
    head
  end

  # Increment today's count by 1, with no days
  def increment_day_count([]) do
    # If the list is empty, return [1].
    [1]
  end

  # Increment today's count by 1, with some days
  def increment_day_count([head | tail]) do
    # add 1 to head
    [head + 1 | tail]
  end

  # Check if there was a day with no visiting birds, true or false
  def has_day_without_birds?([head | tail]) do
    # here we check the head and then recur
    if head == 0 do
      true
    else
      has_day_without_birds?(tail)
    end
  end

  # if we've reached the end, then we've not seen days without birds
  def has_day_without_birds?([]) do
    false
  end

  # Calculate the total number of visiting birds

  # empty list case: return zero
  def total([]) do
    0
  end

  # non-empty case: call accumulate with list
  def total([head | tail]) do
    head + total(tail)
  end

  # empty case
  def busy_days([]) do
    0
  end

  # five bird guard case
  def busy_days([head | tail]) when head >= 5 do
    busy_days(tail) + 1
  end

  # default case
  def busy_days([_head | tail]) do
    busy_days(tail)
  end

end
