export hs254

"HS254 model"
function hs254(args...; kwargs...)
  nlp = Model()
  x0 = [1, 1, 1]
  lvar = [-Inf, -Inf, 1]
  @variable(nlp, x[i = 1:3] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, log(x[3]) - x[2])
  @constraint(nlp, x[2]^2 + x[3]^2 - 4 == 0)
  @constraint(nlp, x[3] - 1 - x[2]^2 == 0)

  return nlp
end
