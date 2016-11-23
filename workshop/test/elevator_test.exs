defmodule ElevatorTest do
  use ExUnit.Case

  test "elevator" do
    assert {:ok, pid} = Elevator.start(10, 1)

    # as long nobody calls, the elevator stays on the same floor, doors closed
    assert {:closed, 1} = Elevator.tick(pid)
    assert {:closed, 1} = Elevator.tick(pid)
    assert {:closed, 1} = Elevator.tick(pid)

    # somebody on the 4th floor calls
    :ok = Elevator.call(pid, 4)
    # The elevator starts moving
    assert {:closed, 2} == Elevator.tick(pid)
    assert {:closed, 3} = Elevator.tick(pid)
    assert {:closed, 4} = Elevator.tick(pid)
    # Doors open
    assert {:open, 4} = Elevator.tick(pid)
    # And close again
    assert {:closed, 4} = Elevator.tick(pid)

    # now it stands still again
    assert {:closed, 4} = Elevator.tick(pid)
    assert {:closed, 4} = Elevator.tick(pid)

    # tell the elevator to go to the 5th
    :ok = Elevator.go_to(pid, 5)
    assert {:closed, 5} = Elevator.tick(pid)
    assert {:open, 5} = Elevator.tick(pid) # we're there
    assert {:closed, 5} = Elevator.tick(pid) # doors close automatically again

    # tell it to go to the 2nd, then to the 1st
    :ok = Elevator.go_to(pid, 2)
    :ok = Elevator.go_to(pid, 1)
    assert {:closed, 4} = Elevator.tick(pid)
    assert {:closed, 3} = Elevator.tick(pid)
    assert {:closed, 2} = Elevator.tick(pid)
    # it stops at the 2nd
    assert {:open, 2} = Elevator.tick(pid)
    assert {:closed, 2} = Elevator.tick(pid)
    assert {:closed, 1} = Elevator.tick(pid)
    # then at the 1st
    assert {:open, 1} = Elevator.tick(pid)

    # the go_to order should not matter, the closest floor is served first:

    :ok = Elevator.go_to(pid, 9)
    :ok = Elevator.go_to(pid, 3)
    :ok = Elevator.go_to(pid, 5)

    assert {:closed, 1} = Elevator.tick(pid)
    assert {:closed, 2} = Elevator.tick(pid)
    assert {:closed, 3} = Elevator.tick(pid)
    assert {:open, 3} = Elevator.tick(pid)
    assert {:closed, 3} = Elevator.tick(pid)
    assert {:closed, 4} = Elevator.tick(pid)
    assert {:closed, 5} = Elevator.tick(pid)
    assert {:open, 5} = Elevator.tick(pid)
    assert {:closed, 5} = Elevator.tick(pid)
    assert {:closed, 6} = Elevator.tick(pid)
    assert {:closed, 7} = Elevator.tick(pid)
    assert {:closed, 8} = Elevator.tick(pid)
    assert {:closed, 9} = Elevator.tick(pid)
    assert {:open, 9} = Elevator.tick(pid)

  end
end
