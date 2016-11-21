# Elixir's data types

## Basic Data Types

### Integers

```elixir
iex> 255
255
```


### Floats

In Elixir, float numbers require a decimal after at least one digit; they have 64 bit double precision and support `e` for exponent numbers:

```elixir
iex> 3.14
3.14
iex> .14
** (SyntaxError) iex:2: syntax error before: '.'
iex> 1.0e-10
1.0e-10
```


### Booleans

Elixir supports `true` and `false` as booleans; everything is truthy except for `false` and `nil`:

```elixir
iex> true
true
iex> false
false
```

### Atoms

An atom is a constant whose name is their value. If you're familiar with Ruby these are synonymous with Symbols:

```elixir
iex> :foo
:foo
iex> :foo == :bar
false
```

Booleans `true` and `false` are also the atoms `:true` and `:false` respectively.

```elixir
iex> true |> is_atom
true
iex> :true |> is_boolean
true
iex> :true === true
true
```

Names of modules in Elixir are also atoms. `MyApp.MyModule` is a valid atom, even if no such module has been declared yet.

```elixir
iex> is_atom(MyApp.MyModule)
true
```

### Strings

Strings in Elixir are UTF-8 encoded and are wrapped in double quotes:

```elixir
iex> "Hello"
"Hello"
iex> "Heééé daar!"
"Heééé daar!"
```

## Basic Operations

### Arithmetic

Elixir supports the basic operators `+`, `-`, `*`, and `/` as you would expect.  It's important to notice that `/` will always return a float:

```elixir
iex> 2 + 2
4
iex> 2 - 1
1
iex> 2 * 5
10
iex> 10 / 5
2.0
```

If you need integer division or the division remainder, Elixir comes with two helpful functions to achieve this:

```elixir
iex> div(10, 5)
2
iex> rem(10, 3)
1
```

### Boolean

Elixir provides the `||`, `&&`, and `!` boolean operators. These support any types:

```elixir
iex> -20 || true
-20
iex> false || 42
42

iex> 42 && true
true
iex> 42 && nil
nil

iex> !42
false
iex> !false
true
```

There are three additional operators whose first argument _must_ be a boolean (`true` or `false`):

```elixir
iex> true and 42
42
iex> false or true
true
iex> not false
true
iex> 42 and true
** (ArgumentError) argument error: 42
iex> not 42
** (ArgumentError) argument error
```

### Comparison

Elixir comes with all the comparisons operators we're used to: `==`, `!=`, `===`, `!==`, `<=`, `>=`, `<` and `>`.

```elixir
iex> 1 > 2
false
iex> 1 != 2
true
iex> 2 == 2
true
iex> 2 <= 3
true
```

For strict comparison of integers and floats use `===`:

```elixir
iex> 2 == 2.0
true
iex> 2 === 2.0
false
```


### String Interpolation

If you've used Ruby, string interpolation in Elixir will look familiar:

```elixir
iex> name = "Sean"
iex> "Hello #{name}"
"Hello Sean"
```

### String Concatenation

String concatenation uses the `<>` operator:

```elixir
iex> name = "Sean"
iex> "Hello " <> name
"Hello Sean"
```
