export hs77

"HS77 model"
function hs77(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x[i = 1:5], start = 2)

  @constraint(nlp, x[1]^2 * x[4] + sin(x[4] - x[5]) - 2 * sqrt(2) == 0)
  @constraint(nlp, x[2] + x[3]^4 * x[4]^2 - 8 - sqrt(2) == 0)

  @objective(nlp, Min, (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6)

  return nlp
end
