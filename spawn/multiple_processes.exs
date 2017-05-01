defmodule MultipleProcesses do
  def start(tokens) do
    Enum.map(tokens, &send_token/1)
    Enum.map(tokens, &receive_token/1)
  end

  def send_token(token) do
    spawn(MultipleProcesses, :respond, [])
    |> send({self, token})
  end

  def receive_token(token) do
    receive do
      ^token ->
        IO.puts token
    end
  end

  def respond do
    receive do
      {pid, token} ->
        send(pid, token)
    end
  end
end