defmodule AdventOfCode.Utils do
  def split_lines(str), do: String.split(str, "\n", trim: true)

  def stream_str(str) do
    {:ok, stream} =
      str
      |> StringIO.open()

    stream
    |> IO.binstream(:line)
  end
end
