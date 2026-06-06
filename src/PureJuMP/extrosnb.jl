export extrosnb

function extrosnb(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("extrosnb", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0) # Strange to start at the solution?

  @objective(nlp, Min, 100.0 * sum((x[i] - x[i - 1]^2)^2 for i = 2:n) + (1.0 - x[1])^2)

  return nlp
end
