export powellbs

function powellbs(args...; kwargs...)
  nlp = Model()
  @variable(nlp, x1, start = 0)
  @variable(nlp, x2, start = 1)
  @objective(nlp, Min, 1 / 2 * ((10^(4) * x1 * x2 - 1)^2 + (exp(-x1) + exp(-x2) - 1.0001)^2))
  return nlp
end
