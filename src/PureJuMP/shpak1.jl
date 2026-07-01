export Shpak1

"Univariate multimodal minimization problem Shpak1"
function Shpak1(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 2.7)

  @objective(nlp, Min, sin(x) + sin((10.0 / 3.0) * x))

  return nlp
end
