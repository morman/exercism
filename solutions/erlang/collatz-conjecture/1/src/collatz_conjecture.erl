-module(collatz_conjecture).

-export([steps/1]).

% instead of handling bad inputs, use the Erlang mentality of "let it fail" and throw an error

% handle case of empty input
steps(N) when N == nil ->
  erlang:error(badarg);

% We need to handle the negative number case
steps(N) when N < 1 ->
  erlang:error(badarg);

% We need to handle the 1 case differently, as 1 rem 2 is 1
steps(N) when N == 1 ->
  0;

% defer positive integers greater than one to the accumulator
steps(N) ->
  steps(N, 0).

% I suspect we'll need to add an accumulator or similar to store steps?
% Erlang will see an internal steps(N, steps) function as a separate function with different arity, so consider that method

% steps when N is 1: return accumulator
steps(N, Acc) when N == 1 ->
  Acc;

% guard for even, when N rem 2 == 0, N / 2
steps(N, Acc) when N rem 2 == 0 ->
  % accumulate and recur
  % NOTE: need to use "div" instead of "/" here to get an integer remainder!
  steps(N div 2, Acc + 1);

% guard for odd, when N rem 2 == 1, 3N + 1
steps(N, Acc) when N rem 2 == 1 ->
  % accumulate and recur
  steps(3 * N + 1, Acc + 1).

