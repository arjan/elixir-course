# Functions

In Elixir and many functional languages, functions are first class citizens.  We will learn about the types of functions in Elixir, what makes them different, and how to use them.


## Anonymous Functions

To define an anonymous function in Elixir we need the `fn` and `end`
keywords. Let's look at a basic example:

```elixir
iex> sum = fn (a, b) -> a + b end
iex> sum.(2, 3)
5
```

Note the dot in `sum.(2, 3)`!

## Named Functions

We can define functions with names so we can easily refer to them later.  Named functions are defined within a module using the `def` keyword .  We'll learn more about Modules in the next lessons, for now we'll focus on the named functions alone.

Functions defined within a module are available to other modules for use.  This is a particularly useful building block in Elixir:

```elixir
defmodule Greeter do
  def hello(name) do
    "Hello, " <> name
  end
end

iex> Greeter.hello("Sean")
"Hello, Sean"
```

If our function body only spans one line, we can shorten it further with `do:`:

```elixir
defmodule Greeter do
  def hello(name), do: "Hello, " <> name
end
```

### Private Functions

When we don't want other modules accessing a specific function we can make the function private.  Private functions can only be called from within their own Module.  We define them in Elixir with `defp`:

```elixir
defmodule Greeter do
  def hello(name), do: phrase <> name
  defp phrase, do: "Hello, "
end

iex> Greeter.hello("Sean")
"Hello, Sean"

iex> Greeter.phrase
** (UndefinedFunctionError) undefined function: Greeter.phrase/0
    Greeter.phrase()
```


### Default Arguments

If we want a default value for an argument we use the `argument \\ value` syntax:

```elixir
defmodule Greeter do
  def hello(name, country \\ "en") do
    phrase(country) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

iex> Greeter.hello("Sean", "en")
"Hello, Sean"

iex> Greeter.hello("Sean")
"Hello, Sean"

iex> Greeter.hello("Sean", "es")
"Hola, Sean"
```
