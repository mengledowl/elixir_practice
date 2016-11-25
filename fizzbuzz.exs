fizzbuzz_word = fn
	0, 0, _ -> "FizzBuzz"
	0, _, _ -> "Fizz"
	_, 0, _ -> "Buzz"
	_, _, c -> c
end

fizzbuzz = fn n -> fizzbuzz_word.(rem(n, 3), rem(n, 5), n) end

# test fizzbuzz_word
IO.puts "FizzBuzz: #{fizzbuzz_word.(0, 0, 1)}"
IO.puts "Fizz: #{fizzbuzz_word.(0, 1, 1)}"
IO.puts "Buzz: #{fizzbuzz_word.(1, 0, 1)}"
IO.puts "c (16): #{fizzbuzz_word.(1, 1, 16)}"

IO.puts "\n------------------------------\n"

# test fizzbuzz
IO.puts fizzbuzz.(10)
IO.puts fizzbuzz.(11)
IO.puts fizzbuzz.(12)
IO.puts fizzbuzz.(13)
IO.puts fizzbuzz.(14)
IO.puts fizzbuzz.(15)
IO.puts fizzbuzz.(16)