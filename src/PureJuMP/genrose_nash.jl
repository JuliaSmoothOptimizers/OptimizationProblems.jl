export genrose_nash

"Nash's variant of `genrose()` in size `n`"
function genrose_nash(args...; n::Int = default_nvar, kwargs...)
  n < 2 && @warn("genrose_nash: number of variables must be ≥ 2")
  n = max(2, n)

  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (i / (n + 1)))

  @objective(
    nlp,
    Min,
    1.0 + 100 * sum((x[i] - x[i - 1]^2)^2 for i = 2:n) + sum((1.0 - x[i])^2 for i = 2:n)
  )

  return nlp
end
