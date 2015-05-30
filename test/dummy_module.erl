%%%=========================================================================
%%% File: dummy_module.erl
%%%
%%% Author: Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
%%%
%%% Copyright (c) 2015 - Enrique Fernandez
%%%=========================================================================
-module(dummy_module).

-compile({parse_transform, edocstrings_ptransform}).

-export([f1/0, f2/0, f3/0]).


%% Exported functions
%%=========================================================================

f1() ->
    "dummy docstring",
    ok.

f2() ->
    f4().

f3() ->
    "this is not a docstring".

f4() ->
    "this is not a docstring because this function is not a exported function",
    ok.
