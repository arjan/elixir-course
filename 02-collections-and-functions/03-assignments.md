# Assignments

 * Create a new test module, `CollectionsTest` in
   `collections_test.exs`. In it, add a test case that checks the
   length of a list:

        list = [1, 2]
        assert 2 == Enum.count(list)

 * Create a function `Hello.square/1` which squares its input. Create
   the appropriate test cases.

 * Use the anonymous and the shorthand-notitation to create 2 more
   square functions.

 * Create a function `Hello.multiplier` which returns a function which
   can be used to multiply numbers by a constant.

        double = Hello.multiplier(2)
        assert 4 == double.(2)
