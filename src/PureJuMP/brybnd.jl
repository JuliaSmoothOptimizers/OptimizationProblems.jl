export brybnd

"Broyden banded model in size `n`"
function brybnd(args...; n::Int = default_nvar, ml::Int = 5, mu::Int = 1, kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:n], start = (-1.0))

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        x[i] * (2 + 5 * x[i]^2) + 1 -
        sum(x[j] * (1 + x[j]) for j = max(1, i - ml):min(n, i + mu) if j != i)
      )^2 for i = 1:n
    )
  )

  return nlp
end
