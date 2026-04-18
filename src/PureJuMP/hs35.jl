export hs35

"HS35 model"
function hs35(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:3] ≥ 0, start = 0.5)

  @constraint(nlp, -3 + x[1] + x[2] + 2 * x[3] ≤ 0)

  @objective(
    nlp,
    Min,
    9 - 8 * x[1] - 6 * x[2] - 4 * x[3] +
    2 * x[1]^2 +
    2 * x[2]^2 +
    x[3]^2 +
    2 * x[1] * x[2] +
    2 * x[1] * x[3]
  )

  return nlp
end
