defmodule Calculator do
  def calculate(value) do
    [first, operator, second] = Enum.reject(value, &(&1 == ?\s)) # remove any spaces
      |> Enum.chunk_by(&(&1 in '+-*/')) # split the expression up
    a = :string.to_integer(first) |> elem(0)
    b = :string.to_integer(second) |> elem(0)
    _calc(operator, a, b)
  end

  defp _calc([?+], a, b), do: a + b
  defp _calc([?-], a, b), do: a - b
  defp _calc([?*], a, b), do: a * b
  defp _calc([?/], a, b), do: a / b
end
