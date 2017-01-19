defmodule Parse do
  def number([ ?- | tail ]), do: _number_digits(tail, 0) * -1
  def number([ ?+ | tail ]), do: _number_digits(tail, 0)
  def number(str), do: _number_digits(str, 0)

  defp _number_digits([], value), do: value
  defp _number_digits([digit | tail], value) when digit in '0123456789' do
    _number_digits(tail, value*10 + digit - ?0)
  end
  defp _number_digits([non_digit | _], _) do
    raise "Invalid digit '#{[non_digit]}'"
  end

  def center(list) do
    max = Enum.map(list, &(String.length(&1))) |> Enum.max
    _print(list, max)
  end

  defp _print([], _), do: []
  defp _print([head | tail], length) do
    lead = get_lead_pad(length, String.length(head))
    String.pad_leading(head, lead + String.length(head), " ") |> IO.puts
    _print(tail, length)
  end

  defp get_lead_pad(length, length), do: 0
  defp get_lead_pad(length, h_length), do: div(length, h_length)
end
