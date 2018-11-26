[reverse].

palindrome([]).
palindrome(Xs) :-
  reverse(Xs, Y),
  Y = Xs.



