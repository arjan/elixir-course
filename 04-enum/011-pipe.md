# The pipe |> operator.

The pipe operator `|>` passes the result of an expression as the first parameter of another expression.

Programming can get messy. So messy in fact that function calls can get so embedded that they become difficult to follow. Take the following nested functions into consideration:

```elixir
foo(bar(baz(new_function(other_function()))))
```

Here, we are passing the value `other_function/1` to `new_function/1`, and `new_function/1` to `baz/1`, `baz/1` to `bar/1`, and finally the result of `bar/1` to `foo/1`. Elixir takes a pragmatic approach to this syntactical chaos by giving us the pipe operator. The pipe operator which looks like `|>` *takes the result of one expression, and passes it on*. Let's take another look at the code snippet above rewritten using the pipe operator.

```elixir
other_function() |> new_function() |> baz() |> bar() |> foo()
```

The pipe takes the result on the left, and passes it to the right hand side.

## Examples

For this set of examples, we will use Elixir's String module.

- Tokenize String (loosely)

```elixir
iex> "Elixir rocks" |> String.split
["Elixir", "rocks"]
```

- Uppercase all the tokens

```elixir
iex> "Elixir rocks" |> String.upcase |> String.split
["ELIXIR", "ROCKS"]
```
