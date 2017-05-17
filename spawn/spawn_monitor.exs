defmodule SpawnMonitor do
  import :timer, only: [sleep: 1]

  def sad_function(sender) do
    send(sender, "msg")
    exit(:boom)
  end

  def receive_msg do
    receive do
      msg ->
        IO.puts "Message received: #{inspect(msg)}"
        receive_msg
      after 500 ->
        IO.puts "No more messages!"
    end
  end

  def run do
    Process.flag(:trap_exit, true)
    res = spawn_monitor(SpawnMonitor, :sad_function, [self])

    IO.inspect res

    sleep 500

    receive_msg
  end
end

SpawnMonitor.run