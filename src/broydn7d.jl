# A seven diagonal variant of the Broyden tridiagonal system,
# featuring a band far away from the diagonal.
#
#   Source:
#   Problem 3.4 in
#   Ph. L. Toint,
#   Some numerical results using a sparse matrix updating formula in
#   unconstrained optimization,
#   Mathematics of Computation, vol. 32(114), pp. 839-852, 1978.
#   http://dx.doi.org/10.1090/S0025-5718-1978-0483452-7
#
# From the paper,
#
#   "This function was built from a nonlinear system of equations
#   suggested originally by Broyden ..."
#
# The system in question is described in
#
#   L. K. Schubert,
#   Modification of a quasi-Newton method for nonlinear equations
#   with a sparse Jacobian,
#   Mathematics of Computation, vol. 24, pp. 27-30, 1970.
#   http://dx.doi.org/10.1090/S0025-5718-1970-0258276-9#sthash.yOkQUwXA.dpuf
#
# See also, with a slight variation in the formulation,
#
#   problem 3 in
#   L. Luksan, C. Matonoha and J. Vlcek
#   Modified CUTE problems for sparse unconstrained optimization,
#   Technical Report 1081,
#   Institute of Computer Science,
#   Academy of Science of the Czech Republic
#
#   http://www.cs.cas.cz/matonoha/download/V1081.pdf
#
#   See also Buckley#84
#
#   classification OUR2-AN-V-0
#
# D. Orban, Montreal, 08/2015.

export broydn7d

"Broyden 7-diagonal model in size `n`"
function broydn7d(n :: Int=100, p :: Float64=7/3)

  mod(n, 2) > 0 && Compat.@warn("broydn7d: number of variables adjusted to be even")
  n2 = max(1, div(n, 2))
  n  = 2 * n2

  nlp = Model()

  @variable(nlp, x[i=1:n], start=(-1.0))

  @NLobjective(
    nlp,
    Min,
    abs(1 - 2 * x[2] + (3 - x[1] / 2) * x[1])^p +
    sum(abs(1 - x[i-1] - 2 * x[i+1] + (3 - x[i] / 2) * x[i])^p for i=2:n-1) +
    abs(1 - x[n-1] + (3 - x[n] / 2) * x[n])^p +
    sum(abs(x[i] + x[i + n2])^p for i=1:n2)
  )

  return nlp
end
