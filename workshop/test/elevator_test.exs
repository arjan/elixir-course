defmodule ElevatorTest do
  use ExUnit.Case

  test "elevator" do
    pid = Elevator.start(10, 1)

    # as long nobody calls, the elevator stays on the same floor, doors closed
    {:closed, 1} = Elevator.tick(pid)
    {:closed, 1} = Elevator.tick(pid)
    {:closed, 1} = Elevator.tick(pid)

    # somebody on the 4th floor calls
    :ok = Elevator.call(pid, 4)
    # The elevator starts moving
    {:closed, 2} = Elevator.tick(pid)
    {:closed, 3} = Elevator.tick(pid)
    {:closed, 4} = Elevator.tick(pid)
    # Doors open
    {:open, 4} = Elevator.tick(pid)
    # And close again
    {:closed, 4} = Elevator.tick(pid)

    # now it stands still again
    {:closed, 4} = Elevator.tick(pid)
    {:closed, 4} = Elevator.tick(pid)

    # tell the elevator to go to the 5th
    :ok = Elevator.go_to(pid, 5)
    {:closed, 5} = Elevator.tick(pid)
    {:open, 5} = Elevator.tick(pid) # we're there
    {:closed, 5} = Elevator.tick(pid) # doors close automatically again

    # tell it to go to the 2nd, then to the 1st
    :ok = Elevator.go_to(pid, 2)
    :ok = Elevator.go_to(pid, 1)
    {:closed, 4} = Elevator.tick(pid)
    {:closed, 3} = Elevator.tick(pid)
    {:closed, 2} = Elevator.tick(pid)
    # it stops at the 2nd
    {:open, 2} = Elevator.tick(pid)
    {:closed, 2} = Elevator.tick(pid)
    {:closed, 1} = Elevator.tick(pid)
    # then at the 1st
    {:open, 1} = Elevator.tick(pid)

    # the go_to order should not matter, the closest floor is served first:

    :ok = Elevator.go_to(pid, 9)
    :ok = Elevator.go_to(pid, 3)
    :ok = Elevator.go_to(pid, 5)

    {:closed, 1} = Elevator.tick(pid)
    {:closed, 2} = Elevator.tick(pid)
    {:closed, 3} = Elevator.tick(pid)
    {:open, 3} = Elevator.tick(pid)
    {:closed, 3} = Elevator.tick(pid)
    {:closed, 4} = Elevator.tick(pid)
    {:closed, 5} = Elevator.tick(pid)
    {:open, 5} = Elevator.tick(pid)
    {:closed, 5} = Elevator.tick(pid)
    {:closed, 6} = Elevator.tick(pid)
    {:closed, 7} = Elevator.tick(pid)
    {:closed, 8} = Elevator.tick(pid)
    {:closed, 9} = Elevator.tick(pid)
    {:open, 9} = Elevator.tick(pid)

  end
end
