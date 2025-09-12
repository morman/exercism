-module(two_fer).

-export([two_fer/0, two_fer/1]).

% Name is missing, default to "you" instead
two_fer() ->
  "One for you, one for me.".

% Name provided, build string with name
two_fer(Name) ->
  "One for " ++ Name ++ ", one for me.".
