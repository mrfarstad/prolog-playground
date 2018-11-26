:- use_module(library(clpfd)).

field(X, Y, Area) :-
  X in 90..110,
  Y in 48..53,
  Area #> 0,
  Area #= X*Y.

rectangle(X, Y) :-
  X in 1..9, Y in 1..9,
  X*Y #= 24, X+Y #= 10, X #=< Y.

factorial(0,1).
factorial(Number, Factorial) :-
    Number #> 0,
    NextNumber #= Number - 1,
    Factorial #= Number * NextNumberFactorial,
    Factorial #\= 0,
    factorial(NextNumber, NextNumberFactorial).

sum(0, []).
sum(Total, [Head|Tail]) :-
  Total #= Head + TailTotal,
  sum(TailTotal, Tail).

simple_payment(Sum, Ones, Fives, Tens, Twenties) :-
  Ones in 0..11,
  Fives in 0..4,
  Tens in 0..3,
  Twenties in 0..2,
  Sum #= 20*Twenties + 10*Tens + 5*Fives + Ones.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


payment(0, []).
payment(Total, [coin(Coin,Value,Available)|Tail]) :-
  Value #> 0,
  Amount #>= 0,
  Amount #=< Available,
  Coin #= Amount,
  Total #= Value*Amount + TotalTail,
  payment(TotalTail, Tail).


% payment(25, [coin(Ones,1,11),coin(Fives,5,4),coin(Tens,10,3),coin(Twenties,20,2)]), label([Ones, Fives, Tens, Twenties]).
