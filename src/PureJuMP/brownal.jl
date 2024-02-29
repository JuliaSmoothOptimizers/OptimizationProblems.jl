#   The Brown almost linear problem in variable dimension.  This is a nonlinear
#   least-squares problems with n groups.
#
#   Source: Problem 27 in
#      J.J. More', B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#   Alsso problem 79 in 
#      A.R. Buckley,
#      "Test functions for unconstrained minimization",
#      TR 1989CS-3, Mathematics, statistics and computing centre,
#      Dalhousie University, Halifax (CDN), 1989.
#
export brownal

"Brownbs Model"
function brownal(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1 / 2)

  @objective(
    nlp,
    Min,
    0.5 * sum((x[i] + sum(x[j] for j = 1:n) - (n + 1))^2 for i = 1:(n - 1)) +
    0.5 * (prod(x[j] for j = 1:n) - 1)^2
  )

  return nlp
end
