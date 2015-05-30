%%%=========================================================================
%%% File: edocstrings_ptransform.erl
%%%
%%%
%%% Author: Enrique Fernandez <enrique.fernandez@erlang-solutions.com>
%%%
%%% Copyright (c) 2015 - Enrique Fernandez
%%%=========================================================================
-module(edocstrings_ptransform).

-compile({parse_transform, forms_pt}).

-export([parse_transform/2]).


%% Exported functions
%%=========================================================================
parse_transform(Forms, _Opts) ->
    Docstrings = fetch_docstrings(Forms),
    HelpF      = gen_help_function(Docstrings),
    meta:add_function(HelpF, true, Forms).


%% Local functions
%%=========================================================================
fetch_docstrings(Forms) ->
    AllDocstrings =
        forms:reduce(
          fun(Form, Acc) ->
                  case has_docstring(Form) of
                      {true, FDocstring}  ->
                          [FDocstring| Acc];
                      false ->
                          Acc
                  end
          end,
          [],
          Forms),

    %% Filter out docstrings of non-exported functions
    lists:filter(fun({{F, A}, _Docstring}) ->
                         meta:is_function_exported(F, A, Forms)
                 end,
                 AllDocstrings).

has_docstring({function, _Line, Name, Arity, [C |_Cs]}) ->
    %% if a function has more than one clause, the docstring must be
    %% defined in the first clause.
    case fclause_has_docstring(C) of
        {true, Docstring} ->
            {true, {{Name, Arity}, Docstring}};
        false             ->
            false
    end;
has_docstring(_Form) ->
    false.

fclause_has_docstring({clause, _Line, _Args, _Guards, Body}) ->
    fbody_has_docstring(Body).

fbody_has_docstring(Body = [{string, _Line, Docstring}| _])
  when length(Body) > 1 ->
    {true, Docstring};
fbody_has_docstring(_Body) ->
    %% if the function body has only 1 expression, that function cannot
    %% have a docstring.
    false.

gen_help_function(Docstrings) ->
    Bindings = [
                 [
                  {'F', F},
                  {'A', A},
                  {'D', D}
                 ]
                || {{F, A}, D} <- Docstrings ],
    forms:function(
      help,
      [
        {fun(F, A) -> D end, Bindings},
        {fun(_, _) -> {error, docstring_not_found} end, []}
      ]).
