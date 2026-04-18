export AMPGO06

"Univariate multimodal minimization problem AMPGO06"
function AMPGO06(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -10.0)

  @objective(nlp, Min, -(x + sin(x)) * exp(-x^2))

  return nlp
end
