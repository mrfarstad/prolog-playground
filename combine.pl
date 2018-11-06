combine1([], [], []).
combine1([X|TX],[Y|TY], [X,Y|TZ]) :- combine1(TX, TY, TZ).

combine2([], [], []).
combine2([X|TX], [Y|TY], [[X,Y]|TZ]) :- combine2(TX, TY, TZ).

combine3([], [], []).
combine3([X|TX], [Y|TY], [j(X,Y)|TZ]) :- combine3(TX, TY, TZ).
