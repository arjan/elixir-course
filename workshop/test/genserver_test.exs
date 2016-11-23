defmodule StoreTest do
  use ExUnit.Case

  test "store" do
    {:ok, pid} = StoreGenServer.start()

    assert nil == StoreGenServer.get(pid, "name")

    assert :ok == StoreGenServer.put(pid, "name", "Arjan")
    assert "Arjan" == StoreGenServer.get(pid, "name")

    assert :ok == StoreGenServer.wipe(pid)
    assert nil == StoreGenServer.get(pid, "name")

  end
end
