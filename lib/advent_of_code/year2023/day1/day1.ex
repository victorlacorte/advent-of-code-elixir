defmodule AdventOfCode.Year2023.Day1 do
  defp tokenize(str), do: String.split(str, "", trim: true)

  defp parse_integer(["1" | tail], acc), do: parse_integer(tail, acc ++ ["1"])
  defp parse_integer(["2" | tail], acc), do: parse_integer(tail, acc ++ ["2"])
  defp parse_integer(["3" | tail], acc), do: parse_integer(tail, acc ++ ["3"])
  defp parse_integer(["4" | tail], acc), do: parse_integer(tail, acc ++ ["4"])
  defp parse_integer(["5" | tail], acc), do: parse_integer(tail, acc ++ ["5"])
  defp parse_integer(["6" | tail], acc), do: parse_integer(tail, acc ++ ["6"])
  defp parse_integer(["7" | tail], acc), do: parse_integer(tail, acc ++ ["7"])
  defp parse_integer(["8" | tail], acc), do: parse_integer(tail, acc ++ ["8"])
  defp parse_integer(["9" | tail], acc), do: parse_integer(tail, acc ++ ["9"])
  defp parse_integer([_head | tail], acc), do: parse_integer(tail, acc)
  defp parse_integer([], acc), do: acc

  defp parse_spelled_integer(["1" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["1"])
  defp parse_spelled_integer(["2" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["2"])
  defp parse_spelled_integer(["3" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["3"])
  defp parse_spelled_integer(["4" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["4"])
  defp parse_spelled_integer(["5" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["5"])
  defp parse_spelled_integer(["6" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["6"])
  defp parse_spelled_integer(["7" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["7"])
  defp parse_spelled_integer(["8" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["8"])
  defp parse_spelled_integer(["9" | tail], acc), do: parse_spelled_integer(tail, acc ++ ["9"])

  # NOTE why can't I make [acc | "1"]?
  defp parse_spelled_integer(["o", "n", "e" | tail], acc),
    do: parse_spelled_integer(["e" | tail], acc ++ ["1"])

  defp parse_spelled_integer(["t", "w", "o" | tail], acc),
    do: parse_spelled_integer(["o" | tail], acc ++ ["2"])

  defp parse_spelled_integer(["t", "h", "r", "e", "e" | tail], acc),
    do: parse_spelled_integer(["e" | tail], acc ++ ["3"])

  defp parse_spelled_integer(["f", "o", "u", "r" | tail], acc),
    do: parse_spelled_integer(["r" | tail], acc ++ ["4"])

  defp parse_spelled_integer(["f", "i", "v", "e" | tail], acc),
    do: parse_spelled_integer(["e" | tail], acc ++ ["5"])

  defp parse_spelled_integer(["s", "i", "x" | tail], acc),
    do: parse_spelled_integer(["x" | tail], acc ++ ["6"])

  defp parse_spelled_integer(["s", "e", "v", "e", "n" | tail], acc),
    do: parse_spelled_integer(["n" | tail], acc ++ ["7"])

  defp parse_spelled_integer(["e", "i", "g", "h", "t" | tail], acc),
    do: parse_spelled_integer(["t" | tail], acc ++ ["8"])

  defp parse_spelled_integer(["n", "i", "n", "e" | tail], acc),
    do: parse_spelled_integer(["e" | tail], acc ++ ["9"])

  defp parse_spelled_integer([_head | tail], acc), do: parse_spelled_integer(tail, acc)
  defp parse_spelled_integer([], acc), do: acc

  # defp last_elem(list) do
  #  Enum.at(list, Enum.count(list) - 1)
  # end

  # defp take_head_tail([head | []]), do: head <> head

  # defp take_head_tail([head | tail]) do
  #  head <> last_elem(tail)
  # end

  defp parse_integer(x) do
    {int, ""} = Integer.parse(x)
    int
  end

  defp combine_first_last_digit([head | []], "") do
    parse_integer(head <> head)
  end

  defp combine_first_last_digit([head | []], acc) do
    parse_integer(acc <> head)
  end

  defp combine_first_last_digit([head | tail], ""), do: combine_first_last_digit(tail, head)
  defp combine_first_last_digit([_head | tail], acc), do: combine_first_last_digit(tail, acc)

  def solve_part1(file_stream) do
    file_stream
    |> Stream.map(&tokenize/1)
    |> Stream.map(fn tokenized_line -> parse_integer(tokenized_line, []) end)
    |> Stream.map(fn tokenized_integers -> combine_first_last_digit(tokenized_integers, "") end)
    |> Enum.sum()
  end

  def solve_part2(file_stream) do
    file_stream
    |> Stream.map(&tokenize/1)
    |> Stream.map(fn tokenized_line -> parse_spelled_integer(tokenized_line, []) end)
    |> Stream.map(fn tokenized_integers -> combine_first_last_digit(tokenized_integers, "") end)
    # |> Enum.into(File.stream!("output_ex.txt", [:write, :utf8]))
    |> Enum.sum()
  end
end
