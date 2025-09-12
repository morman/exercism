defmodule Rules do
  # calculate if Pacman can eat a ghost, based on power and proximity to ghost
  def eat_ghost?(power_pellet_active, touching_ghost) do
    if power_pellet_active and touching_ghost do
      true
    else
      false
    end
  end

  # calculate if Pacman scored, based on proximity to power or dot
  def score?(touching_power_pellet, touching_dot) do
    if touching_power_pellet or touching_dot do
      true
    else
      false
    end
  end

  # calculate if Pacman loses, based on proximity to ghost and power
  def lose?(power_pellet_active, touching_ghost) do
    if touching_ghost do
      if power_pellet_active do
        false
      else
        true
      end
    else
      false
    end
  end

  # calculate if Pacman loses, based on dots, proximity to ghosts, and power
  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    if has_eaten_all_dots do
      if touching_ghost do
        if power_pellet_active do
          true
        else
          false
        end
      else
        true
      end
    else
      false
    end
  end
end
