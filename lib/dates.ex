defmodule Dates do

  @moduledoc """
  Functions for manipulating calendar dates.
  """

  @doc """
  Given an ISO date format string ("yyyy-mm-dd"),
  return a list of integers in the form [yyyy, mm, dd]
  """
  @spec date_parts(list) :: list

  def date_parts(date_string) do
    date_string
    |> String.split("-")
    |> Enum.map &String.to_integer/1
  end

  @doc """
  Given a string in ISO format ("yyyy-mm-dd"),
  it returns the Julian date: the day of the year.
  """
  @spec julian(String.t) :: integer()

  def julian(date_string) do
    [year, month, day] = date_string |> date_parts
    days_per_month = year |> get_days_per_month
    month_total(month, days_per_month, 0) + day
  end

  defp get_days_per_month(year) do
    days_in_feb = cond do
      is_leap_year?(year) -> 29
      true                -> 28
    end
    [31, days_in_feb, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  end

  defp month_total(1, _days_per_month, total), do: total
  defp month_total(month, [head|tail], total) do
    month_total(month - 1, tail, total + head)
  end

  @doc """
  Returns true if the given year is a leap year,
  and false if not.
  """
  @spec is_leap_year?(integer()) :: boolean()

  def is_leap_year?(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

end
