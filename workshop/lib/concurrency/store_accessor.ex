defmodule Store do

  def start do
    spawn(Store, :init, [])
  end

  def put(pid, key, value) do
    send(pid, {:put, key, value})
    :ok
  end

  def get(pid, key) do
    send(pid, {:get, key, self()})
    receive do
      value -> value
    end
  end








  def init do
    loop(%{})
  end

  def loop(values) do
    receive do
      {:put, key, value} ->
        loop(Map.put(values, key, value))
      {:get, key, sender} ->
        send(sender, values[key])
        loop(values)
      :wipe ->
        loop(%{})
      {:delete, key} ->
        loop(Map.delete(values, key))
    end
  end

end
