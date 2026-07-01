export errinros_mod

function errinros_mod(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("errinros_mod", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = -1.0)

  @objective(
    nlp,
    Min,
    0.5 * sum((x[i - 1] - 16.0 * x[i]^2 * (1.5 + sin(i))^2)^2 for i = 2:n) +
    0.5 * sum((1.0 - x[i])^2 for i = 2:n)
  )

  return nlp
end
