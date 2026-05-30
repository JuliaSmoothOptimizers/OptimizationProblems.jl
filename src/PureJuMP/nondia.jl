export nondia

function nondia(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("nondia", n_orig, n)

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = -1.0)

  @objective(nlp, Min, (x[1] - 1.0)^2 + 100 * sum((x[1] - x[i]^2)^2 for i = 2:n))

  return nlp
end
