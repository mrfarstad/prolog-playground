:- use_module(library(clpfd)).

name(X,N) :- nth0(N,[mary,nina,per,john],X).
name(X) :- name(X,_).
color(X,N) :- nth0(N,[red,green,blue,yellow],X).
color(X) :- color(X,_).
pet(X,N) :- nth0(N,[hamster,mouse,turtle,snake],X).
pet(X) :- pet(X,_).
drink(X,N) :- nth0(N,[juice,tea,milk,lemonade],X).
drink(X) :- drink(X,_).



env(E) :- length(E,4), subenv(E).
subenv([]).
subenv([X|E]) :- length(X,4), all_different(X), ins(X,0..3), subenv(E).


boy(P,_) :- P#>1.
girl(P,_) :- P#=<1.

reptile(P,_) :- P#>1.
rodent(P,_) :- P#=<1.

likes(A,B,E) :- nth0(A,E,Av), nth0(0,Av,B), dif(A,B).
lives(A,B,E) :- nth0(A,E,Av), nth0(1,Av,B).
keeps(A,B,E) :- nth0(A,E,Av), nth0(2,Av,B).
drinks(A,B,E) :- nth0(A,E,Av), nth0(2,Av,B).


solve(S,E) :- env(E), solve1(S,E).

solve1([],_).
solve1([S|T],E) :- call(S,E), solve1(T,E).


text([],[]).
text(S,[P|T]) :- phrase(my_setting(S1,S),P), text(S1,T).

my_setting(S,S2) --> person(P,S,S1), vp(P,S1,S2).
person(P,S,S) --> [N], {name(N,P)}.
person(P,S,S1) --> [the,person,who], vp(P,S,S1).
person(P,S,[girl(P)|S]) --> [a,girl].
person(P,S,[boy(P)|S]) --> [a,boy].
person(P,S,[girl(P)|S1]) --> [a,girl,who], vp(P,S,S1).
person(P,S,[boy(P)|S1]) --> [a,boy,who], vp(P,S,S1).
person(P,S,[keeps(P,P1)|S1]) --> [a],pet(P1,S,S1),[owner].
person(P,S,[keeps(P,P1)|S1]) --> [a],pet(P1,S,S1),[keeper].
person(P,S,[lives(P,C)|S]) --> [the,resident,of,the,N,house], {color(N,C)}.

pet(P,S,S) --> [N], {pet(N,P)}.
pet(P,S,[reptile(P)|S]) --> [reptile].
pet(P,S,[rodent(P)|S]) --> [rodent].

vp(P,S,[lives(P,C)|S]) --> [lives,in,the,N,house], {color(N,C)}.
vp(P,S,[likes(P,P1)|S1]) --> [likes], person(P1,S,S1).
vp(P,S,[keeps(P,P1)|S1]) --> [keeps,a], pet(P1,S,S1).
vp(P,S,[drinks(P,P1)|S]) --> [drinks,N], {drink(N,P1)}.
vp(P,S,[drinks(P,P1)|S]) --> [prefers,N], {drink(N,P1)}.
