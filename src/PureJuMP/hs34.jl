export hs34

"HS34 model"
function hs34(args...; kwargs...)
  nlp = Model()
  x0 = [0, 1.05, 2.9]
  uvar = [100, 100, 10]
  @variable(nlp, 0 ≤ x[i = 1:3] ≤ uvar[i], start = x0[i])

  @constraint(nlp, x[2] - exp(x[1]) ≥ 0)
  @constraint(nlp, x[3] - exp(x[2]) ≥ 0)

  @objective(nlp, Min, -x[1])

  return nlp
end
