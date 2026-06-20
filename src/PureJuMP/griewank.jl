# Griewank test function
#
# A multivariate multimodal optimization problem from the
# AMPGO test set.
#
# Problem Griewank in
# http://infinity77.net/global_optimization/test_functions_nd_G.html
# Andrea Gavana
#
# f(x) = sum(x_i^2)/4000 - prod(cos(x_i/sqrt(i))) + 1
#
# Global minimum: f(0,...,0) = 0
# Bounds: x_i in [-600, 600] for all i

export griewank

"Griewank multimodal minimization problem"
function griewank(args...; n::Int = default_nvar, x0::Union{Nothing,AbstractVector} = nothing, kwargs...)
  n < 1 && @warn("griewank: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  if x0 === nothing
    x0 = zeros(n)
  elseif length(x0) != n
    throw(ArgumentError("griewank: length(x0) = $(length(x0)) must equal n = $n"))
  end
  @variable(nlp, -600 <= x[i = 1:n] <= 600, start = x0[i])

  @objective(
    nlp,
    Min,
    sum(x[i]^2 for i = 1:n) / 4000 - prod(cos(x[i] / sqrt(i)) for i = 1:n) + 1
  )

  return nlp
end
