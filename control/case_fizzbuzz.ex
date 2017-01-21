defmodule FizzBuzz do
  def upto(n), do: 1..n |> Enum.map(&_fizzbuzz/1)

  defp _fizzbuzz(n) do
    case {rem(n, 3), rem(n, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> n
    end
  end
end
