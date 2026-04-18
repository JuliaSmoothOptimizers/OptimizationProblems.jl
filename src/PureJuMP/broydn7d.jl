export broydn7d

"Broyden 7-diagonal model in size `n`"
function broydn7d(args...; n::Int = default_nvar, p::Float64 = 7 / 3, kwargs...)
  mod(n, 2) > 0 && @warn("broydn7d: number of variables adjusted to be even")
  n2 = max(1, div(n, 2))
  n = 2 * n2

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (-1.0))

  @objective(
    nlp,
    Min,
    abs(1 - 2 * x[2] + (3 - x[1] / 2) * x[1])^p +
    sum(abs(1 - x[i - 1] - 2 * x[i + 1] + (3 - x[i] / 2) * x[i])^p for i = 2:(n - 1)) +
    abs(1 - x[n - 1] + (3 - x[n] / 2) * x[n])^p +
    sum(abs(x[i] + x[i + n2])^p for i = 1:n2)
  )

  return nlp
end
