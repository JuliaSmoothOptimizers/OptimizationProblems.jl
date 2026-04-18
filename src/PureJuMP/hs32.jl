export hs32

"HS32 model"
function hs32(args...; kwargs...)
  nlp = Model()
  x0 = [0.1, 0.7, 0.2]
  @variable(nlp, x[i = 1:3] ≥ 0, start = x0[i])

  @constraint(nlp, 6 * x[2] + 4 * x[3] - x[1]^3 - 3 ≥ 0)
  @constraint(nlp, -1 + x[1] + x[2] + x[3] == 0)

  @objective(nlp, Min, (x[1] + 3 * x[2] + x[3])^2 + 4 * (x[1] - x[2])^2)

  return nlp
end
