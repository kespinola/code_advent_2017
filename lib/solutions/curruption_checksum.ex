defmodule CodeAdvent.Solutions.CurruptionChecksum do
  def solve(pattern) do
    pattern
    |> strip_split_string("\n")
    |> Enum.reduce(0, fn row, acc ->
      list = row |> strip_split_string(" ") |> Enum.map(&String.to_integer/1) |> Enum.sort(&(&1 >= &2))
      smallest = List.last(list)
      largest = List.first(list)

      acc + (largest - smallest)
    end)
  end

  defp strip_split_string(string, on), do:
    string |> String.split(on) |> Enum.reject(fn s -> s == "" end)
end
