export fletchcr

function fletchcr(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("fletchcr", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0.0)

  @objective(nlp, Min, 100.0 * sum((x[i + 1] - x[i] + 1 - x[i]^2)^2 for i = 1:(n - 1)))

  return nlp
end
