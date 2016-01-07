defmodule TeethTest do
	use ExUnit.Case

  test "return tooth numbers that require attention" do
    assert Teeth.alert(Teeth.pocket_depths()) == [9,11,25,26,29]
  end
end
