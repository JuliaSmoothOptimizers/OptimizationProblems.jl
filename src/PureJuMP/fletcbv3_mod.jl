export fletcbv3_mod

function fletcbv3_mod(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("fletchbv3_mod: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (i / (n + 1.0)))

  p = 10.0^(-8)
  h = 1.0 / (n + 1)

  @objective(
    nlp,
    Min,
    (p / 2.0) * (x[1]^2 + sum((x[i] - x[i + 1])^2 for i = 1:(n - 1)) + x[n]^2) -
    p * sum(100.0 * (1 + (2.0 / h^2)) * sin(x[i] / 100.0) + (1 / h^2) * cos(x[i]) for i = 1:n)
  )

  return nlp
end
