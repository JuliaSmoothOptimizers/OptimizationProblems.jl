# Ackley test function
#
# A multivariate multimodal optimization problem from the
# AMPGO test set.
#
# Problem Ackley in
# http://infinity77.net/global_optimization/test_functions_nd_A.html
# Andrea Gavana
#
# f(x) = -20*exp(-0.2*sqrt(sum(x_i^2)/n)) - exp(sum(cos(2*pi*x_i))/n) + 20 + e
#
# Global minimum: f(0,...,0) = 0
# Bounds: x_i in [-32, 32] for all i

export ackley

"Ackley multimodal minimization problem"
function ackley(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("ackley: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = [-32 + 64 * rand() for i = 1:n]
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    -20 * exp(-0.2 * sqrt(sum(x[i]^2 for i = 1:n) / n)) -
    exp(sum(cos(2 * π * x[i]) for i = 1:n) / n) +
    20 +
    exp(1)
  )

  return nlp
end
