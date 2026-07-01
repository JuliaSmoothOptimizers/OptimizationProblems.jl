export hs17

"HS17 model"
function hs17(args...; kwargs...)
  nlp = Model()
  x0 = [-2, 1]
  lvar = [-0.5, -Inf]
  uvar = [0.5, 1]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  @constraint(nlp, -x[1] + x[2]^2 ≥ 0)

  @constraint(nlp, x[1]^2 - x[2] ≥ 0)

  return nlp
end
