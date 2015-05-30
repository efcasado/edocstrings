edocstrings
===========

A `docstring` is a string literal that occurs as the first expression
in a function.

```erl
-module(math2).

-export([math/2]).

sum(A, B) ->
    "Returns the sum of the two provided numbers.",
    A + B.
```

Docstrings can be accessed by invoking the `<MODULE>:help(<FUNCTION>,
<ARITY>)` function.

In the example above, `sum/2`'s docstring can be accessed by calling
`math2:help(sum, 2)`, which returns the `"Returns the sum of the two
provided numbers."` string literal.


## Author(s)

- Enrique Fernandez `<enrique.fernandez@erlang-solutions.com>`
