export hs19

"HS19 model"
function hs19(args...; kwargs...)
  nlp = Model()
  x0 = [20.1, 5.84]
  lvar = [13, 0]
  uvar = [100, 100]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ uvar[i], start = x0[i])

  @constraint(nlp, (x[1] - 5)^2 + (x[2] - 5)^2 - 100 ≥ 0)
  @constraint(nlp, (x[2] - 5)^2 + (x[1] - 6)^2 - 82.81 ≤ 0)

  @objective(nlp, Min, (x[1] - 10)^3 + (x[2] - 20)^3)

  return nlp
end
