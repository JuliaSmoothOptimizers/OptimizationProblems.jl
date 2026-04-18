export AMPGO10

"Univariate multimodal minimization problem AMPGO10"
function AMPGO10(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, -x * sin(x))

  return nlp
end
