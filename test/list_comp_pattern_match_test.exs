defmodule ListCompPatternMatchTest do
	use ExUnit.Case
  alias ListCompPatternMatch, as: L

  @people [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
           {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]

  test "return list of names of males over 40" do
    expected = ["Tran", "Elias"]
    assert L.males_over_40(@people) == expected
  end

  test "return list of names of those male or over 40" do
    expected = ["Federico", "Kim", "Tran", "Elias"]
    assert L.male_or_over_40(@people) == expected
  end
end
