#
#   Watson problem in varaible dimension ( 2 <= n <= 31 ).
#   This function is a nonlinear least squares with 31 groups. 
#
#   Source:  problem 20 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 128 (p. 100) in 
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
#   SUR2-AN-V-0

export watson

function watson(args...; n::Int = default_nvar, kwargs...)
  n = min(max(n, 2), 31)
  m = 31

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 0.0)

  @NLobjective(
    nlp,
    Min,
    0.5 * sum(
      (
        sum((j - 1) * x[j] * (i / 29)^(j - 2) for j = 2:n) -
        sum(x[j] * (i / 29)^(j - 1) for j = 1:n)^2 - 1
      )^2 for i = 1:29
    ) +
    0.5 *
    (
      sum((j - 1) * x[j] * x[1]^(j - 2) for j = 2:n) - sum(x[j] * x[1]^(j - 1) for j = 1:n)^2 - 1
    )^2 +
    0.5 * (
      sum((j - 1) * x[j] * (x[2] - x[1]^2 - 1)^(j - 2) for j = 2:n) -
      sum(x[j] * (x[2] - x[1]^2 - 1)^(j - 1) for j = 1:n)^2 - 1
    )
  )

  return nlp
end
