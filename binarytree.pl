leaf(_).

isTree(leaf(_)) :- leaf(_).
isTree(tree(X,Y)) :- isTree(X), isTree(Y).

swap(X, Y, tree(X, Y)) :- isTree(X), isTree(Y).
