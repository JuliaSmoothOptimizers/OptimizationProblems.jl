#   Broyden tridiagonal problem in variable dimension.  This is a nonlinear
#   least-squares problem with n groups.
#
#   Source: Problem 30 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Also problem 78 in 
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
export broyden3d

function broyden3d(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0)

  @NLobjective(
    nlp,
    Min,
    0.5 * sum(((3 - 2 * x[i]) * x[i] - x[i - 1] - 2 * x[i + 1] + 1)^2 for i = 2:(n - 1)) +
    0.5 * ((3 - 2 * x[1]) * x[1] - 2 * x[2] + 1)^2 +
    0.5 * ((3 - 2 * x[n]) * x[n] - x[n - 1] + 1)^2
  )

  return nlp
end
