twice([], []).
twice([X|TX], [X,X|TY]) :-
    twice(TX, TY).
