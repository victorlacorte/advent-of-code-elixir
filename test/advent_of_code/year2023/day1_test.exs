defmodule AdventOfCodeTest.Year2023.Day1Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "greets the world" do
    # TODO change to stream
    File.read!(Path.expand("./lib/advent_of_code/year2023/day1/input.txt"))
    |> IO.puts()

    assert AdventOfCode.Year2023.Day1.hello() == :world
  end
end
