#   A penalty function arising from
#   min{ sum_1^n(x_i-1)^2 subject to sum_1^n x_i^2 = 1/4}.
#   At the solution, the hessian has n-1 eigenvalues of order 1e-5 and
#   one of order 1.
#
#   Source: problem 23 in
#      J.J. More, B.S. Garbow and K.E. Hillstrom,
#      "Testing Unconstrained Optimization Software",
#      ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley #181 (p. 79)
#
#   classification SUR2-AN-V-0

export penalty1

"Linear function with `n` parameters and `m` observations  - full rank"
function penalty1(args...; n::Int = default_nvar, kwargs...)
  a = sqrt(1e-5)

  nlp = Model()

  @variable(nlp, x[j = 1:n])
  set_start_value.(x, [j for j = 1:n])

  @NLobjective(
    nlp,
    Min,
    1 / 2 * sum((a * (x[i] - 1))^2 for i = 1:n) + 1 / 2 * (sum(x[j]^2 for j = 1:n) - 1 / 4)^2
  )

  return nlp
end
