/*
  Works for many cases, but not if you want to find every variable that is grather than another.
  ?- compare(R, succ(succ(0))).
  R = succ(succ(succ(_23012))).
  Need to find a way to remove _23012 with 0, and a way to find the next successor which is also greater.
*/

succ(X) :- X.

compare(succ(X), 0).
compare(succ(X), succ(Y)) :- compare(X, Y).
