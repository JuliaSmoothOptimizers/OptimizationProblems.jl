export AMPGO14

"Univariate multimodal minimization problem AMPGO14"
function AMPGO14(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, -exp(-x) * sin(2 * pi * x))

  return nlp
end
