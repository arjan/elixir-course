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

  ##

  def init([]) do
    {:ok, %{}}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, state[key], state}
  end

  def handle_call({:put, key, value}, _from, state) do
    {:reply, :ok, Map.put(state, key, value)}
  end

end
