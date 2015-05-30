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

```erl
math2:help(sum, 2).
"Returns the sum of the two provided numbers."
```


## Author(s)

- Enrique Fernandez `<enrique.fernandez@erlang-solutions.com>`


## License

> The MIT License (MIT)
>
> Copyright (c) 2015 Enrique Fernández
>
> Permission is hereby granted, free of charge, to any person obtaining
> a copy of this software and associated documentation files (the
> "Software"), to deal in the Software without restriction, including
> without limitation the rights to use, copy, modify, merge, publish,
> distribute, sublicense, and/or sell copies of the Software, and to
> permit persons to whom the Software is furnished to do so, subject to
> the following conditions:
>
> The above copyright notice and this permission notice shall be
> included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
> LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
> OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
> WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
