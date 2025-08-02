-module(accumulate).
-export([accumulate/2]).

%%
%% given a fun and a list, apply fun to each list item replacing list item with fun's return value.
%%
-spec accumulate(fun((A) -> B), list(A)) -> list(B).

% handle empty list case
accumulate(_Fn, List) when List == nil ->
  [];

% handle empty fun case
accumulate(Fn, _List) when Fn == nil ->
  [];

% handle valid inputs case
accumulate(Fn, [H|T]) ->

  % take the head from List, apply Fn, and recursively call the remaining tail, accumulating within
  [ Fn(H) | accumulate(Fn, T) ];

  % until the list is empty
  accumulate(_Fn, []) ->
    [].
