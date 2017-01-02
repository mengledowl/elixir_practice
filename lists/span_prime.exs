defmodule MyList do
	def span(from, to) when from > to, do: []
	def span(from, to), do: [from | span(from + 1, to)]

	def primes(n) do
		for x <- span(2, n), is_prime(x), do: x
	end

	def is_prime(n) do
		Enum.count(for x <- span(2, n-1), rem(n, x) == 0, do: x) == 0
	end
end
