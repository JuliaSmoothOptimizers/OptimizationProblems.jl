xe_tetra = [
  0 0 0
  1 0 0
  0 1 0
  0 0 1
  0.5 0.2 0.1
];

Tets_tetra = [
  1 2 3 5
  5 4 3 1
  5 4 1 2
  5 2 3 4
];

Tets_tetra = vec(reshape(Tets_tetra, 16, 1));
xe_tetra = vec(reshape(xe_tetra, 15, 1));
Constants_tetra = [1, 2, 3, 4];
