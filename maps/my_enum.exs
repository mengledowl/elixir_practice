defmodule MyEnum do
  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) && all?(tail, func)
end
