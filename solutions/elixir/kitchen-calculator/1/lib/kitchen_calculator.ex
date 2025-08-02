defmodule KitchenCalculator do
  # Get the numeric component from a volume-pair
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  # Convert the volume-pair to milliliters, maintaining tuple format
  def to_milliliter(volume_pair) do
    # grab the first element from the tuple and guard with type and multiply with mL
    # TODO: how can I do this with functional matches instead?
    {unit, volume} = volume_pair
    cond do
      unit == :cup -> {:milliliter, volume * 240}
      unit == :fluid_ounce -> {:milliliter, volume * 30}
      unit == :teaspoon -> {:milliliter, volume * 5}
      unit == :tablespoon -> {:milliliter, volume * 15}
      unit == :milliliter -> {:milliliter, volume}
    end
  end

  # Convert the milliliter volume-pair to another unit
  def from_milliliter(volume_pair, unit) do
    {_from, volume} = volume_pair
    cond do
      unit == :cup -> {:cup, volume / 240}
      unit == :fluid_ounce -> {:fluid_ounce, volume / 30}
      unit == :teaspoon -> {:teaspoon, volume / 5}
      unit == :tablespoon -> {:tablespoon, volume / 15}
      unit == :milliliter -> {:milliliter, volume}
    end
  end

  # Convert from any unit to any unit
  def convert(volume_pair, unit) do
    # convert the volume pair to mL, then convert the volume pair to the requested unit
    {mL, volume} = to_milliliter(volume_pair)
    from_milliliter({mL, volume} , unit)
  end
end
