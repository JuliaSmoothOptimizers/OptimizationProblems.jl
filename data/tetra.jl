xe = [
  0 0 0
  1 0 0
  0 1 0
  0 0 1
  0.5 0.2 0.1 
];

Tets = [
  1 2 3 5
  5 4 3 1
  5 4 1 2
  5 2 3 4
];

Tets = vec(reshape(Tets, 16, 1));
xe = vec(reshape(xe, 15, 1));
Constants = [1, 2, 3, 4];