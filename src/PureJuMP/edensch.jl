export edensch

"Extended Dennis-Schnabel model in size `n`"
function edensch(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("edensch: number of variables must be ≥ 2")
  n = max(2, n)

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
