defmodule Bang do
  def ok!({:ok, data}), do: data
  def ok!({_, err}), do: raise "Error: #{err}"
end
