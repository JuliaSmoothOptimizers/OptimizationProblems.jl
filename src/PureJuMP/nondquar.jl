export nondquar

function nondquar(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("nondquar: number of variables must be ≥ 2")
  n = max(2, n)

  x0 = ones(n)
  x0[2 * collect(1:div(n, 2))] .= -1.0

  nlp = Model()
  @variable(nlp, x[i = 1:n], start = x0[i])

  @objective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[n - 1] - x[n])^2 + sum((x[i] + x[i + 1] + x[n])^4 for i = 1:(n - 2))
  )

  return nlp
end
