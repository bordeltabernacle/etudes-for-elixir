defmodule NonFP do

  def generate_pockets(tooth_list, prob_good) do
    :random.seed(:erlang.now())
    generate_pockets(tooth_list, prob_good, [])
  end

  defp generate_pockets([], _, result) do
    result |> Enum.reverse
  end

  defp generate_pockets([head|tail], prob_good, result) when head == ?T do
    tooth = prob_good |> generate_tooth
    generate_pockets(tail, prob_good, [tooth | result])
  end

  defp generate_pockets([_head|tail], prob_good, result) do
    generate_pockets(tail, prob_good, [[0] | result])
  end

  defp generate_tooth(prob_good) do
    num = :random.uniform()
    base_depth = if (num < prob_good), do: 2, else: 3
    generate_tooth(base_depth, 6, [])
  end

  defp generate_tooth(_base, 0, result) do
    result
  end

  defp generate_tooth(base, n, result) do
    delta = :random.uniform(3) - 2
    generate_tooth(base, n - 1, [base + delta | result])
  end

  def test_pockets() do
    tlist = 'FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT'
    big_list = generate_pockets(tlist, 0.75)
    print_pockets(big_list)
  end

  def print_pockets([]), do: IO.puts("Finished.")

  def print_pockets([head | tail]) do
    IO.puts(inspect(head))
    print_pockets(tail)
  end

end
