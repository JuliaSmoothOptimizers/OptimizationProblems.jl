export Shpak4

"Univariate multimodal minimization problem Shpak4"
function Shpak4(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = -1.0)

  @objective(nlp, Min, (x + sin(x)) * exp(-(x)^2))

  return nlp
end
