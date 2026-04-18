export hs21

"HS21 model"
function hs21(args...; kwargs...)
  nlp = Model()
  lvar = [2, -50]
  uvar = [50, 50]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = -1)

  @constraint(nlp, 10 * x[1] - x[2] - 10 ≥ 0)

  @objective(nlp, Min, 0.01 * x[1]^2 + x[2]^2 - 100)

  return nlp
end
