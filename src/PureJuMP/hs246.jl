export hs246

"HS246 model"
function hs246(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2; 2; 0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, 100 * (x[3] - ((x[1] + x[2]) / 2)^2)^2 + (1 - x[1])^2 + (1 - x[2])^2)

  return nlp
end
