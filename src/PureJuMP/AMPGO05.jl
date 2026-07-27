export AMPGO05

"Univariate multimodal minimization problem AMPGO05"
function AMPGO05(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, -(1.4 - 3.0 * x) * sin(18.0 * x))

  return nlp
end
