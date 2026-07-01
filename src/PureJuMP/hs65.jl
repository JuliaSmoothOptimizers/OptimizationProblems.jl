export hs65

"HS65 model"
function hs65(args...; kwargs...)
  nlp = Model()
  x0 = [-5, 5, 0]
  lvar = [-4.5, -4.5, -5]
  uvar = [4.5, 4.5, 5]
  @variable(nlp, lvar[i] ≤ x[i = 1:3] ≤ uvar[i], start = x0[i])

  @constraint(nlp, -48 + x[1]^2 + x[2]^2 + x[3]^2 ≤ 0)

  @objective(nlp, Min, (x[1] - x[2])^2 + ((x[1] + x[2] - 10)^2) / 9 + (x[3] - 5)^2)

  return nlp
end
