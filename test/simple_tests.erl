%%%=========================================================================
%%% File: simple_tests.erl
%%%
%%% Module implementing a battery of simple unit tests.
%%%
%%%
%%% Author: Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
%%%
%%% Copyright (c) 2015 - Enrique Fernandez
%%%=========================================================================
-module(simple_tests).

-include_lib("eunit/include/eunit.hrl").


%% Unit tests
%%=========================================================================
docstring_found_test_()     ->
    [
     ?_assertMatch("This is a dummy docstring" , dummy_module:help(f1, 0))
    ].

docstring_not_found_test_() ->
    [
     ?_assertMatch({error, docstring_not_found}, dummy_module:help(f2, 0)),
     ?_assertMatch({error, docstring_not_found}, dummy_module:help(f3, 0))
    ].
