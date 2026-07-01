export hs29

"HS29 model"
function hs29(args...; kwargs...)
  nlp = Model()
  lvar = [-Inf, -Inf, -Inf]
  uvar = [Inf, Inf, Inf]
  @variable(nlp, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = 1)

  @constraint(nlp, x[1]^2 + 2 * x[2]^2 + 4 * x[3]^2 - 48 ≤ 0)

  @objective(nlp, Min, -x[1] * x[2] * x[3])

  return nlp
end
