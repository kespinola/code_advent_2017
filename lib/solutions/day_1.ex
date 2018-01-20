defmodule CodeAdvent.Solutions.Day1 do
  def solve(:part_1, pattern) do
    list = String.graphemes(pattern)
    first = List.first(list)

    calculate_next(list ++ [first], 0)
  end

  def solve(:part_2, pattern) do
    list = String.graphemes(pattern)
    halfway = round(length(list) / 2)
    [first, second] = Enum.chunk(list, halfway)

    calculate_halfway(first, second, 0)
  end

  def calculate_next([head | tail], score) do
    next = List.first(tail)

    if head == next do
      calculate_next(tail, (score + String.to_integer(head)))
    else
      calculate_next(tail, score)
    end
  end

  def calculate_next([], score), do: score

  defp calculate_halfway([current | first], [halfway | second], score) do
    if current == halfway do
      calculate_halfway(first, second, (score + String.to_integer(current)))
    else
      calculate_halfway(first, second, score)
    end
  end

  defp calculate_halfway([], [], score), do: (score * 2)
end
