export extrosnb

function extrosnb(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("extrosnb: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0) # Strange to start at the solution?

  @objective(nlp, Min, 100.0 * sum((x[i] - x[i - 1]^2)^2 for i = 2:n) + (1.0 - x[1])^2)

  return nlp
end
