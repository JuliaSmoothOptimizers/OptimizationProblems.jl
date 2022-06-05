xe = [
  0 0 0
  1 0 0
  0 1 0
  0 0 1
  0.64 0.25 0.5 
];

Tets = [
  1 2 3 5
  5 3 4 1
  5 4 1 2
  5 2 3 4
];

Tets = vec(reshape(Tets, 16, 1));
xe = vec(reshape(xe, 15, 1));
Constants = [1, 2, 3, 4];