export hs33

"HS33 model"
function hs33(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0, 3]
  uvar = [Inf, Inf, 5]
  @variable(nlp, 0 ≤ x[i = 1:3] ≤ uvar[i], start = x0[i])

  @constraint(nlp, -x[3]^2 + x[2]^2 + x[1]^2 ≤ 0)
  @constraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 - 4 ≥ 0)

  @objective(nlp, Min, (x[1] - 1) * (x[1] - 2) * (x[1] - 3) + x[3])

  return nlp
end
