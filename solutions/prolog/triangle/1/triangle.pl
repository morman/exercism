% Side1 and Side2 don't add up to Side3: not a triangle!
triangle(Side1, Side2, Side3, _) :- 
    Side1 + Side2 < Side3, !, fail.

% Side2 and Side3 don't add up to Side1: not a triangle, cut!
triangle(Side1, Side2, Side3, _) :- 
    Side2 + Side3 < Side1, !, fail.

% Side1 and Side3 don't add up to Side2: not a triangle, cut!
triangle(Side1, Side2, Side3, _) :- 
    Side1 + Side3 < Side2, !, fail.

% All sides are zero length: not a triangle, cut! 
triangle(Side1, Side2, Side3, _) :- 
    Side1 = 0, Side2 = 0, Side3 = 0, !, fail.

% all sides equal: matches equilateral 
triangle(Side1, Side2, Side3, "equilateral") :-
    Side1 = Side2, Side2 = Side3. 

% all sides not equal: matches scalene
triangle(Side1, Side2, Side3, "scalene") :-
    Side1 \= Side2, Side2 \= Side3, Side1 \= Side3. 

% two sides may be even: matches isoceles
triangle(Side1, Side2, Side3, "isosceles") :-
    Side1 = Side2; Side2 = Side3; Side1 = Side3.

