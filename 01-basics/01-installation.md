# Installation


I am assuming that all of you are familiar with using the terminal.

The Elixir website has all the information you need:

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
