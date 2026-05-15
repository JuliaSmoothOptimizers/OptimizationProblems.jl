export hs14

"HS14 model"
function hs14(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:2], start = 2)

  @constraint(nlp, 0.25 * x[1]^2 + x[2]^2 - 1 ≤ 0)

  @constraint(nlp, x[1] - 2 * x[2] + 1 == 0)

  @objective(nlp, Min, 0.5 * (x[1] - 2)^2 + 0.5 * (x[2] - 1)^2)

  return nlp
end
