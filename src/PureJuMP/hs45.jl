export hs45

"HS45 model"
function hs45(args...; kwargs...)
  nlp = Model()
  @variable(nlp, 0 ≤ x[i = 1:5] ≤ i, start = 2)

  @objective(nlp, Min, 2 - x[1] * x[2] * x[3] * x[4] * x[5] / 120)

  return nlp
end
