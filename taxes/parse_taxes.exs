require Taxes

defmodule ParseTaxes do
  def calculate_taxes do
    tax_rates = [NC: 0.075, TX: 0.08]
    {:ok, data} = File.read(Path.relative_to_cwd("taxes/taxes.txt"))
    orders = String.split(data, "\n")
          |> Enum.map(&(String.split(&1, ",")))
          |> get_tail
          |> Enum.reject(&(Enum.count(&1) != 3))
          |> Enum.map(&(to_keyword(&1)))
    Taxes.add_tax(tax_rates, orders)
  end

  def get_tail([_ | t]), do: t

  def to_keyword(arr) do
    [
      id: Enum.at(arr, 0) |> String.to_integer,
      ship_to: Enum.at(arr, 1) |> String.replace(":", "") |> String.to_atom,
      net_amount: Enum.at(arr, 2) |> String.to_float
    ]
  end
end
