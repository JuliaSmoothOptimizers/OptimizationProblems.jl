export hs18

"HS18 model"
function hs18(args...; kwargs...)
  nlp = Model()
  lvar = [2, 0]
  @variable(nlp, lvar[i] ≤ x[i = 1:2] ≤ 50, start = 2)

  @objective(nlp, Min, x[1]^2 / 100 + x[2]^2)

  @constraint(nlp, x[1] * x[2] ≥ 25)

  @constraint(nlp, x[1]^2 + x[2]^2 ≥ 25)

  return nlp
end
