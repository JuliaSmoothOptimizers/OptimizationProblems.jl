export AMPGO02

"Univariate multimodal minimization problem AMPGO02"
function AMPGO02(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 2.7)

  @objective(nlp, Min, sin(x) + sin((10.0 / 3.0) * x))

  return nlp
end
