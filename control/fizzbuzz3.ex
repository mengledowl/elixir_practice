defmodule FizzBuzz do
  def upto(n) when n > 0, do: 1..n |> Enum.map(&fizzbuzz/1)

  defp fizzbuzz(n), do: _fizzword(n, rem(n, 3), rem(n, 5))

  defp _fizzword(_, 0, 0), do: "FizzBuzz"
  defp _fizzword(_, 0, _), do: "Fizz"
  defp _fizzword(_, _, 0), do: "Buzz"
  defp _fizzword(n, _, _), do: n
end
