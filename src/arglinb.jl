#   Linear function - rank 1
#
#   Source: Problem 33 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#93 (with different N and M)
#
#   classification SUR2-AN-V-0

export arglinb

"Linear function with `n` parameters and `m` observations - rank 1"
function arglinb(n::Int=10, m::Int=20)

  m < n && Compat.@warn("arglinb: must have m ≥ n")
  m = max(m, n)

  nlp = Model()

  @variable(nlp, x[j=1:n], start=1.0)

  @NLobjective(
    nlp,
    Min,
    sum((i * sum(j * x[j] for j = 1:n) - 1)^2 for i = 1:m)
  )

  return nlp
end
