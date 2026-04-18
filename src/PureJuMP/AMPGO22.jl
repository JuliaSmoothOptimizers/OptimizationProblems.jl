export AMPGO22

"Univariate multimodal minimization problem AMPGO22"
function AMPGO22(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.0)

  @objective(nlp, Min, exp(-3.0 * x) - sin(x)^3)

  return nlp
end
