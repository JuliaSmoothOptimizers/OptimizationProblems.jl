export bard

"Linear function with `n` parameters and `m` observations  - full rank"
function bard(args...; n::Int = default_nvar, m::Int = 2n, kwargs...)
  y = Rational{Int}[0.14 0.18 0.22 0.25 0.29 0.32 0.35 0.39 0.37 0.58 0.73 0.16 1.34 2.10 4.39]
  nlp = Model()

  @variable(nlp, x[j = 1:3], start = 1.0)

  @objective(
    nlp,
    Min,
    0.5 * sum((y[i] - (x[1] + i / ((16 - i) * x[2] + min(i, 16 - i) * x[3])))^2 for i = 1:15)
  )

  return nlp
end
