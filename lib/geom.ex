defmodule Geom do
  @moduledoc """
  Functions for Geometric calculations.

  from *Études for Elixir*, O'Reilly Media, Inc., 2013.
  Copyright 2013 by J. David Eisenberg.

  http://chimera.labs.oreilly.com/books/1234000001642
  """

  @doc """
  Takes the length and width of a rectangle and returns
  its area. Default variables for the length and width are 1.
  """
  @spec area(number(),number()) :: number()
  def area(length \\ 1, width \\ 1), do: length * width

  @doc """
  Calculates the area of a shape, given the
  shape and two of the dimensions.
  Returns the product of its arguments for a rectangle,
  one half the product of the arguments for a triangle, and
  :math.pi times the product of the arguments for
  an ellipse. Any invalid data returns zero.
  """
  @spec area(atom(), number(),number()) :: number()
  def area(shape, a, b) do
    case shape do
      :rectangle when a >= 0 and b >= 0 -> a * b
      :triangle  when a >= 0 and b >= 0 -> a * b / 2.0
      :ellipse   when a >= 0 and b >= 0 -> :math.pi() * a * b
      _                                 -> 0
    end
	end

end
