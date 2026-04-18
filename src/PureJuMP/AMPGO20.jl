export AMPGO20

"Univariate multimodal minimization problem AMPGO20"
function AMPGO20(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -10.0)

  @objective(nlp, Min, -(x - sin(x)) * exp(-x^2))

  return nlp
end
