
defmodule DefaultParameters do
  def func(p1, p2 \\ 2, p3 \\ 3, p4) do
    IO.inspect [p1, p2, p3, p4]
  end

  # def func(p1, p2, p3, p4, p5 \\ 42, p6 \\ 69) do
  #   IO.inspect [p1, p2, p3, p4, p5, p6]
  # end

  # (1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40))

  def expo(base, exp \\ 2) when is_integer(base), do: base * exp

  def less_than_forty(n) when is_integer(n) and n < 40, do: true

  # def pipe(range_start, range_end, map_fun, filter_fun) do
  #   range_start..range_end |> Enum.map(map_fun) |> Enum.filter(filter_fun)
  # end
end
