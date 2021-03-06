# Loops and enumeration.

The `Enum` module contains functions which enumerate over collections.

Often, we write our own, small, anonymous functions, which we pass in
as arguments to one of the Enum functions. This lets us transform the
collection in some way or another.

Collections can be either:

* lists
* ranges (`0..10`)
* maps



### each

It may be necessary to iterate over a collection without producing a new value, for this case we use `each`:

```elixir
iex> Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)
one
two
three
```

### map

To apply our function to each item and produce a new collection look to the `map` function:

```elixir
iex> Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
[-1, 0, 1, 2]
```

### filter

To filter out values that fail some given condition, use the `filter` function:

```elixir
iex> Enum.filter([-1, 0, 1, 2], fn(x) -> x > 0 end)
[1, 2]
```

### reduce

With `reduce` we can distill our collection down into a single value.  To do this we supply an optional starting value (the "accumulator", `10` in this example) to be passed into our function; if no accumulator is provided the first value is used:

```elixir
iex> Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
16
iex> Enum.reduce([1, 2, 3], fn(x, acc) -> x + acc end)
6
iex> Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end)
"cba1"
```

### sort

Sorting our collections is made easy with not one, but two, `sort` functions.  The first option available to us uses Elixir's term ordering to determine the sorted order:

```elixir
iex> Enum.sort([5, 6, 1, 3, -1, 4])
[-1, 1, 3, 4, 5, 6]

iex> Enum.sort([:foo, "bar", Enum, -1, 4])
[-1, 4, Enum, :foo, "bar"]
```

The other option allows us to provide a sort function:

```elixir
# with our function
iex> Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
[%{val: 4}, %{val: 1}]

# without
iex> Enum.sort([%{:count => 4}, %{:count => 1}])
[%{count: 1}, %{count: 4}]
```

### uniq

We can use `uniq` to remove duplicates from our collections:

```elixir
iex> Enum.uniq([1, 2, 2, 3, 3, 3, 4, 4, 4, 4])
[1, 2, 3, 4]
```
