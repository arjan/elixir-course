# Pattern matching

## Match Operator

Are you ready for a curveball? In Elixir, the `=` operator is actually a match operator, comparable to the equals sign in algebra. Writing it turns the whole expression into an equation and makes Elixir match the values on the left hand with the values on the right hand. If the match succeeds, it returns the value of the equation. Otherwise, it throws an error. Let's take a look:

```elixir
iex> x = 1
1
```

Now let's try some simple matching:

```elixir
iex> 1 = x
1
iex> 2 = x
** (MatchError) no match of right hand side value: 1
```

Let's try that with some of the collections we know:

```elixir
# Lists
iex> list = [1, 2, 3]
iex> [1, 2, 3] = list
[1, 2, 3]
iex> [] = list
** (MatchError) no match of right hand side value: [1, 2, 3]

iex> [1|tail] = list
[1, 2, 3]
iex> tail
[2, 3]
iex> [2|_] = list
** (MatchError) no match of right hand side value: [1, 2, 3]

# Tuples
iex> {:ok, value} = {:ok, "Successful!"}
{:ok, "Successful!"}
iex> value
"Successful!"
iex> {:ok, value} = {:error}
** (MatchError) no match of right hand side value: {:error}
```

## Pin Operator

We just learned the match operator performs assignment when the left side of the match includes a variable.  In some cases this variable rebinding behavior is undesirable.  For these situations we have the pin operator: `^`.

When we pin a variable we match on the existing value rather than rebinding to a new one.  Let's take a look at how this works:

```elixir
iex> x = 1
1
iex> ^x = 2
** (MatchError) no match of right hand side value: 2
iex> {x, ^x} = {2, 1}
{2, 1}
iex> x
2
```

## Pattern Matching

Pattern matching isn't limited to just variables in Elixir, it can be applied to function signatures as we will see in this section.

Elixir uses pattern matching to identify the first set of parameters which match and invokes the corresponding body:

```elixir
iex> handle_result = fn
...>   {:ok, result} -> IO.puts "Handling result..."
...>   {:error} -> IO.puts "An error has occurred!"
...> end

iex> some_result = 1
iex> handle_result.({:ok, some_result})
Handling result...

iex> handle_result.({:error})
An error has occurred!
```

Named functions can contain multiple *clauses*, each of which gets
tried using pattern matching:

```elixir
defmodule Hello do

  def greet("Piet") do
    "Hello, I know you, piet!"
  end

  def greet(name) do
    "Hello, #{name}."
  end

end
```
