defmodule AdventOfCode.Year2023.Day1 do
  defp parse_integers(<<x, rest::binary>>, acc) when x in ?1..?9,
    do: parse_integers(rest, acc <> <<x>>)

  defp parse_integers("", acc), do: acc
  defp parse_integers(<<_, rest::binary>>, acc), do: parse_integers(rest, acc)

  defp parse_spelled_integers(<<x, rest::binary>>, acc) when x in ?1..?9,
    do: parse_spelled_integers(rest, acc <> <<x>>)

  @spelled_integers ~w/zero one two three four five six seven eight nine/
                    |> Enum.map(&{&1, String.last(&1)})
  for {{spelled_integer, last_char}, index} <- Enum.with_index(@spelled_integers) do
    defp parse_spelled_integers(<<unquote(spelled_integer), rest::binary>>, acc) do
      parse_spelled_integers("#{unquote(last_char)}#{rest}", "#{acc}#{unquote(index)}")
    end
  end

  defp parse_spelled_integers("", acc), do: acc
  defp parse_spelled_integers(<<_, rest::binary>>, acc), do: parse_spelled_integers(rest, acc)

  defp combine_digits(digits_str) do
    String.to_integer("#{String.first(digits_str)}#{String.last(digits_str)}")
  end

  def solve_part1(file_stream) do
    file_stream
    |> Stream.flat_map(&AdventOfCode.Utils.split_lines/1)
    |> Stream.map(fn line -> parse_integers(line, "") end)
    |> Stream.map(&combine_digits/1)
    |> Enum.sum()
  end

  def solve_part2(file_stream) do
    file_stream
    |> Stream.flat_map(&AdventOfCode.Utils.split_lines/1)
    |> Stream.map(fn line -> parse_spelled_integers(line, "") end)
    |> Stream.map(&combine_digits/1)
    |> Enum.sum()
  end
end
