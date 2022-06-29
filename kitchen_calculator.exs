defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair,1)
  end
  def to_milliliter(volume_pair) do
    cond do
      elem(volume_pair,0) == :cup -> {:milliliter, elem(volume_pair,1) * 240}
      elem(volume_pair,0) == :milliliter -> {:milliliter, elem(volume_pair,1)}
      elem(volume_pair,0) == :fluid_ounce -> {:milliliter, elem(volume_pair,1) * 30}
      elem(volume_pair,0) == :teaspoon -> {:milliliter, elem(volume_pair,1) * 5}
      elem(volume_pair,0) == :tablespoon -> {:milliliter, elem(volume_pair,1) * 15}
    end
  end
  def from_milliliter(volume_pair, unit) do
    cond do
      unit == :cup -> {:cup, elem(volume_pair,1) / 240}
      unit == :milliliter -> {:milliliter, elem(volume_pair,1)}
      unit == :fluid_ounce -> {:fluid_ounce, elem(volume_pair,1) / 30}
      unit == :teaspoon -> {:teaspoon, elem(volume_pair,1) / 5}
      unit == :tablespoon -> {:tablespoon, elem(volume_pair,1) / 15}
    end
  end
  def convert(volume_pair, unit) do
      case {elem(volume_pair,0),unit} do
        {:tablespoon,:teaspoon} -> {unit, elem(volume_pair,1)*3}
        {:teaspoon, :tablespoon} -> {unit, elem(volume_pair,1)/3}
        {:cup, :fluid_ounce} -> {unit, elem(volume_pair, 1)*8}
        {:fluid_ounce, :teaspoon} -> {unit, elem(volume_pair, 1)*6}
        {:tablespoon, :cup} -> {unit, elem(volume_pair, 1)/16}
      end
  end
end
