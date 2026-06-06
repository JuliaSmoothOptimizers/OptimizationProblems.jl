export edensch

"Extended Dennis-Schnabel model in size `n`"
function edensch(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("edensch", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 0)

  @objective(
    nlp,
    Min,
    16 +
    sum((x[i] - 2)^4 + (x[i] * x[i + 1] - 2 * x[i + 1])^2 + (x[i + 1] + 1)^2 for i = 1:(n - 1))
  )

  return nlp
end
