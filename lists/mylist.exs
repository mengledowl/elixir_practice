defmodule MyList do
	def len([]), do: 0
	def len([_head | tail]), do: 1 + len(tail)

	def square([]), do: []
	def square([head | tail]), do: [head*head | square(tail)]

	def add_1([]), do: []
	def add_1([head | tail]), do: [head+1 | add_1(tail)]

	def map([], _func), do: []
	def map([head | tail], func), do: [func.(head) | map(tail, func)]

	def sum(list), do: _sum(list, 0)

	def reduce([], value, _), do: value
	def reduce([head | tail], value, func), do: reduce(tail, func.(head, value), func)

	def mapsum([], _), do: 0
	def mapsum([head | tail], func), do: func.(head) + mapsum(tail, func)

	def max([high]), do: high
	def max([head | tail]), do: Kernel.max(head, max(tail))

	def caesar([], _), do: []
	def caesar([head | tail], n) when head + n <= ?z, do: [head + n | caesar(tail, n)]
	def caesar([head | tail], n), do: [head + n-26 | caesar(tail, n)]

	def flatten([]), do: []
	def flatten([head | tail]), do: flatten(head) ++ flatten(tail)
	def flatten(head), do: [head]

	# José Valim's version (for reference and b/c it's a cool implementation w/ tail recursion)
	defmodule JVList do
		def flatten(list), do: do_flatten(list, [])

		def do_flatten([h | t], list) when is_list(h), do: do_flatten(h, do_flatten(t, list))
		def do_flatten([h | t], list), do: [h | do_flatten(t, list)]
		def do_flatten([], list), do: list
	end

	# private

	defp _sum([], total), do: total
	defp _sum([head | tail], total), do: _sum(tail, head + total)
end
