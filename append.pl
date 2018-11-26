append([], Y, Y).
append([X|Xs], Y, [X|Z]) :- append(Xs, Y, Z).
