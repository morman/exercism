% test runner for now: 
% swipl -f raindrops.pl -s raindrops_tests.plt -g run_tests,halt -t 'halt(1)'

convert(N, "PlingPlangPlong") :-
    % if N divisible by 3, 5 and 7, PlingPlangPlong and short-circuit / cut here
    N mod 3 =:= 0, N mod 5 =:= 0, N mod 7 =:= 0, !.


convert(N, "PlangPlong") :-
    % if N divisible by 5 and 7, PlangPlong and short-circuit / cut here
    N mod 5 =:= 0, N mod 7 =:= 0, !.

convert(N, "PlingPlong") :-
    % if N divisible by 3 and 7, PlingPlong and short-circuit / cut here
    N mod 3 =:= 0, N mod 7 =:= 0, !.

convert(N, "PlingPlang") :-
    % if N divisible by 3 and 5, PlingPlang and short-circuit / cut here
    N mod 3 =:= 0, N mod 5 =:= 0, !.

convert(N, "Pling") :-
    % if N divisible by 3, Pling and short-circuit / cut here
    N mod 3 =:= 0, !.

convert(N, "Plang") :-
    % if N divisible by 5, Plang and short-circuit / cut here
    N mod 5 =:= 0, !.

convert(N, "Plong") :-
    % if N divisible by 7, Plong and short-circuit / cut here
    N mod 7 =:= 0, !.

convert(N, Sounds) :- 
    % first just return the number as a string
    number_string(N, Sounds).