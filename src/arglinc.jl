#   Linear function - rank 1, zero columns and rows
#
#   Source: Problem 34 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
#
#   See also Buckley#101 (with different N and M)
#
#   classification SUR2-AN-V-0

export arglinc

"Linear function with `n` parameters and `m` observations - rank 1, zero columns and rows"
function arglinc(n::Int=10, m::Int=20)

  m < n && Compat.@warn("arglinc: must have m ≥ n")
  m = max(m, n)

  nlp = Model()

  @variable(nlp, x[j=1:n], start=1.0)

  @NLobjective(
    nlp,
    Min,
    2 + sum(((i-1) * sum(j * x[j] for j = 2:n-1) - 1)^2 for i = 2:m-1)
  )

  return nlp
end
