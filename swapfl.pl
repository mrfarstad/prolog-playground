/* Swap first and last element in list */
swapfl([X|Xs], R) :- reverse(Xs, [Y|Ys]), reverse(Ys, P), append([X], [], Q), append(P, Q, S), append([Y], S, R).
