export AMPGO04

"Univariate multimodal minimization problem AMPGO04"
function AMPGO04(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 1.9)

  @objective(nlp, Min, -(16 * x^2 - 24 * x + 5) * exp(-x))

  return nlp
end
