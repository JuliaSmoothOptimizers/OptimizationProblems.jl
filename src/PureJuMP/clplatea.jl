export clplatea

"The clamped plate problem (Strang, Nocedal, Dax)."
function clplatea(args...; n::Int = default_nvar, wght::Float64 = -0.1, kwargs...)
  n_org = n
  p = floor(Int, sqrt(n))
  n = p * p
  @adjust_nvar_warn("clplatea", n_org, n)

  nlp = Model()

  @variable(nlp, x[i = 1:p, j = 1:p], start = 0.0)

  hp2 = 0.5 * p^2

  @objective(
    nlp,
    Min,
    (wght * x[p, p]) +
    sum(
      sum(0.5 * (x[i, j] - x[i, j - 1])^2 + hp2 * (x[i, j] - x[i, j - 1])^4 for j = 2:p) for i = 2:p
    ) +
    sum(0.5 * (x[2, j])^2 + hp2 * (x[2, j])^4 for j = 2:p) +
    sum(
      sum(0.5 * (x[i, j] - x[i - 1, j])^2 + hp2 * (x[i, j] - x[i - 1, j])^4 for j = 2:p) for i = 3:p
    )
  )

  return nlp
end
