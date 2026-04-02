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
          (begin
            # Use shifted Chebyshev argument t = 2x - 1
            t = 2 * x[j] - 1
            ifelse(
              t ≥ 1,
              cosh(2i * acosh(t)),
              ifelse(
                t ≤ -1,
                (-1)^(2i) * cosh(2i * acosh(-t)),
                cos(2i * acos(t)),
              ),
            )
          end) for j = 1:n
        ) + 1 / ((2i)^2 - 1)
      )^2 for i = 1:Int(round(m / 2))
    ) +
    0.5 * sum(
      (
        1 / n * sum(
          (begin
            # Use shifted Chebyshev argument t = 2x - 1
            t = 2 * x[j] - 1
            ifelse(
              t ≥ 1,
              cosh((2i - 1) * acosh(t)),
              ifelse(
                t ≤ -1,
                (-1)^(2i - 1) * cosh((2i - 1) * acosh(-t)),
                cos((2i - 1) * acos(t)),
              ),
            )
          end) for j = 1:n
        )
      )^2 for i = 1:(Int(round(m / 2)) + mod(n, 2))
    )
  )
  return nlp
end
