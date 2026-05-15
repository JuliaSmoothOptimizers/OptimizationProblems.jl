export hs227

"HS227 model"
function hs227(args...; kwargs...)
  nlp = Model()
  x0 = [0.5, 0.5]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, (x[1] - 2)^2 + (x[2] - 1)^2)
  @constraint(nlp, -x[1]^2 + x[2] >= 0)
  @constraint(nlp, x[1] - x[2]^2 >= 0)

  return nlp
end
