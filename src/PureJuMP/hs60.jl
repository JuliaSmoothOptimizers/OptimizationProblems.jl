export hs60

"HS60 model"
function hs60(args...; kwargs...)
  nlp = Model()
  @variable(nlp, -10 ≤ x[i = 1:3] ≤ 10, start = 2)

  @constraint(nlp, x[1] * (1 + x[2]^2) + x[3]^4 - 4 - 3 * sqrt(2) == 0)

  @objective(nlp, Min, (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[2] - x[3])^4)

  return nlp
end
