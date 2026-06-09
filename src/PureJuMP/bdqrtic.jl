export bdqrtic

"Banded quartic model in size `n`"
function bdqrtic(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(5, n)
  @adjust_nvar_warn("bdqrtic", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = 1.0)

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (3 - 4 * x[i])^2 + (x[i]^2 + 2 * x[i + 1]^2 + 3 * x[i + 2]^2 + 4 * x[i + 3]^2 + 5 * x[n]^2)^2
      for i = 1:(n - 4)
    )
  )

  return nlp
end
