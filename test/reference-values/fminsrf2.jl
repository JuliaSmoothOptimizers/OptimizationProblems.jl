# FMINSRF2.SIF (CUTEst), the minimum-surface problem on a p × p grid, n = p^2, with x[i + (j-1)p]
# the height at grid point (i, j). The starting point is the plane 1 + 8(i-1)/(p-1) + 4(j-1)/(p-1)
# on the boundary and zero inside. The objective is the discretized area of the surface over the
# unit square plus x(mid, mid)^2 / p^2, mid = p ÷ 2: the area is 1 for a flat surface and
# sqrt(1 + 8^2 + 4^2) = 9 for the plane above.
[
  (
    kwargs = (n = 16,),
    x0 = vec([
      1 7/3 11/3 5
      11/3 0 0 23/3
      19/3 0 0 31/3
      9 31/3 35/3 13
    ]),
    x = zeros(16),
    obj = 1,
    atol = 1e-12,
  ),
  (
    kwargs = (n = 16,),
    x = vec([1 + 8 * (i - 1) / 3 + 4 * (j - 1) / 3 for i = 1:4, j = 1:4]),
    obj = 9 + 5^2 / 16,
    atol = 1e-12,
  ),
]
