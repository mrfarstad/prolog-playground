[appenddl].
/*
append_dl(dl(X,A),dl(A,B), dl(X,B)).

difflist([X|Xs], R) :- append_dl(dl([X|Xs], Xs), dl(Xs, []), R).

*/

difflist(Xs, dl(Xs, [])).
