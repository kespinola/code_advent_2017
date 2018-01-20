defmodule CodeAdvent.Solutions.Day2 do
  def solve(pattern) do
    pattern
    |> String.split("\n")
    |> Enum.reduce(0, &resolve_difference/2)
  end

  defp resolve_difference("", acc), do: acc
  defp resolve_difference(~r(/n), acc), do: acc

  defp resolve_difference(row, acc) do
    list = row |> String.split(" ") |> Enum.map(&String.to_integer/1) |> Enum.sort(&(&1 >= &2))
    smallest = List.last(list)
    largest = List.first(list)

    acc + (largest - smallest)
  end
end
