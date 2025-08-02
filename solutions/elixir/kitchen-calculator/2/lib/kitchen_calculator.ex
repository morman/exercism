defmodule KitchenCalculator do
  # Get the numeric component from a volume-pair
  def get_volume(volume_pair) do
    elem(volume_pair, 1)
  end

  # Convert the volume-pair to milliliters, guarding based on unit, maintaining tuple format
  def to_milliliter({:milliliter, volume}) do
    {:milliliter, volume}
  end
  def to_milliliter({:cup, volume}) do
    {:milliliter, volume * 240}
  end
  def to_milliliter({:fluid_ounce, volume}) do
    {:milliliter, volume * 30}
  end
  def to_milliliter({:teaspoon, volume}) do
    {:milliliter, volume * 5}
  end
  def to_milliliter({:tablespoon, volume}) do
    {:milliliter, volume * 15}
  end

  # Convert the milliliter volume-pair to another unit, guarding based on unit, maintaining tuple format
  def from_milliliter({:milliliter, volume}, :milliliter) do
    {:milliliter, volume}
  end
  def from_milliliter({:milliliter, volume}, :cup) do
    {:cup, volume / 240}
  end
  def from_milliliter({:milliliter, volume}, :fluid_ounce) do
    {:fluid_ounce, volume / 30}
  end
  def from_milliliter({:milliliter, volume}, :teaspoon) do
    {:teaspoon, volume / 5}
  end
  def from_milliliter({:milliliter, volume}, :tablespoon) do
    {:tablespoon, volume / 15}
  end

  # Convert from any unit to any unit
  def convert(volume_pair, unit) do
    # convert the volume pair to mL, then convert the volume pair to the requested unit
    {mL, volume} = to_milliliter(volume_pair)
    from_milliliter({mL, volume} , unit)
  end
end
