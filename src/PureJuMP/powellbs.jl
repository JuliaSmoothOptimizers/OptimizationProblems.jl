#   Source: problem 3 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

# See also  Toint#34, Buckley#22 (p. 82).

# classification NOR2-AN-2-2

export powellbs

function powellbs(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x1, start = 0)
  @variable(nlp, x2, start = 1)
  @NLobjective(nlp, Min, 1 / 2 * ((10^(4) * x1 * x2 - 1)^2 + (exp(-x1) + exp(-x2) - 1.0001)^2))
  return nlp
end
