#   Bard problem in 3 variables.
#   This function is a nonlinear least squares with 15 groups.
#   Each group has a linear and a nonlinear element.
#
#   Source: Problem 3 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#16
#
#   classification SUR2-AN-3-0

export bard

"Linear function with `n` parameters and `m` observations  - full rank"
function bard(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  y = Rational{Int}[0.14 0.18 0.22 0.25 0.29 0.32 0.35 0.39 0.37 0.58 0.73 0.16 1.34 2.10 4.39 ];
  nlp = Model()

  @variable(nlp, x[j = 1:3], start = 1.0)

  @NLobjective(
    nlp,
    Min,
    1 // 2 * sum(y[i] - (x[1] + i / ((16 - i) * x[2] + min(i, 16 - i) * x[3])) for i = 1:15)
  )

  return nlp
end
