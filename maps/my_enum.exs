defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]
end
