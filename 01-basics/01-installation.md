# Getting started


I am assuming that all of you are familiar with using the terminal.
To install Elixir, the website has all the information you need:

* http://elixir-lang.org/install.html

When installation succeeds, check that you can run the `iex` command
in a terminal.

Make sure your Elixir version says 1.3.* and Erlang/OTP 19.

    ~# iex
    Erlang/OTP 19 [erts-8.0] [source] [64-bit] [smp:4:4] [async-threads:10] [hipe] [kernel-poll:false]

    Interactive Elixir (1.3.1) - press Ctrl+C to exit (type h() ENTER for help)
    iex(1)>


## The iex command

`iex` stands for Interactive Elixir; just like `irb` stands for
Interactive Ruby. It is a REPL (Read-Eval-Parse-Loop) interface in
which you can evaluate Elixir expressions dynamically.

From now on, I'm using the `iex>` syntax to denote
that something is running inside iex.

    iex> 1 + 1
    2

Hurray, it works!

    iex> IO.puts "Hello world"
    Hello world
    :ok


## Modules and functions

Elixir organizes everything in *Modules*. Each module is just a
collection of functions.

Module names start with an Uppercase, and are written in `CamelCase`.

Function names start with a lowercase and are written in `snake_case`.

Like in the previous example, here we are calling the function `puts`
inside the module `IO`:

    iex> IO.puts("Hello world")
    Hello world
    :ok

Function calls have parentheses around them, however, you can leave
them away if you want to, as long as they don't cause ambiguity.

    iex> IO.puts "Hello world"
    Hello world
    :ok



## Getting help / documentation

`iex` has a builtin `h` command which shows documentation for any
module / function, right inside the terminal:

    iex> h IO.puts

    def puts(device \\ group_leader(), item)

    Writes item to the given device, similar to write/2, but adds a
    newline at the end.


    iex(7)> h IO

    IO

    Functions handling input/output (IO).
    ... more doc ...

You can also reference the website; Elixir has a great help website, accessible at
http://elixir-lang.org/docs/stable/elixir.  It documents all modules
and functions available to you.
