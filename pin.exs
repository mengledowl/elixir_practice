defmodule Greeter do
	def for(name, greeting) do
		fn
			(^name)	-> "#{greeting} #{name}"
			(_)			-> "I don't know you"
		end
	end
end

mr_valim = Greeter.for("Josè", "Oi!")

IO.puts mr_valim.("Josè")
IO.puts mr_valim.("Dave")