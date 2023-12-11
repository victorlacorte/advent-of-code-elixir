defmodule AdventOfCodeTest.Year2023.Day1Test do
  use ExUnit.Case
  doctest AdventOfCode

  test "solve part 1 example" do
    {:ok, stream} =
      """
      1abc2
      pqr3stu8vwx
      a1b2c3d4e5f
      treb7uchet
      """
      |> StringIO.open()

    assert(
      stream
      |> IO.binstream(:line)
      |> AdventOfCode.Year2023.Day1.solve_part1() == 142
    )
  end

  test "solve part 1" do
    assert(
      File.stream!(Path.expand("./lib/advent_of_code/year2023/day1/input.txt"))
      |> AdventOfCode.Year2023.Day1.solve_part1() ==
        54304
    )
  end

  test "solve part 2 example" do
    {:ok, stream} =
      """
      two1nine
      eightwothree
      abcone2threexyz
      xtwone3four
      4nineeightseven2
      zoneight234
      7pqrstsixteen
      """
      |> StringIO.open()

    assert(
      stream
      |> IO.binstream(:line)
      |> AdventOfCode.Year2023.Day1.solve_part2() == 281
    )
  end

  test "solve part 2" do
    assert(
      File.stream!(Path.expand("./lib/advent_of_code/year2023/day1/input.txt"))
      |> AdventOfCode.Year2023.Day1.solve_part2() ==
        54418
    )
  end
end
