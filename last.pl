last([X|Xs],A) :- last_(Xs,X,A).
last_([],A,A).
last_([X|Xs],_,A) :- last_(Xs,X,A).
