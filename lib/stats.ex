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
  defp minimum(min, []),                  do: min
  defp minimum(min, [h|t]) when h >= min, do: minimum(min, t)
  defp minimum(min, [h|t]) when h <  min, do: minimum(h, t)

  @doc """
  Given a list of numbers, returns the maximum.
  """
  @spec maximum(list()) :: integer()

  def maximum([head|tail]), do: maximum(head, tail)

  @spec maximum(integer(), list()) :: integer()
  defp maximum(max, []),                  do: max
  defp maximum(max, [h|t]) when h <= max, do: maximum(max, t)
  defp maximum(max, [h|t]) when h >  max, do: maximum(h, t)

  @doc """
  Given a list of numbers, returns a list containing
  just the minimum and maximum.
  """
  @spec range(list()) :: list()

  def range(num_list), do: [minimum(num_list), maximum(num_list)]

end
