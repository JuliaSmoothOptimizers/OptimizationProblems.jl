export AMPGO12

"Univariate multimodal minimization problem AMPGO12"
function AMPGO12(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, sin(x)^3 + cos(x)^3)

  return nlp
end
