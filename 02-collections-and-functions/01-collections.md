# Collections

## Lists

Lists are simple collections of values, they may include multiple types; lists may include non-unique values:

```elixir
iex> [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
```

### List Concatenation

List concatenation uses the `++` operator:

```elixir
iex> [1, 2] ++ [3, 4, 1]
[1, 2, 3, 4, 1]
```


### List Subtraction

Support for subtraction is provided via the `--` operator; it's safe to subtract a missing value:

```elixir
iex> ["foo", :bar, 42] -- [42, "bar"]
["foo", :bar]
```

Be mindful of duplicate values. For every element on the right, the first occurrence of it gets removed from the left:

```elixir
iex> [1,2,2,3,2,3] -- [1,2,3,2]
[2, 3]
```


### Head / Tail

When using lists it is common to work with a list's head and tail.  The head is the list's first element while the tail is the remaining elements.  Elixir provides two helpful methods, `hd` and `tl`, for working with these parts:

```elixir
iex> hd [3.14, :pie, "Apple"]
3.14
iex> tl [3.14, :pie, "Apple"]
[:pie, "Apple"]
```

In addition to the aforementioned functions, you can
use [pattern matching](../pattern-matching/) and the cons operator `|`
to split a list into head and tail:

```elixir
iex> [h|t] = [3.14, :pie, "Apple"]
[3.14, :pie, "Apple"]
iex> h
3.14
iex> t
[:pie, "Apple"]
```

## Tuples

Tuples are defined with curly braces:

```elixir
iex> {3.14, :pie, "Apple"}
{3.14, :pie, "Apple"}
```

It is common for tuples to be used as a mechanism to return additional information from functions:

```elixir
iex> File.read("path/to/existing/file")
{:ok, "... contents ..."}
iex> File.read("path/to/unknown/file")
{:error, :enoent}
```

## Keyword lists

Keyword lists are an alternative syntax for lists, in which each
element is an {atom, value} tuple. They are most commonly used to pass
options to functions.

```elixir
iex> [foo: "bar", hello: "world"]
[foo: "bar", hello: "world"]
iex> [{:foo, "bar"}, {:hello, "world"}]
[foo: "bar", hello: "world"]
```


## Maps

A map is the same as a hash in Ruby. You can define a map with the `%{}` syntax:

```elixir
iex> map = %{:foo => "bar", "hello" => :world}
%{:foo => "bar", "hello" => :world}
iex> map[:foo]
"bar"
iex> map["hello"]
:world
```

Variables are allowed as map keys:

```elixir
iex> key = "hello"
"hello"
iex> %{key => "world"}
%{"hello" => "world"}
```

If a duplicate is added to a map, it will replace the former value:

```elixir
iex> %{:foo => "bar", :foo => "hello world"}
%{foo: "hello world"}
```

As we can see from the output above, there is a special syntax for maps containing only atom keys:

```elixir
iex> %{foo: "bar", hello: "world"}
%{foo: "bar", hello: "world"}

iex> %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
true
```
