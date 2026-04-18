export hs31

"HS31 model"
function hs31(args...; kwargs...)
  nlp = Model()
  lvar = [-10, 1, -10]
  uvar = [10, 10, 1]
  @variable(nlp, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = 1)

  @constraint(nlp, x[1] * x[2] - 1 ≥ 0)

  @objective(nlp, Min, 9 * x[1]^2 + x[2]^2 + 9 * x[3]^2)

  return nlp
end
