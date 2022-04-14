#   Source: problem 12 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   Source: Problem 12 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#BOX663
#   SIF input: Ph. Toint, Dec 1989.

#   classification SUR2-AN-3-0
export BOX3

function BOX3(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  m < 3 && @warn("BOX3: must have m ≥ 3")
  m = max(m, 3)

  nlp = Model()

  x0 = [0.0; 10.0; 20.0]
  @variable(nlp, x[i=1:3], start = x0[i])

  @NLobjective(
  nlp,
  Min,
  0.5*sum((exp(-0.1*j*x[1]) - exp(-0.1*j*x[2]) -x[3]*(exp(-0.1*j) - exp(-j)))^2 for j = 1:m))

  return nlp
end

