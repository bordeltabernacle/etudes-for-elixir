defmodule Calculus do
  @moduledoc """
  A collection of functions for calculus.
  """

  @doc """
  In calculus, the derivative of a function is "a measure of how a function changes as its input changes" (Wikipedia).
  For example, if an object is traveling at a constant velocity, that velocity is the same from moment to moment,
  so the derviative is zero. If an object is falling, its velocity changes a little bit as the object starts falling,
  and then falls faster and faster as time goes by.

  You can calculate the rate of change of a function by calculating: (f(x + delta) - f(x)) / delta, where delta is the
  interval between measurements. As delta approaches zero, you get closer and closer to the true value of the derivative.
  """
  @spec derivative(function(), number()) :: number()
  def derivative(func, n) do
    delta = 1.0e-10
    (func.(n + delta) - func.(n)) / delta
  end

end
