export AMPGO09

"Univariate multimodal minimization problem AMPGO09"
function AMPGO09(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 3.1)

  @objective(nlp, Min, sin(x) + sin((2.0 / 3.0) * x))

  return nlp
end
