
# Heads and tails

# Earlier, we said a list may either be empty or consist of a head and a tail.
# The head contains a value and the tail is itself a list.
# This is a recursive definition.
# We’ll represent the empty list like this: [ ].
# Let’s imagine we could represent the split between the head and the tail using a pipe character: |.
# The single-element list we normally write as [ 3 ] can be written as the value 3 joined to the empty list: [3|[]].

# Let’s look at the list [2, 3].
# The head is 2, and the tail is the single-element list containing 3.
# So, we could write [2,3] as [2 | [3|[]]].


defmodule ListsAndRecursion do
  def len([]), do: 0
  def len([ _ | tail ]) do
    1 + len(tail)
  end

  def square([]), do: []
  def square([head | tail]) do
    [head * head | square(tail)]
  end

  def map([], _func), do: []
  def map([head | tail], func) do
    [func.(head) | map(tail, func)]
  end

  def reduce([], value, _), do: value
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  # to reduce a list of numbers and the sum
  #
  # reduce([1, 2, 3, 4, 5], 0, fn collection, value -> collection + value end)
  # or
  # shorthand notation to reduce a list a numbers to a sum
  # reduce([1, 2, 3, 4, 5], 0, &(&1 + &2))

  def swap([]), do: []
  def swap([a, b | tail]) do
    [b, a | swap(tail)]
  end
  def swap([_]) do
    raise "Can't swap a list with an odd number of elements"
  end
end

defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([[time, 27, temp, rain] | tail]) do
    [ [time, 27, temp, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail ]) do
    for_location_27(tail)
  end

  def for_location([], _target_loc), do: []
  def for_location([ head = [_, target_loc, _, _] | tail ], target_loc) do
    [head | for_location(tail, target_loc) ]
  end
  def for_location([ _ | tail], target_loc) do
    for_location(tail, target_loc)
  end

  # The key change here is this line: def for_location([ head = [_, target_loc, _, _ ] | tail], target_loc).
  # Compare that with the previous version:
  # def for_location([ [ time, target_loc, temp, rain ] | tail], target_loc).
  # In the new version, we use placeholders for the fields we don’t care about. But we also match the entire four-element array into the parameter head.


  def test_data do [
    [1366225622, 26, 15, 0.125],
    [1366225622, 27, 15, 0.45],
    [1366225622, 28, 21, 0.25],
    [1366229222, 26, 19, 0.081],
    [1366229222, 27, 17, 0.468],
    [1366229222, 28, 15, 0.60],
    [1366232822, 26, 22, 0.095],
    [1366232822, 27, 21, 0.05],
    [1366232822, 28, 24, 0.03],
    [1366236422, 26, 17, 0.025]
  ]
  end
end
