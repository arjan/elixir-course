# Concurrency

One of the selling points of Elixir is its support for
concurrency. Thanks to the Erlang VM (BEAM), concurrency in Elixir is
easier than expected.  The concurrency model relies on Actors, a
contained process that communicates with other processes through
message passing.

In this lesson we'll look at the concurrency modules that ship with Elixir.

## Processes

Processes in the Erlang VM are lightweight and run across all CPUs.  While they may seem like native threads, they're simpler and it's not uncommon to have thousands of concurrent processes in an Elixir application.

The easiest way to create a new process is `spawn`, which takes either an anonymous or named function.  When we create a new process it returns a _Process Identifier_, or PID, to uniquely identify it within our application.

To start we'll create a module and define a function we'd like to run:

```elixir
defmodule Example do
  def add(a, b) do
    IO.puts(a + b)
  end
end

iex> Example.add(2, 3)
5
:ok
```

To evaluate the function asynchronously we use `spawn/3`:

```elixir
iex> spawn(Example, :add, [2, 3])
5
#PID<0.80.0>
```

### Message Passing

To communicate, processes rely on message passing. There are two main components to this: `send/2` and `receive`.  The `send/2` function allows us to send messages to PIDs.  To listen we use `receive` to match messages.  If no match is found the execution continues uninterrupted.

```elixir
defmodule Example do
  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "World"
    end

    listen
  end
end

iex> pid = spawn(Example, :listen, [])
#PID<0.108.0>

iex> send pid, {:ok, "hello"}
World
{:ok, "hello"}

iex> send pid, :ok
:ok
```

You may notice that the `listen/0` function is recursive, this allows
our process to handle multiple messages. Without recursion our process
would exit after handling the first message.


### Process registry

Processes can register themselves under a name in a global process
registry. This is handy if you don't want to keep the PID of the
process around.

You can use this name in the `send/2` function instead of the pid.


```elixir
defmodule Example do
  def start do
    Process.register(self(), :example)
    listen()
  end

  def listen do
    receive do
      {:ok, "hello"} -> IO.puts "World"
    end

    listen
  end
end

iex> spawn(Example, :start, [])
#PID<0.108.0>

iex> send :example, {:ok, "hello"}
World
{:ok, "hello"}
```
