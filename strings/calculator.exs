defmodule Calculator do
  def calculate(value) do
    [first, operator, second] = Enum.chunk_by(value, &(&1 == ?+ || &1 == ?- || &1 == ?* || &1 == ?/))
    a = :string.to_integer(first) |> elem(0)
    b = :string.to_integer(second) |> elem(0)
    _calc(operator, a, b)
  end

  defp _calc([?+], a, b), do: a + b
  defp _calc([?-], a, b), do: a - b
  defp _calc([?*], a, b), do: a * b
  defp _calc([?/], a, b), do: a / b
end
