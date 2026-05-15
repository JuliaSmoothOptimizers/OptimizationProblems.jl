export Shpak2

"Univariate multimodal minimization problem Shpak2"
function Shpak2(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 3.1)

  @objective(nlp, Min, sin(x) + sin((10.0 / 3.0) * x))

  return nlp
end
