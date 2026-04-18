export hs63

"HS63 model"
function hs63(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:3] ≥ 0, start = 2)

  @constraint(nlp, 8 * x[1] + 14 * x[2] + 7 * x[3] - 56 == 0)
  @constraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 - 25 == 0)

  @objective(nlp, Min, 1000 - x[1]^2 - 2 * x[2]^2 - x[3]^2 - x[1] * x[2] - x[1] * x[3])

  return nlp
end
