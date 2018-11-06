byCar(auckland,hamilton).
byCar(hamilton,raglan).
byCar(valmont,saarbruecken).
byCar(valmont,metz).

byTrain(metz,frankfurt).
byTrain(saarbruecken,frankfurt).
byTrain(metz,paris).
byTrain(saarbruecken,paris).

byPlane(frankfurt,bangkok).
byPlane(frankfurt,singapore).
byPlane(paris,losAngeles).
byPlane(bangkok,auckland).
byPlane(singapore,auckland).
byPlane(losAngeles,auckland).

/*

TASK 3.4.3

travel(X, Y, go(X, Y)) :-
  byCar(X, Y);
  byTrain(X, Y);
  byPlane(X, Y).
*/

/*
TASK 3.4.4
*/

travel(X, Y, byCar(X,Y)) :-
  byCar(X, Y).

travel(X, Y, byTrain(X,Y)) :-
  byTrain(X, Y).

travel(X, Y, byPlane(X,Y)) :-
  byPlane(X, Y).

travel(X, Y, go(R, Q)) :-
  travel(X, Z, R),
  travel(Z, Y, Q).

