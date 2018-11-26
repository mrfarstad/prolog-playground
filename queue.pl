:- include('appenddl.pl').
:- include('difflist.pl').

empty(dl([], [])).

put(In, X, Out) :- 
  append_dl(dl([X|A], A), In, Out).

get(In, X, Out) :-
  difflist(List, In),
  reverse(List, [X|RevList]),
  reverse(RevList, NewList),
  difflist(NewList, Out).
