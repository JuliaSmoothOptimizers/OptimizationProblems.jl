export freuroth

function freuroth(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("freuroth: number of variables must be ≥ 2")
  n = max(2, n)

  ngs = n - 1
  x0 = zeros(n)
  x0[1] = 0.5
  x0[2] = -2.0

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    0.5 * sum(((5.0 - x[i + 1]) * x[i + 1]^2 + x[i] - 2 * x[i + 1] - 13.0)^2 for i = 1:ngs) +
    0.5 * sum(((1.0 + x[i + 1]) * x[i + 1]^2 + x[i] - 14 * x[i + 1] - 29.0)^2 for i = 1:ngs)
  )

  return nlp
end
