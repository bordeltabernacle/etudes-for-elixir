defmodule AskArea do

  @moduledoc """
  Prompts user for a shape and returns the area.
  """

  @doc """
  Prompts user for a shape and dimensions,
  returns the area of the shape.
  """
  @spec area() :: number()

  def area() do
    shape = get_shape()
    {a, b} = shape |> get_dimensions
    calculate(shape, a, b)
  end

  @doc """
  Offers a prompt and calls the char_to_shape() function
  to return an the relevant atom.
  """
  @spec get_shape() :: atom()

  def get_shape() do
    IO.gets("R)ectangle, T)riangle, or E)llipse: ")
    |> String.first
    |> String.upcase
    |> char_to_shape
  end

  @doc """
  Given a character returns atom of relevant shape,
  or unknown.
  """
  @spec char_to_shape(char()) :: atom()

  def char_to_shape("R"), do: :rectangle
  def char_to_shape("T"), do: :triangle
  def char_to_shape("E"), do: :ellipse
  def char_to_shape(_),   do: :unknown

  @doc """
  Offers a prompt and returns a number.
  """
  @spec get_number(String.t()) :: number()

  def get_number(prompt) do
    input = IO.gets("Enter #{prompt }> ") |> String.strip
    cond do
      Regex.match?(~r/\d/, input)    -> String.to_integer(input)
      Regex.match?(~r/\d.\d/, input) -> String.float(input)
      true                           -> :error
    end
  end

  @doc """
  Given two dimensions, prompts for each dimension.
  Returns a tuple of the dimensions.
  """
  @spec get_dimensions(atom()) :: {number(), number()}

  def get_dimensions(:rectangle), do: {get_number("width"), get_number("height")}
  def get_dimensions(:triangle),  do: {get_number("base"), get_number("height")}
  def get_dimensions(:ellipse),   do: {get_number("major radius"), get_number("minor radius")}
  def get_dimensions(:unknown), do: {0, 0}

  @doc """
  Given a shape and two dimensions, calculates the area of the
  given shape.
  """
  @spec calculate(:atom, Integer, Integer) :: Integer

  def calculate(:unknown, _, _), do: IO.puts("No Dice Sucker!")
  def calculate(_, :error, _),   do: IO.puts("No Dice Sucker!")
  def calculate(_, _, :error),   do: IO.puts("No Dice Sucker!")
  def calculate(shape, d1, d2),  do: Geom.area(shape, d1, d2)

end
