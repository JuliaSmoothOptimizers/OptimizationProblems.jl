export sphere

"Sphere convex minimization problem"
function sphere(args...; n::Int = default_nvar, kwargs...)
  n < 1 && @warn("sphere: number of variables must be ≥ 1")
  n = max(1, n)

  nlp = Model()

  x0 = zeros(n)
  @variable(nlp, -1 <= x[i = 1:n] <= 1, start = x0[i])

  @objective(nlp, Min, sum(x[i]^2 for i = 1:n))

  return nlp
end
