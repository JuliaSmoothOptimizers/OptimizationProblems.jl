export hs20

"HS20 model"
function hs20(args...; kwargs...)
  nlp = Model()
  x0 = [-2.0, 1.0]
  lvar = [-0.5, -Inf]
  uvar = [0.5, Inf]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = x0[i])

  @objective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)

  @constraint(nlp, x[1] + x[2]^2 ≥ 0)

  @constraint(nlp, x[1]^2 + x[2] ≥ 0)

  @constraint(nlp, x[1]^2 + x[2]^2 ≥ 1)

  return nlp
end
