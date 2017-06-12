#   Variable dimension problem.
#   This problem is a sum of n+2 least-squares groups, the first n of
#   which have only a linear element.
#   It Hessian matrix is dense.
#
#   Source:  problem 25 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#72 (p.98).
#
#   classification  SUR2-AN-V-0

export vardim

"Variable dimension problem."
function vardim(n::Int=100)

  nlp = Model()

  @variable(nlp, x[i=1:n], start=(1 - i/n))

  @NLobjective(
    nlp,
    Min,
    sum((x[i] - 1)^2 for i=1:n) + (sum(i * (x[i] - 1) for i=1:n))^2 + (sum(i * (x[i] - 1) for i=1:n))^4
  )

  return nlp
end
