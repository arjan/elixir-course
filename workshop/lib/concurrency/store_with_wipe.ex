defmodule StoreWithWipe do
  def start do
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
