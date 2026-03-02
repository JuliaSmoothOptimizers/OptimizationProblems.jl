# Rastrigin test function
#
# A multivariate highly multimodal optimization problem from the
# AMPGO test set.
#
# Problem Rastrigin in
# http://infinity77.net/global_optimization/test_functions_nd_R.html
# Andrea Gavana
#
# f(x) = 10*n + sum(x_i^2 - 10*cos(2*pi*x_i))
#
# Global minimum: f(0,...,0) = 0
# Bounds: x_i in [-5.12, 5.12] for all i

export rastrigin

"Rastrigin multimodal minimization problem"
function rastrigin(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("rastrigin: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = [-5.12 + 10.24 * rand() for i = 1:n]
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(nlp, Min, 10 * n + sum(x[i]^2 - 10 * cos(2 * π * x[i]) for i = 1:n))

  return nlp
end
