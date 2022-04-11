#   Source: problem 6 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

export jennrichsampson

function jennrichsampson(args...; n::Int = default_nvar, m::Int = 10, kwargs...)
  nlp = Model()
  @variable(nlp, x1)
  set_start_value(x1, 0.3)
  @variable(nlp, x2)
  set_start_value(x2, 0.4)
  @NLobjective(nlp, Min, sum((2 + 2 * i - (exp(i * x1) + exp(i * x2)))^2 for i = 1:m))

  return nlp
end
