defmodule ChapterFourTest do
  use ExUnit.Case
  doctest  Dijkstra

  test "gcd of two integers" do
    assert Dijkstra.gcd(2, 8)    == 2
    assert Dijkstra.gcd(14, 21)  == 7
    assert Dijkstra.gcd(125, 46) == 1
    assert Dijkstra.gcd(120, 36) == 12
  end

  test "raise x to n" do
    assert Powers.raise(5, 1)   == 5
    assert Powers.raise(2, 3)   == 8
    assert Powers.raise(1.2, 3) == 1.728
    assert Powers.raise(2, 0)   == 1
    assert Powers.raise(2, -3)  == 0.125
  end

  test "find the nth root of a number" do
    Powers.nth_root(27, 3) == 3.0
  end
end
