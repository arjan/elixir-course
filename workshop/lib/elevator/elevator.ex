defmodule Elevator do
  use GenServer

  @doc """
  Start an elevator process, in a building with `num_floors` floors.
  """
  def start(num_floors, start_floor \\ 1) do
    GenServer.start_link(Elevator, {num_floors, start_floor})
  end

  @doc """
  Standing on the given floor, call the elevator
  """
  def call(pid, floor) do
    GenServer.call(pid, {:call, floor})
  end

  @doc """
  Standing in the elevator, tell the elevator you want to go to the
  given floor. (e.g. pushing the floor number button).
  """
  def go_to(pid, floor) do
    GenServer.call(pid, {:call, floor})
  end

  @doc """
  Advance the elevator state
  """
  def tick(pid) do
    GenServer.call(pid, :tick)
  end


  def init({num_floors, start_floor}) do
    state = %{current: start_floor, target: [], doors: :closed, open_flag: false}
    {:ok, state}
  end

  def handle_call(:tick, _from, state = %{doors: :open}) do
    state = Map.put(state, :doors, :closed)
    {:reply, {state.doors, state.current}, state}
  end

  def handle_call(:tick, _from, state = %{open_flag: true}) do
    state = Map.put(state, :doors, :open)
    state = Map.put(state, :open_flag, false)
    {:reply, {state.doors, state.current}, state}
  end

  def handle_call(:tick, _from, state = %{target: []}) do
    {:reply, {state.doors, state.current}, state}
  end

  def handle_call(:tick, _from, state = %{target: [target_floor | others]}) do
    # we are on the move
    current = if state.current > target_floor do
      state.current - 1
    else
      state.current + 1
    end
    state = if current == target_floor do
      state
      |> Map.put(:current, current)
      |> Map.put(:open_flag, true)
      |> Map.put(:target, others)
    else
      state
      |> Map.put(:current, current)
    end
    {:reply, {state.doors, state.current}, state}
  end

  def handle_call({:call, floor}, _from, state) do
    # Order the target floors by the least travel distnce from current floor
    new_targets = state.target ++ [floor]
    |> Enum.sort(fn(a, b) ->
      delta_a = abs(state.current - a)
      delta_b = abs(state.current - b)
      delta_a < delta_b
    end)
    {:reply, :ok, Map.put(state, :target, new_targets)}
  end
end
