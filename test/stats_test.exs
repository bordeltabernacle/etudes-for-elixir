defmodule StatsTest do
	use ExUnit.Case

  @data [4, 1, 7, -17, 8, 2, 5]

  test "returns minimum" do
    assert Stats.minimum(@data) == -17
    assert Stats.minimum([52, 46]) == 46
  end

  test "returns maximum" do
    assert Stats.maximum(@data) == 8
  end

  test "returns maximum and minimum" do
    assert Stats.range(@data) == [-17,8]
  end

  test "returns mean" do
    assert Stats.mean([7, 2, 9]) == 6.0
  end

  test "returns standard deviation" do
    assert Stats.stdv([7, 2, 9]) == 3.60555127546398912486
  end
end
