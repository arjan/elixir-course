# Advanced / additional language constructs


## Guards

Guards are short, "pure" pieces of code which can appear in case
clauses and function heads.

_This example comes directly from the official Elixir [Getting Started](http://elixir-lang.org/getting-started/case-cond-and-if.html#case) guide._

```elixir
iex> case {1, 2, 3} do
...>   {1, x, 3} when x > 0 ->
...>     "Will match"
...>   _ ->
...>     "Won't match"
...> end
"Will match"
```


In the following example we have two functions with the same signature, we rely on guards to determine which to use based on the argument's type:

```elixir
defmodule Greeter do
  def hello(names) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello
  end

  def hello(name) when is_binary(name) do
    phrase <> name
  end

  defp phrase, do: "Hello, "
end

iex> Greeter.hello ["Sean", "Steve"]
"Hello, Sean, Steve"
```

Not all expressions are valid in guards. Check the official docs
for
[Expressions allowed in guard clauses](http://elixir-lang.org/getting-started/case-cond-and-if.html#expressions-in-guard-clauses).


## Structs


Structs are special maps with a defined set of keys and default values.  A struct must be defined within a module, which it takes its name from.  It is common for a struct to be the only thing defined within a module.

To define a struct we use `defstruct` along with a keyword list of fields and default values:

```elixir
defmodule Example.User do
  defstruct name: "Sean", roles: []
end
```

Let's create some structs:

```elixir
iex> %Example.User{}
%Example.User{name: "Sean", roles: []}

iex> %Example.User{name: "Steve"}
%Example.User{name: "Steve", roles: []}

iex> %Example.User{name: "Steve", roles: [:admin, :owner]}
%Example.User{name: "Steve", roles: [:admin, :owner]}
```

We can update our struct just like we would a map:

```elixir
iex> steve = %Example.User{name: "Steve", roles: [:admin, :owner]}
%Example.User{name: "Steve", roles: [:admin, :owner]}
iex> sean = %{steve | name: "Sean"}
%Example.User{name: "Sean", roles: [:admin, :owner]}
```

Most importantly, you can match structs against maps:

```elixir
iex> %{name: "Sean"} = sean
%Example.User{name: "Sean", roles: [:admin, :owner]}
```




## Sigils

Elixir provides an alternative syntax for representing and working with literals. A sigil will start with a tilde `~` followed by a character. The Elixir core provides us with some built in sigils however, it is possible to create our own when we need to extend the language.

A list of available sigils include:

  - `~C` Generates a character list **with no** escaping or interpolation
  - `~c` Generates a character list **with** escaping and interpolation
  - `~R` Generates a regular expression **with no** escaping or interpolation
  - `~r` Generates a regular expression **with** escaping and interpolation
  - `~S` Generates a string **with no** escaping or interpolation
  - `~s` Generates a string **with** escaping and interpolation
  - `~W` Generates a word list **with no** escaping or interpolation
  - `~w` Generates a word list **with** escaping and interpolation
  - `~N` Generates a `NaiveDateTime` struct

A list of delimiters include:

  - `<...>` A pair of pointy brackets
  - `{...}` A pair of curly brackets
  - `[...]` A pair of square brackets
  - `(...)` A pair of parenthesis
  - `|...|` A pair of pipes
  - `/.../` A pair of forward slashes
  - `"..."` A pair of double quotes
  - `'...'` A pair of single quotes

### Char List

The `~c` and `~C` sigils generate character lists respectively. For example:

```elixir
iex> ~c/2 + 7 = #{2 + 7}/
'2 + 7 = 9'

iex> ~C/2 + 7 = #{2 + 7}/
'2 + 7 = #{2 + 7}'
```

We can see the lowercased `~c` interpolates the calculation, whereas the uppercased `~C` sigil does not. We will see that this uppercase / lowercase sequence is a common theme throughout the built in sigils.

### Regular Expressions

The `~r` and `~R` sigils are used to represent Regular Expressions. We create them either on the fly or for use within the `Regex` functions. For example:

```elixir
iex> re = ~r/elixir/
~/elixir

iex> "Elixir" =~ re
false

iex> "elixir" =~ re
true
```

We can see that in the first test for equality, that `Elixir` does not match with the regular expression. This is because it is capitalized. Because Elixir supports Perl Compatible Regular Expressions (PCRE), we can append `i` to the end of our sigil to turn off case sensitivity.

```elixir
iex> re = ~r/elixir/i
~/elixir

iex> "Elixir" =~ re
true

iex> "elixir" =~ re
true
```

Further, Elixir provides the [Regex](http://elixir-lang.org/docs/stable/elixir/Regex.html) API which is built on top of Erlang's regular expression library. Let's implement `Regex.split/2` using a regex sigil:

```elixir
iex> string = "100_000_000"
"100_000_000"

iex> Regex.split(~r/_/, string)
["100", "000", "000"]
```

As we can see, the string `"100_000_000"` is split on the underscore thanks to our `~r/_/` sigil. The `Regex.split` function returns a list.

### String

The `~s` and `~S` sigils are used to generate string data. For example:

```elixir
iex> ~s/the cat in the hat on the mat/
"the cat in the hat on the mat"

iex> ~S/the cat in the hat on the mat/
"the cat in the hat on the mat"
```

What is the difference? The difference is similar to the Character List sigil that we looked at. The answer is interpolation and the use of escape sequences. If we take another example:

```elixir
iex> ~s/welcome to elixir #{String.downcase "school"}/
"welcome to elixir school"

iex> ~S/welcome to elixir #{String.downcase "school"}/
"welcome to elixir \#{String.downcase \"school\"}"
```

### Word List

The word list sigil can come in handy time to time. It can save both time, keystrokes and arguably reduce the complexity within the codebase. Take this simple example:

```elixir
iex> ~w/i love elixir school/
["i", "love", "elixir", "school"]

iex> ~W/i love elixir school/
["i", "love", "elixir", "school"]
```
