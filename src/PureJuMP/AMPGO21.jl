export AMPGO21

"Univariate multimodal minimization problem AMPGO21"
function AMPGO21(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, (x * sin(x)) + (x * cos(2 * x)))

  return nlp
end
