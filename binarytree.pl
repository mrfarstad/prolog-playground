leaf(_).

isTree(leaf(X)) :- leaf(X).
isTree(tree(X,Y)) :- isTree(X), isTree(Y).

swap(X, Y, tree(X, Y)) :- isTree(X), isTree(Y).
