export fletcbv2

function fletcbv2(args...; n::Int = default_nvar, kwargs...)
  n_orig = n
  n = max(2, n)
  @adjust_nvar_warn("fletcbv2", n_orig, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (i / (n + 1.0)))

  h = 1.0 / (n + 1)

  @objective(
    nlp,
    Min,
    0.5 * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
    h^2 * sum(2 * x[i] + cos(x[i]) for i = 1:n) - x[n]
  )

  return nlp
end
