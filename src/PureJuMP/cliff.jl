export cliff

"The 'cliff problem' in 2 variables"
function cliff(args...; kwargs...)
  nlp = Model()

  x0 = [0.0, -1]

  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, (0.01 * x[1] - 0.03)^2 - x[1] + x[2] + exp(20 * (x[1] - x[2])))

  return nlp
end
