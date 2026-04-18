export hs44

"HS44 model"
function hs44(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:4] ≥ 0, start = 0)

  @constraint(nlp, -8 + x[1] + 2 * x[2] ≤ 0)
  @constraint(nlp, -12 + 4 * x[1] + x[2] ≤ 0)
  @constraint(nlp, -12 + 3 * x[1] + 4 * x[2] ≤ 0)
  @constraint(nlp, -8 + 2 * x[3] + x[4] ≤ 0)
  @constraint(nlp, -8 + x[3] + 2 * x[4] ≤ 0)
  @constraint(nlp, -5 + x[3] + x[4] ≤ 0)

  @objective(nlp, Min, x[1] - x[2] - x[3] - x[1] * x[3] + x[1] * x[4] + x[2] * x[3] - x[2] * x[4])

  return nlp
end
