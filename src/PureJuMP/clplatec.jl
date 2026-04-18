export clplatec

"The clamped plate problem (Strang, Nocedal, Dax)."
function clplatec(
  args...;
  n::Int = default_nvar,
  wght::Float64 = -0.1,
  r::Float64 = 0.99,
  l::Float64 = 0.01,
  kwargs...,
)
  p = floor(Int, sqrt(n))
  p * p != n && @warn("clplatec: number of variables adjusted from $n down to $(p*p)")
  n = p * p

  nlp = Model()

  @variable(nlp, x[i = 1:p, j = 1:p], start = 0.0)

  hp2 = 0.5 * p^2
  wr = wght * r
  wl = wght * l

  @objective(
    nlp,
    Min,
    wr * x[p, p] +
    wl * x[p, 1] +
    sum(sum(hp2 * (x[i, j] - x[i, j - 1])^2 + (x[i, j] - x[i, j - 1])^4 for j = 2:p) for i = 2:p) +
    sum(sum(0.5 * (x[i, j] - x[i - 1, j])^2 + (x[i, j] - x[i - 1, j])^4 for j = 2:p) for i = 3:p) +
    sum(0.5 * (x[2, j])^2 + (x[2, j])^4 for j = 2:p)
  )

  return nlp
end
