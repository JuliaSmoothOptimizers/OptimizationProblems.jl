#   Linear function - full rank
#
#   Source: problem 9 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#80 (with different N and M)
#
#   classification SUR2-AN-V-0

export gaussian

"Linear function with `n` parameters and `m` observations  - full rank"
function gaussian(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  n = 3
  m = 15


  t(i)=(8-i)/2
  y = [0.0009, 0.0044, 0.0175, 0.054, 0.1295, 0.2420, 0.3521, 0.3989, 0.3521, 0.2420, 0.1295, 0.054, 0.0175, 0.0044, 0.0009]

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = [0.4, 1, 0])

  @NLobjective(
    nlp,
    Min,
    sum((x[1]*exp((-x[2]*(t(i)-x[3]^2))/2)-y[i])^2 for i = 1:m)
  )

  return nlp
end
