# Control structures

## `if` and `unless`

Chances are you've encountered `if/2` before, and if you've used Ruby you're familiar with `unless/2`.

```elixir
iex> if String.valid?("Hello") do
...>   "Valid string!"
...> else
...>   "Invalid string."
...> end
"Valid string!"

iex> if "a string value" do
...>   "Truthy"
...> end
"Truthy"
```

Using `unless/2` is like `if/2` only it works on the negative:

```elixir
iex> unless is_integer("hello") do
...>   "Not an Int"
...> end
"Not an Int"
```

## `case`

If it's necessary to match against multiple patterns we can use `case`:

```elixir
iex> case {:ok, "Hello World"} do
...>   {:ok, result} -> result
...>   {:error} -> "Uh oh!"
...>   _ -> "Catch all"
...> end
"Hello World"
```

The `_` variable is an important inclusion in `case` statements. Without it failure to find a match will raise an error:

```elixir
iex> case :even do
...>   :odd -> "Odd"
...> end
** (CaseClauseError) no case clause matching: :even

iex> case :even do
...>   :odd -> "Odd"
...>   _ -> "Not Odd"
...> end
"Not Odd"
```

Consider `_` as the `else` that will match "everything else".

Since `case` relies on pattern matching, all of the same rules and restrictions apply.  If you intend to match against existing variables you must use the pin `^` operator:

```elixir
iex> pie = 3.14
 3.14
iex> case "cherry pie" do
...>   ^pie -> "Not so tasty"
...>   pie -> "I bet #{pie} is tasty"
...> end
"I bet cherry pie is tasty"
```


## `cond`

When we need to match conditions rather than values we can turn to `cond`; this is akin to `else if` or `elsif` from other languages:

```elixir
iex> cond do
...>   2 + 2 == 5 ->
...>     "This will not be true"
...>   2 * 2 == 3 ->
...>     "Nor this"
...>   1 + 1 == 2 ->
...>     "But this will"
...> end
"But this will"
```

Like `case`, `cond` will raise an error if there is no match.  To handle this, we can define a condition set to `true`:

```elixir
iex> cond do
...>   7 + 1 == 0 -> "Incorrect"
...>   true -> "Catch all"
...> end
"Catch all"
```
