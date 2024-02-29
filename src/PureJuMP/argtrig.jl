#
#   Variable dimension trigonometric problem
#   This problem is a sum of n least-squares groups, each of
#   which has n+1 nonlinear elements.  Its Hessian matrix is dense.
#
#   Source: problem 26 in
#      J.J. More, B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 101 in
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
#   classification NOR2-AN-V-V

export argtrig

"Linear function with `n` parameters and `m` observations  - full rank"
function argtrig(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  m < n && @warn("argtrig: must have m ≥ n")
  m = max(m, n)

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1 / n)

  @objective(nlp, Min, n - sum(cos(x[j]) + j * (1 - cos(x[j])) - sin(x[j]) for j = 1:n))

  return nlp
end
