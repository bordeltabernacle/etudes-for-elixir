defmodule Cards do

  @doc """
  Function to create a list of tuples that represents a deck of cards
  """
  @spec make_deck() :: list(tuple())
  def make_deck() do
    for suit <- ~w(spades hearts clubs diamonds),
        card <- [2, 3, 4, 5, 6, 7, 8, 9, 10, "A", "K", "Q", "J"] do
      {card, suit}
        end
  end

  @doc """
  Function to randomly shuffle the deck of cards
  """
  def shuffle(list) do
    :random.seed(:erlang.now())
    _shuffle(list, [])
  end

  defp _shuffle([], acc), do: acc
  defp _shuffle(list, acc) do
    {leading, [h | t]} =
      Enum.split(list, :random.uniform(Enum.count(list)) - 1)
    _shuffle(leading ++ t, [h | acc])
  end
end
