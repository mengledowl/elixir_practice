defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)

  def each([], _), do: []
  def each([head | tail], func), do: [func.(head) | each(tail, func)]

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split([head | tail], num) when num > 0 do
    {left, right} = split(tail, num - 1)
    {[head | left], right}
  end
  def split(list, _), do: {[], list}

  def take(list, num), do: elem split(list, num), 0
end
