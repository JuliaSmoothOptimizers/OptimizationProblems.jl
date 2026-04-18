export fletchcr

function fletchcr(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("fletchcr: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.0)

  @objective(nlp, Min, 100.0 * sum((x[i + 1] - x[i] + 1 - x[i]^2)^2 for i = 1:(n - 1)))

  return nlp
end
