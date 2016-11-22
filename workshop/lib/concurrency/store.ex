defmodule Store do
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
    end
  end
end
