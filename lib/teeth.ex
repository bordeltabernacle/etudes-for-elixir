defmodule Teeth do

  @moduledoc """
  Functions to ascertain the health of teeth.
  Dentists check the health of your gums by checking the depth of
  the "pockets" at six different locations around each of your 32
  teeth. The depth is measured in millimeters. If any of the depths
  is greater than or equal to four millimeters, that tooth needs
  attention.
  """

  @doc """
  Given a list of lists of pocket depths, returns a list of
  teeth that require attention.
  """
  @spec alert(list(list())) :: list()

  def alert(depths) do
   alert(depths, 1, [])
  end

  defp alert([], _, results), do: results |> Enum.reverse

  defp alert([head|tail], tooth, results) do
   cond do
      head |> Stats.maximum >= 4 ->
        alert(tail, tooth + 1, [tooth | results])
      true ->
        alert(tail, tooth + 1, results)
   end
  end

  def pocket_depths do
    [[0], [2,2,1,2,2,1], [3,1,2,3,2,3],
     [3,1,3,2,1,2], [3,2,3,2,2,1], [2,3,1,2,1,1],
     [3,1,3,2,3,2], [3,3,2,1,3,1], [4,3,3,2,3,3],
     [3,1,1,3,2,2], [4,3,4,3,2,3], [2,3,1,3,2,2],
     [1,2,1,1,3,2], [1,2,2,3,2,3], [1,3,2,1,3,3], [0],
     [3,2,3,1,1,2], [2,2,1,1,3,2], [2,1,1,1,1,2],
     [3,3,2,1,1,3], [3,1,3,2,3,2], [3,3,1,2,3,3],
     [1,2,2,3,3,3], [2,2,3,2,3,3], [2,2,2,4,3,4],
     [3,4,3,3,3,4], [1,1,2,3,1,2], [2,2,3,2,1,3],
     [3,4,2,4,4,3], [3,3,2,1,2,3], [2,2,2,2,3,3],
     [3,2,3,2,3,2]]
  end

end
