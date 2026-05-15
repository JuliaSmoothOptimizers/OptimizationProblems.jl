export hs112

"HS112 model"
function hs112(args...; kwargs...)
  nlp = Model()
  c = [-6.089, -17.164, -34.054, -5.914, -24.721, -14.986, -24.100, -10.708, -26.662, -22.179]
  @variable(nlp, x[i = 1:10] ≥ 1.0e-6, start = 0.1)

  @objective(nlp, Min, sum(x[j] * (c[j] + log(x[j] / (sum(x[k] for k = 1:10)))) for j = 1:10))

  @constraint(nlp, x[1] + 2 * x[2] + 2 * x[3] + x[6] + x[10] - 2 == 0)

  @constraint(nlp, x[4] + 2 * x[5] + x[6] + x[7] - 1 == 0)

  @constraint(nlp, x[3] + x[7] + x[8] + 2 * x[9] + x[10] - 1 == 0)

  return nlp
end
