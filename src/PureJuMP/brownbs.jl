export brownbs

"Brownbs Model"
function brownbs(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x[i = 1:2], start = 1.0)

  @objective(nlp, Min, 0.5 * (x[1] - 1e6)^2 + 0.5 * (x[2] - 2 * 1e-6)^2 + 0.5 * (x[1] * x[2] - 2)^2)

  return nlp
end
