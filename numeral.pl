/*
 * This is the correct implementation
 */

numeral(0).
numeral(succ(X)) :- numeral(X).

/*
 * Incorrect implementation
 *
 
Note to self:

This will have normal behavior except when you query
numeral(X).
This query will cause the program to loop infinitely
since Prolog uses a top down approuch when searching
for numeral predicates.

numeral(succ(X)) :- numeral(X).
numeral(0).
 */
