export hs240

"HS240 model"
function hs240(args...; kwargs...)
  nlp = Model()
  x0 = [100, -1, 2.5]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, (x[1] - x[2] + x[3])^2 + (-x[1] + x[2] + x[3])^2 + (x[1] + x[2] - x[3])^2)

  return nlp
end
