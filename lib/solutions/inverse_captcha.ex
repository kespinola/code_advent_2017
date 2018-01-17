defmodule CodeAdvent.Solutions.InverseCaptcha do
  def solve(sequence) do
    list = sequence |> String.split("") |> Enum.reject(fn s -> s == "" end) |> Enum.map(&String.to_integer/1)
    first = Enum.at(list, 0)
    last = List.last(list)

    res = list |> Stream.with_index |> Enum.reduce(0, fn
      {number, 0}, acc -> acc
      {number, index}, acc ->
        prev = Enum.at(list, index - 1)

        if prev == number do
          next =  acc + number

          next
        else
          acc
        end
    end)

    if first == last do
      res + first
    else
      res
    end
  end
end
