defmodule ListCompPatternMatchTest do
	use ExUnit.Case

  @people [{"Federico", "M", 22}, {"Kim", "F", 45}, {"Hansa", "F", 30},
           {"Tran", "M", 47}, {"Cathy", "F", 32}, {"Elias", "M", 50}]

  test "return list of names of those male and over 40" do
    expected = ["Tran", "Elias"]
    assert ListCompPatternMatch.male_and_over_40(@people) == expected
  end

  test "return list of names of those male or over 40" do
    expected = ["Federico", "Kim", "Tran", "Elias"]
    assert ListCompPatternMatch.male_or_over_40(@people) == expected
  end
end
