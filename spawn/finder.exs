defmodule Finder do
  import Scheduler

  def count_all_occurrences(query, path \\ "/") do
    files = File.ls!(path)
    |> Enum.map(&({query, "#{path}/#{&1}"}))
    count = Enum.count(files)

    Scheduler.run(count, Finder, :find_occurrence, files)
    |> Enum.map(&(elem(&1, 1)))
    |> Enum.reduce(&(&1 + &2))
    |> IO.puts()
  end

  def find_occurrence(scheduler) do
    send(scheduler, { :ready, self })

    receive do
      {:continue, next, client} ->
        send client, {:answer, next, occurrence(next), self}
        find_occurrence(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp occurrence({query, next}), do: File.read(next) |> count_in_file(query)

  defp count_in_file({:ok, bin}, query), do: Regex.scan(~r/#{query}/, bin) |> length
  defp count_in_file({:error, reason}, _), do: 0
end