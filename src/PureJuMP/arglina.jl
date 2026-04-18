export arglina

"Linear function with `n` parameters and `m` observations  - full rank"
function arglina(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  m < n && @warn("arglina: must have m ≥ n")
  m = max(m, n)

  nlp = Model()

  @variable(nlp, x[j = 1:n], start = 1.0)

  @objective(
    nlp,
    Min,
    0.5 * sum((x[i] - 2 / m * sum(x[j] for j = 1:n) - 1)^2 for i = 1:n) +
    0.5 * sum((-2 / m * sum(x[j] for j = 1:n) - 1)^2 for i = (n + 1):m)
  )

  return nlp
end
