export hs40

"HS40 model"
function hs40(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:4], start = 0.8)

  @objective(nlp, Min, -x[1] * x[2] * x[3] * x[4])

  @constraint(nlp, x[1]^3 + x[2]^2 - 1 == 0)

  @constraint(nlp, x[4] * x[1]^2 - x[3] == 0)

  @constraint(nlp, x[4]^2 - x[2] == 0)

  return nlp
end
