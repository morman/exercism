defmodule Lasagna do
  # define the expected time in the oven in minutes for the lasagne
  def expected_minutes_in_oven do
    40
  end

  # calculate the remaining time in the oven in minutes for the lasagne
  def remaining_minutes_in_oven(minutes) do
    expected_minutes_in_oven() - minutes
  end

  # calculate the prep time in minutes for the lasagne, given the number of layers
  def preparation_time_in_minutes(layers) do
    2 * layers
  end

  # calculate the total working time in minutes for the lasagne, given layers and time in the oven
  def total_time_in_minutes(layers, minutes) do
    preparation_time_in_minutes(layers) + minutes
  end

  # return "Ding!" when an alarm is requested
  def alarm do
    "Ding!"
  end

end
