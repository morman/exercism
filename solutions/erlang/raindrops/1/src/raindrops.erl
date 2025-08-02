-module(raindrops).

-export([convert/1]).

% I am not happy with what I have done here.

% special case for 1
convert(Number) when Number == 1 ->
  "1";
% does not have any of 3, 5, or 7 as a factor, return number
convert(Number) when Number rem 3 /= 0,
  Number rem 5 /= 0,
  Number rem 7 /= 0 ->
  integer_to_list(Number);
convert(Number) ->
  % to hell with it: use separate functions and string concatenation for now to get the tests to pass
  pling(Number) ++ plang(Number) ++ plong(Number).

% is this divisible by 3? Pling
pling(Number) when Number rem 3 == 0 ->
  "Pling";
pling(_Number) ->
  "".

% is this divisible by 5? Plang
plang(Number) when Number rem 5 == 0 ->
  "Plang";
plang(_Number) ->
  "".

% is this divisible by 7? Plong
plong(Number) when Number rem 7 == 0 ->
  "Plong";
plong(_Number) ->
  "".


