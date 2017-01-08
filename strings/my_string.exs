defmodule MyString do
  # how I originially did it
  def only_ascii_orig(list) do
    sorted = Enum.sort(list)
    [first, last] = [List.first(sorted), List.last(sorted)]
    first >= ?\s && last <= ?~
  end

  # how I did it after refactoring to be more elixir-like
  def only_ascii(list), do: Enum.sort(list) |> _is_only_ascii

  defp _is_only_ascii([head | _]) when head < ?\s, do: false
  defp _is_only_ascii(list), do: List.last(list) <= ?~

  # after viewing the forum posts
  def only_ascii_2(list), do: Enum.all?(list, &(&1 in ?\s..?~))
end
