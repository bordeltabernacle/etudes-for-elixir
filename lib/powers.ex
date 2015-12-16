defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  @moduledoc """
  Function for raising a number to an integer power.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2013 by J. David Eisenberg.

  http://chimera.labs.oreilly.com/books/1234000001642
  """

  @doc """
  Raise a number x to an integer power n.
  Any number to the power 0 equals 1.
  Any number to the power 1 is that number itself.
  When n is positive, x^n is equal to x times x^(n - 1)
  When n is negative, x^n is equal to 1.0 / x^n
  """

  @spec raise(number(), number()) :: number()

  def raise(_, 0), do: 1
  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)
  def raise(x, n) when n > 0, do: raise(x, n, 1)

  # Helper function: counts down from n to 0,
  # multiplying the accumulator by x each time.
  # Returns the accumulator when n reaches zero.

  @spec raise(number(), number(), number()) :: number()

  defp raise(_, 0, acc), do: acc
  defp raise(x, n, acc), do: raise(x, n - 1, x * acc)

  @doc """
  Given x and n, return the nth root of x.
  This uses the Newton-Raphson method for calculating roots.
  (See http://en.wikipedia.org/wiki/Newton%27s_method for details).
  """

  @spec nth_root(number(), number()) :: number()

  def nth_root(x, n), do: nth_root(x, n, x / 2.0)

  # Helper function; given estimate for x^n,
  # recursively calculates next estimated root as
  # estimate - (estimate^n - x) / (n * estimate^(n-1))
  # until the next estimate is within a limit of previous estimate.

  defp nth_root(x, n, estimate) do
    # IO.puts("Current guess is #{estimate}")
    f = raise(estimate, n) - x
    f_prime = n * raise(estimate, n - 1)
    next = estimate - f / f_prime
    change = abs(next - estimate)
    cond do
      change < 1.0e-8 -> next
      true -> nth_root(x, n, next)
    end
  end
end
