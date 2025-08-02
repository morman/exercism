-module(leap).

-export([leap_year/1]).

% is the year is also evenly divisible by 4 and 400? Leap
leap_year(Year) when Year rem 4 == 0, Year rem 400 == 0 ->
  true;

% is the year evenly divisible by 4 and 100? Not leap
leap_year(Year) when Year rem 4 == 0, Year rem 100 == 0 ->
  false;

% is the year evenly divisible by 4 ? Leap
leap_year(Year) when Year rem 4 == 0 ->
  true;

% is the year not evenly divisible by 4 ? Not leap
leap_year(_Year) ->
  false
.