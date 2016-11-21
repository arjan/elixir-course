# Assignments

## Assignment 1

* Remove the default code from the test case in `hello_test.exs` and
  replace it with your `IO.puts` hello world.
* Run `mix test`, and observe what happens.

## Assignment 2

* Call `Hello.greet()` from the test case. Run the test. what happens?

* OK, so the `Hello.greet` did not exist yet. Let's create it
  in `hello.ex` to put the IO.puts in.

        defmodule Hello do
            def greet() do
              IO.puts "Hello world"
            end
        end

* Run the test again.

* Extend `Hello.greet` to add a *name* parameter. Use string
  interpolation or concatenation to print any name to the screen
  ("`Hello, James!`"). Write the appropriate test cases.


## Assignment 3

Using "IO.puts" inside a function is not really easily testable. Let's
change that so that we let the Hello module just generate the message.

 * Make the following test case pass:

        assert "Hello world" == Hello.greet()

 * Now, add a second greet function which takes a name:

        assert "Hello Arjan" == Hello.greet("Arjan")
