#
#   The Chebyshev quadrature problem in variable dimension, using the
#   exact formula for the shifted Chebyshev polynomials.  This is a
#   nonlinear least-squares problem with n groups. The Hessian is full.
#
#   Source: Problem 35 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 58 in 
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
#   classification SBR2-AN-V-0
export chebyquad
function chebyquad(args...; n::Int = default_nvar, m::Int = n, kwargs...)
  m = max(m, n)
  nlp = Model()
  x0 = [j/(n + 1) for j = 1:n]
  @variable(nlp, x[j = 1:n], start = x0[j])
  # Chebyshev polynomial of the first kind, using explicit expression
  @NLobjective(
    nlp,
    Min,
    0.5 * sum(
      (
        1 / n * sum(
          ifelse(
            2 * x[j] - 1 ≥ 1,
            cosh(2i * acosh(2 * x[j] - 1)),
            ifelse(
              2 * x[j] - 1 ≤ -1,
              (-1)^(2i) * cosh(2i * acosh(1 - 2 * x[j])),
              cos(2i * acos(2 * x[j] - 1)),
            ),
          ) for j = 1:n
        ) + 1 / ((2i)^2 - 1)
      )^2 for i = 1:div(m, 2)
    ) +
    0.5 * sum(
      (
        1 / n * sum(
          ifelse(
            2 * x[j] - 1 ≥ 1,
            cosh((2i - 1) * acosh(2 * x[j] - 1)),
            ifelse(
              2 * x[j] - 1 ≤ -1,
              (-1)^(2i - 1) * cosh((2i - 1) * acosh(1 - 2 * x[j])),
              cos((2i - 1) * acos(2 * x[j] - 1)),
            ),
          ) for j = 1:n
        )
      )^2 for i = 1:div(m + 1, 2)
    )
  )
  return nlp
end
