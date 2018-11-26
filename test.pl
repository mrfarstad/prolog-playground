/*
 * Note to self:
 *  This program creates a hiearchy of prioritizations
 *  It looks somehow like this, from higher to lower:
 *  - Paranthesis (atom)
 *  - Division (mult)
 *  - Multiplication (term)
 *  - Subtraction (sub)
 *  - Addition
 *
 *  The parenthesis behind each level describes what type of expression
 *  in the program they are. This is a bit weird to describe.
 *
 *  Subtraction is different that addition since parenthesises actually matters.
 *  We need to handle cases such as 2-3-5 = -6, where is would be 2-(3-5) = 4
 *  if not handled by recursive pattern matching.
 *
 *  Division is different than multiplication since we have to
 *  make sure the devisor is handled properly. Expressions such as
 *  10 / 5 * 3 needs to be handled as (10/5)*3.
 *  This is handled by recursive pattern matching.
 *  
 *  Notice that pattern matching is being used a lot here.
 *  The results from each level is built using it.
 */


expr(T) --> term(T).
% Pattern match on (term)+(expression)
expr(add(T,E)) --> term(T), [+], expr(E).

% Next level in the hierarchy.
% If T is just a normal term, go to the next level
sub(T) --> term(T).
% If T matches the pattern of the right side of a subtraction
sub(S) --> term(T), subr(T,S).
subr(X, sub(X, T)) --> [-], term(T).
% Recursive pattern matching for succesive subtractions (2,-,3,-5,....etc)
subr(X, S) --> [-], term(T), subr(sub(X,T), S).

% Mult is multiplicand
term(M) --> mult(M).
term(mult(M,T)) --> mult(M), [*], term(T).

% The multiplicand will be a single atom or division expression
mult(M) --> atom(M).
mult(Q) --> atom(M), divr(M, Q).
divr(M, div(M, Q)) --> [/], atom(Q).
divr(M, P) --> [/], atom(Q), divr(div(M,Q), P).

% An atom will simply be a number in the list
atom(M) --> [M], {number(M)}.
% Or it will be an expression within parenthesis.
% Parenthesis are given by [l,"...expression...",r]
% An expression within parentheses is an atom
atom(M) --> [l], expr(M), [r].

% This is given in the assignment for calculation the expressions
calc(add(X,Y), Z) :- calc(X,A), calc(Y,B), Z is A + B.
calc(sub(X,Y), Z) :- calc(X,A), calc(Y,B), Z is A - B.
calc(mult(X,Y), Z) :- calc(X,A), calc(Y,B), Z is A * B.
calc(div(X,Y), Z) :- calc(X,A), calc(Y,B), Z is A / B.
calc(X, X) :- number(X).



