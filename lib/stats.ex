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
  def minimum([head|tail]), do: _minimum(head, tail)

  defp _minimum(low, []),                  do: low
  defp _minimum(low, [h|t]) when h >= low, do: _minimum(low, t)
  defp _minimum(low, [h|t]) when h <  low, do: _minimum(h, t)

  @doc """
  Given a list of numbers, returns the maximum.
  """
  @spec maximum(list()) :: integer()
  def maximum([head|tail]), do: _maximum(head, tail)

  defp _maximum(high, []),                   do: high
  defp _maximum(high, [h|t]) when h <= high, do: _maximum(high, t)
  defp _maximum(high, [h|t]) when h >  high, do: _maximum(h, t)

  @doc """
  Given a list of numbers, returns a list containing
  just the minimum and maximum.
  """
  @spec range(list()) :: list()
  def range(num_list), do: [minimum(num_list), maximum(num_list)]

  @doc """
  Calculates the mean for a list of numbers
  """
  @spec mean(list()) :: number()
  def mean(list) do
    List.foldl(list, 0, &(&1 + &2)) / Enum.count(list)
  end

  @doc """
  Calculates the standard devaition for a list of numbers
  """
  @spec stdv(list()) :: number()
  def stdv(list) do
    {sum, sum_of_squares} = list
    |> List.foldl({0,0}, fn(x, {acc, acc_sq}) ->
      {acc + x, acc_sq + x * x} end)
    n = Enum.count(list)
    :math.sqrt(((n * sum_of_squares) - (sum * sum)) / (n * (n  - 1)))
  end
end
