const _xe_tetra = [
  0 0 0
  1 0 0
  0 1 0
  0 0 1
  5//10 2//10 1//10
];

const _Tets_tetra = [
  1 2 3 5
  5 4 3 1
  5 4 1 2
  5 2 3 4
];

const Tets_tetra = vec(reshape(_Tets_tetra, 16, 1));
const xe_tetra = vec(reshape(_xe_tetra, 15, 1));
const Constants_tetra = [1, 2, 3, 4];
