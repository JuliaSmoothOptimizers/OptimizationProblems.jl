#   Source:  Problem 15 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   classification SUR2-MN-4-0
export kowosb

function kowosb(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  x0 = [0.25, 0.39, 0.415, 0.39]
  @variable(nlp, x[i = 1:4], start = x0[i])

  m = 11
  y = [0.1957, 0.1947, 0.1735, 0.1600, 0.0844, 0.0627, 0.0456, 0.0342, 0.0323, 0.0235, 0.0246]
  u = [4, 2, 1, 0.5, 0.25, 0.167, 0.125, 0.1, 0.833, 0.0714, 0.0625]

  @NLobjective(
    nlp,
    Min,
    sum((y[i] - (x[1] * (u[i]^2 + u[i] * x[2])) / (u[i]^2 + u[i] * x[3] + x[4]))^2 for i = 1:m)
  )
  return nlp
end
