reverse([], []).
reverse([X|Xs], Y) :-
  reverse(Xs, Ys),
  append(Ys, [X], Y).
