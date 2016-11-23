# Assignments

## Assignment 1

Create a `PersonalGreeter` module which greets you in a personal way,
using pattern matching in function clauses.

## Assignment 2

Create a function which, given an age in years, determines the age group.

* 0..9 = child
* 10..19 = teenager
* 20..29 = millennial
* 30..39 = thirtysomething
* >= 40 = senior

These assertions should pass:

    assert :child == AgeGroup.group(9)
    assert :teenager == AgeGroup.group(16)
    assert :millennial == AgeGroup.group(21)
    assert :thirtysomething == AgeGroup.group(30)
    assert :senior == AgeGroup.group(41)


Hint: you can use either `case`, `cond`, `if` or even function clauses.


## Assignment 3

Implement the "Bob" [exercism](http://exercism.io/languages/elixir/exercises) assignment.

Bob is a lackadaisical teenager. In conversation, his responses are very limited.

* Bob answers 'Sure.' if you ask him a question.
* He answers 'Whoa, chill out!' if you yell at him (when you speak in all caps)
* He says 'Fine. Be that way!' if you address him without actually saying anything.
* He answers 'Whatever.' to anything else.

Examples:

    iex> Bob.hey("")
    "Fine. Be that way!"
    iex> Bob.hey("Do you like math?")
    "Sure."
    iex> Bob.hey("HELLO!")
    "Whoa, chill out!"
    iex> Bob.hey("Coding is cool.")
    "Whatever."
