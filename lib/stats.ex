defmodule Stats do
  @moduledoc """
  Functions for calculating the minimum and maximum in a list
  of numbers.  Also calculates the range; a tuple containing
  the minimum and maximum of the list.
  """

  @doc """
  Given a list of numbers, returns the minimum.
  """
  @spec minimum(list()) :: integer()

  def minimum([head|tail]), do: minimum(head, tail)

  @spec minimum(integer(), list()) :: integer()
  defp minimum(low, []),                  do: low
  defp minimum(low, [h|t]) when h >= low, do: minimum(low, t)
  defp minimum(low, [h|t]) when h <  low, do: minimum(h, t)

  @doc """
  Given a list of numbers, returns the maximum.
  """
  @spec maximum(list()) :: integer()

  def maximum([head|tail]), do: maximum(head, tail)

  @spec maximum(integer(), list()) :: integer()
  defp maximum(high, []),                   do: high
  defp maximum(high, [h|t]) when h <= high, do: maximum(high, t)
  defp maximum(high, [h|t]) when h >  high, do: maximum(h, t)

  @doc """
  Given a list of numbers, returns a list containing
  just the minimum and maximum.
  """
  @spec range(list()) :: list()

  def range(num_list), do: [minimum(num_list), maximum(num_list)]

end
