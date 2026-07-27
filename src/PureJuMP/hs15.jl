export hs15

"HS15 model"
function hs15(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 1]
  uvar = [0.5, Inf]
  @variable(nlp, x[i = 1:2] ≤ uvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  @constraint(nlp, x[1] * x[2] - 1 ≥ 0)

  @constraint(nlp, x[1] + x[2]^2 ≥ 0)

  return nlp
end
