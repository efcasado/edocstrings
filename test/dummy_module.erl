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
    ok.

f3() ->
    "this is not a docstring".
