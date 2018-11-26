/*
s --> foo,bar,wiggle.
foo --> [choo].
foo --> foo,foo.
bar --> mar,zar.
mar --> me,my.
me --> [i].
my --> [am].
zar --> blar,car.
blar --> [a].
car --> [train].
wiggle --> [toot].
wiggle --> wiggle,wiggle.
*/

/* Convert to ordinary Prolog rules */
s(X, Z) :- foo(X, Y), bar(Y, Q), wiggle(Q, Z).

foo([choo|W], W).
foo(X, Z) :- foo(X, Y), foo(Y, Z).

bar(X, Z) :- mar(X, Y), zar(Y, Z).

mar(X, Z) :- me(X, Y), my(Y, Z).

me([i|W], W).
my([am|W], W).

zar(X, Z) :- blar(X, Y), car(Y, Z).

blar([a|W], W).
car([train|W], W).

wiggle([toot|W], W).
wiggle(X, Z) :- wiggle(X, Y), wiggle(Y, Z).

/* Responses to s(X, [])
[choo, i, am, a, train, toot]
[choo, i, am, a, train, toot, toot]
[choo, i, am, a, train, toot, toot, toot]

Backward tracking causes wiggle to generate different variables
*/
