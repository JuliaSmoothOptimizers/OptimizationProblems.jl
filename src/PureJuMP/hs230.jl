export hs230

"HS230 model"
function hs230(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[2])
  @constraint(nlp, -2 * x[1]^2 + x[1]^3 + x[2] >= 0)
  @constraint(nlp, -2 * (1 - x[1])^2 + (1 - x[1])^3 + x[2] >= 0)

  return nlp
end
