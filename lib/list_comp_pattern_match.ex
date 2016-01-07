defmodule ListCompPatternMatch do
  @moduledoc """
  Module to try pattern matching in list comprehensions
  """

  @doc """
  Select all males older than 40 from a list of tuples giving
  name, gender, and age.
  """
  @spec males_over_40(list(tuple())) :: list
  def males_over_40(list) do
    for {name, "M", age} <- list, age > 40 do
      name
    end
  end

  @doc"""
  Select all people who are male or older than 40 from a list of
  tuples giving name, gender, and age.
  """
  @spec male_or_over_40(list(tuple())) :: list
  def male_or_over_40(list) do
    for {name, gender, age} <- list,
    gender == "M" or age > 40 do
      name
    end
  end
end
