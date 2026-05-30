export liarwhd

function liarwhd(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("liarwhd", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 4.0)

  @objective(nlp, Min, sum(4.0 * (x[i]^2 - x[1])^2 + (x[i] - 1)^2 for i = 1:n))

  return nlp
end
