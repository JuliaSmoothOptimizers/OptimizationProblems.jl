# Sphere test function
#
# A simple multivariate convex optimization problem from the
# AMPGO test set.
#
# Problem Sphere in
# http://infinity77.net/global_optimization/test_functions_nd_S.html
# Andrea Gavana
#
# f(x) = sum(x_i^2)
#
# Global minimum: f(0,...,0) = 0
# Bounds: x_i in [-1, 1] for all i

export sphere

"Sphere convex minimization problem"
function sphere(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("sphere: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = [-1 + 2 * rand() for i = 1:n]
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(nlp, Min, sum(x[i]^2 for i = 1:n))

  return nlp
end
