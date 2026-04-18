export hs13

"HS13 model"
function hs13(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2] ≥ 0, start = -2)

  @objective(nlp, Min, 0.5 * (x[1] - 2)^2 + 0.5 * x[2]^2)

  @constraint(nlp, (1 - x[1])^3 ≥ x[2])

  return nlp
end
