#   The clamped plate problem (Strang, Nocedal, Dax).
#   The problem comes from the discretization the following problem
#   in mechanics:  a plate is clamped on one edge and loaded on the
#   opposite side.  The plate is the unit square.
#
#   In this version of the problem, part of the weight wght is put on the
#   upper right corner of the plate, and the rest on the upper left corner.
#
#   The plate is clamped on its lower edge, by fixing the
#   corresponding variables to zero.
#
#   Source:
#   J. Nocedal,
#   "Solving large nonlinear systems of equations arising in mechanics",
#   Proceedings of the Cocoyoc Numerical Analysis Conference, Mexico,
#   pp. 132-141, 1981.
#
#   classification OXR2-MN-V-0
#
#   p is the number of points in one side of the unit square
#   The number of variables is p*p, of which (p-1)*(p-1) are free.
#
#   Fixed variables have been eliminated from the objective function.

export clplatec

"The clamped plate problem (Strang, Nocedal, Dax)."
function clplatec(n::Int=5041,wght::Float64=-0.1,r::Float64=0.99,l::Float64=0.01)

  p = floor(Int, sqrt(n))
  p*p != n && Compat.@warn("clplatec: number of variables adjusted from $n down to $(p*p)")
  n = p * p

  nlp = Model()

  @variable(nlp, x[i=1:p,j=1:p], start=0.0)

  hp2 = 0.5 * p^2
  wr = wght * r
  wl = wght * l

  @NLobjective(
    nlp,
    Min,
    wr * x[p,p] + wl * x[p,1] + sum(sum(hp2 * (x[i,j] - x[i,j-1])^2 + (x[i,j] - x[i,j-1])^4 for j=2:p) for i=2:p) + sum(sum(0.5 * (x[i,j] - x[i-1,j])^2 + (x[i,j] - x[i-1,j])^4 for j=2:p) for i=3:p) + sum(0.5 * (x[2,j])^2 + (x[2,j])^4 for j=2:p)
  )

  return nlp

end
