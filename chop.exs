defmodule Chop do
	def guess(actual, range = a..b) do
		new_guess = div(a+b, 2)

		IO.puts "Is it #{new_guess}"

		check_guess(actual, new_guess, range)
	end

	def check_guess(actual, actual, _), do: IO.puts actual
	def check_guess(actual, new_guess, a.._b) when actual < new_guess, do: guess(actual, a..(new_guess-1))
	def check_guess(actual, new_guess, _a..b) when actual > new_guess, do: guess(actual, (new_guess+1)..b)
end