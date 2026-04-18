export indef_mod

function indef_mod(args...; n::Int = default_nvar, kwargs...)
  n < 3 && @warn("indef_mod: number of variables must be ≥ 4")
  n = max(3, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = i / (n + 1))

  @objective(
    nlp,
    Min,
    100.0 * sum(sin(x[i] / 100.0) for i = 1:n) +
    0.5 * sum(cos(2.0 * x[i] - x[n] - x[1]) for i = 2:(n - 1))
  )

  return nlp
end
