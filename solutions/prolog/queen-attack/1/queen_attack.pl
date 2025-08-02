%! create(+DimTuple)
%
% The create/1 predicate succeeds if the DimTuple contains valid chessboard 
% dimensions, e.g. (0,0) or (2,4).
create((DimX, DimY)) :-
	% can we use the between/3 predicate? Yes.
	between(0, 7, DimX),
	between(0, 7, DimY).


%! attack(+FromTuple, +ToTuple)
%
% The attack/2 predicate succeeds if a queen positioned on ToTuple is 
% vulnerable to an attack by another queen positioned on FromTuple.
attack((FromX, FromY), (ToX, ToY)):-
	% rule if FromX matches ToX
	FromX =:= ToX;
	% alternate rule if FromY matches ToY
	FromY =:= ToY;
	% alternate rule for distance between X using absolute value arithmetic expression
	abs(FromX - ToX) =:= abs(FromY - ToY).
	
