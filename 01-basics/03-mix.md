# Mix

Elixir's workhorse tool is called `mix`. It is used to create new
projects, fetch dependencies, do compilation, testing, et cetera. Each
of these is called a *task*. You can even create new tasks yourself!

Let's see if it works:

    ~> mix
    ** (Mix) Could not find a Mix.Project, please ensure a mix.exs file is available

Yes! It complains about that there is no project. Let's create one.

    ~> mkdir ~/Elixir
    ~> cd ~/Elixir
    ~> mix new hello
    * creating README.md
    * creating .gitignore
    * creating mix.exs
    * creating config
    * creating config/config.exs
    * creating lib
    * creating lib/hello.ex
    * creating test
    * creating test/test_helper.exs
    * creating test/hello_test.exs

    Your Mix project was created successfully.
    You can use "mix" to compile it, test it, and more:

        cd hello
        mix test

    Run "mix help" for more commands.

Pretty self-explanatory, right?

Our code will be put in the `lib/` folder; our tests in the `test/` folder.

Elixir is really focussed on TDD. So, even for our "hello world", let's TDD it!
