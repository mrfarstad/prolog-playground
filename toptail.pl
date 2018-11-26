[last].

removeTop([_|Xs], Y) :- append(Xs, [], Y).
removeTail(Xs, R) :- reverse(Xs, Z), removeTop(Z, Y), reverse(Y, R).

toptail(Xs, Q) :- removeTop(Xs, Z), removeTail(Z, Q). 
