defmodule Dijkstra do
  @moduledoc """
  Function for finding the greatest common divisor (GCD) of two integers.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2013 by J. David Eisenberg.

  http://chimera.labs.oreilly.com/books/1234000001642
  """

  @doc """
  Calculates the greatest common divisor (GCD) of two integers,
  using a method devised by Edsger W. Dijkstra.
  """

  @spec gcd(number(), number()) :: number()

  def gcd(m, n) when m == n, do: m
  def gcd(m, n) when m > n,  do: gcd(m - n, n)
  def gcd(m, n) when m < n,  do: gcd(m, n - m)

end
