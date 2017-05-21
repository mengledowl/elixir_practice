defmodule Finder do
  import Scheduler

  def count_all_occurrences do
    files = File.ls!("//Users/mattengledowl")
    |> Enum.map(&("//Users/mattengledowl/#{&1}"))
    count = Enum.count(files)

    Scheduler.run(count, Finder, :find_occurrence, files)
    |> Enum.map(&(elem(&1, 1)))
    |> Enum.reduce(&(&1 + &2))
    |> IO.puts()
  end

  def find_occurrence(scheduler) do
    send(scheduler, { :ready, self })

    receive do
      {:fib, next, client} ->
        send client, {:answer, next, occurrence(next), self}
        find_occurrence(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp occurrence(next), do: File.read(next) |> count_in_file

  defp count_in_file({:ok, bin}), do: count(bin, 0)
  defp count_in_file({:error, :eisdir}), do: 0

  defp count(<<32, 99, 97, 116, 32, tail :: binary>>, val), do: count(tail, val + 1)
  defp count(<<head, tail :: binary>>, val), do: count(tail, val)
  defp count(_, val), do: val
end