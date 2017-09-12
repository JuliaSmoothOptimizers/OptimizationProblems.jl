# Second problem of
# Global optimization in one-dimensional case
# using analytically defined derivatives of
# objective function

# A.Shpak

# Computer Science Journal of Moldova, vol.3, no.2(8), 1995
# S. Goyette, Sherbrooke 2016/2017

export Shpak2

"Univariate multimodal minimization problem Shpak2"
function Shpak2(args...)
  nlp = Model()

  @variable(nlp, x, start=3.1)

  @NLobjective(
    nlp,
    Min,
    sin(x) + sin((10.0 / 3.0) * x)
  )

  return nlp
end
