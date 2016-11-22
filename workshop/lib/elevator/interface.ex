defmodule Elevator.Interface do

  @doc """
  Start an elevator process, in a building with `num_floors` floors.
  """
  @spec start(num_floors :: integer, start_floor :: integer) :: pid()
  def start(num_floors, start_floor \\ 1) do
  end

  @doc """
  Standing on the given floor, call the elevator and indicate that you
  want to go :up or :down.
  """
  def call(pid, floor, direction) do
  end

  @doc """
  Standing in the elevator, tell the elevator you want to go to the
  given floor. (e.g. pushing the floor number button).
  """
  def go_to(pid, floor) do
  end

  @doc """
  Advance the elevator state
  """
  def tick(pid) do
  end

end
