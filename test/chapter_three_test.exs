defmodule ChapterThreeTest do
  use ExUnit.Case
  doctest Geom

  test "area of a rectangle" do
    assert Geom.area(:rectangle, 3, 4) == 12
  end

  test "area of a triangle" do
    assert Geom.area(:triangle, 3, 5) == 7.5
  end

  test "area of an ellipse" do
    assert Geom.area(:ellipse, 2, 4) == 25.132741228718345
  end
end
