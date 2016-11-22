defmodule ConcurrencyTest do
  use ExUnit.Case

  test "store put / get" do
    pid = spawn(Store, :start, [])

    send pid, {:put, "name", "Arjan"}
    send pid, {:get, "name", self()}
    assert_receive "Arjan"

    send pid, {:get, "age", self()}
    assert_receive nil

    send pid, {:put, "age", 36}
    send pid, {:get, "age", self()}
    assert_receive 36

  end

  test "store delete + wipe" do
    pid = spawn(StoreWithWipe, :start, [])

    send pid, {:put, "name", "Arjan"}
    send pid, {:put, "age", 36}

    send pid, {:get, "name", self()}
    assert_receive "Arjan"

    send pid, {:delete, "name"}
    send pid, {:get, "name", self()}
    assert_receive nil

    send pid, :wipe
    send pid, {:get, "age", self()}
    assert_receive nil

  end


  test "store with accessor functions" do
    pid = StoreAccessor.start()
    assert nil == StoreAccessor.get(pid, "name")
    assert :ok == StoreAccessor.put(pid, "name", "Arjan")
    assert "Arjan" == StoreAccessor.get(pid, "name")
  end

end
