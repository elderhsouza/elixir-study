defmodule FirstTest do
  use ExUnit.Case
  doctest First

  test "greets the world" do
    assert First.hello() == :world
  end
end
