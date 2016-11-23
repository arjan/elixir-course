defmodule StoreGenServer do

  use GenServer

  def start() do
    GenServer.start_link(__MODULE__, [])
  end

  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end

  def put(pid, key, value) do
    GenServer.call(pid, {:put, key, value})
  end

  def wipe(pid) do
    GenServer.call(pid, :wipe)
  end

  ##

  def init([]) do
    IO.puts("cache starting #{inspect self}")
    {:ok, %{}}
  end

  def handle_call({:get, key}, _from, values) do
    {:reply, values[key], values}
  end

  def handle_call({:put, key, value}, _from, values) do
    {:reply, :ok, Map.put(values, key, value)}
  end

  def handle_call(:wipe, _from, values) do
    IO.puts("OK, lets wipe it. Byebye, #{inspect values}")
    {:reply, :ok, %{}}
  end

end
