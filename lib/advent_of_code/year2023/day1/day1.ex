defmodule AdventOfCode.Year2023.Day1 do
  defp split_lines(str), do: String.split(str, "\n", trim: true)

  defp parse_integers(<<>>, acc), do: acc

  defp parse_integers(<<x, rest::binary>>, acc) when x in ?1..?9,
    do: parse_integers(rest, acc <> <<x>>)

  defp parse_integers(<<_, rest::binary>>, acc), do: parse_integers(rest, acc)

  defp parse_spelled_integers(<<>>, acc), do: acc

  defp parse_spelled_integers(<<x, rest::binary>>, acc) when x in ?1..?9,
    do: parse_spelled_integers(rest, acc <> <<x>>)

  defp parse_spelled_integers(<<"one", rest::binary>>, acc),
    do: parse_spelled_integers("e" <> rest, acc <> "1")

  defp parse_spelled_integers(<<"two", rest::binary>>, acc),
    do: parse_spelled_integers("o" <> rest, acc <> "2")

  defp parse_spelled_integers(<<"three", rest::binary>>, acc),
    do: parse_spelled_integers("e" <> rest, acc <> "3")

  defp parse_spelled_integers(<<"four", rest::binary>>, acc),
    do: parse_spelled_integers("r" <> rest, acc <> "4")

  defp parse_spelled_integers(<<"five", rest::binary>>, acc),
    do: parse_spelled_integers("e" <> rest, acc <> "5")

  defp parse_spelled_integers(<<"six", rest::binary>>, acc),
    do: parse_spelled_integers("x" <> rest, acc <> "6")

  defp parse_spelled_integers(<<"seven", rest::binary>>, acc),
    do: parse_spelled_integers("n" <> rest, acc <> "7")

  defp parse_spelled_integers(<<"eight", rest::binary>>, acc),
    do: parse_spelled_integers("t" <> rest, acc <> "8")

  defp parse_spelled_integers(<<"nine", rest::binary>>, acc),
    do: parse_spelled_integers("e" <> rest, acc <> "9")

  defp parse_spelled_integers(<<_, rest::binary>>, acc), do: parse_spelled_integers(rest, acc)

  defp combine_digits(digits_str) do
    String.to_integer(String.first(digits_str) <> String.last(digits_str))
  end

  def solve_part1(file_stream) do
    file_stream
    |> Stream.map(&split_lines/1)
    |> Stream.map(fn [line] -> parse_integers(line, "") end)
    |> Stream.map(&combine_digits/1)
    |> Enum.sum()
  end

  def solve_part2(file_stream) do
    file_stream
    |> Stream.map(&split_lines/1)
    |> Stream.map(fn [line] -> parse_spelled_integers(line, "") end)
    |> Stream.map(&combine_digits/1)
    |> Enum.sum()
  end
end
