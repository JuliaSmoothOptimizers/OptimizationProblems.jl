#   Source: problem 7 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

export helical

function helical(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()
  x0 = [-1.0; 0.0; 0.0]
  @variable(nlp, x[i = 1:3], start = x0[i])
  @objective(
    nlp,
    Min,
    (10 * (x[3] - 10 * (atan(x[2] / x[1]) - 0.25 * (x[1] - abs(x[1]) / x[1])) / (2 * pi)))^2 +
    (10 * (sqrt(x[1]^2 + x[2]^2) - 1))^2 +
    x[3]^2
  )
  return nlp
end
