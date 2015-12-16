defmodule ChapterTwoTest do
  use ExUnit.Case
  doctest Geom

  test "area of a two-sided shape" do
    assert Geom.area(3, 4) == 12
  end

  test "area of another two-sided shape" do
    assert Geom.area(12, 7) == 84
  end

  test "area of a two-sided shape when given one side" do
    assert Geom.area(7) == 7
  end

  test "area of a two-sided shape when given no sides" do
    assert Geom.area() == 1
  end
end
