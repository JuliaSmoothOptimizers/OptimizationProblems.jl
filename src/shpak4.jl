# 4th problem of
# Global optimization in one-dimensional case
# using analytically defined derivatives of
# objective function
#
# A.Shpak
#
# Computer Science Journal of Moldova, vol.3, no.2(8), 1995
#
# S. Goyette, Sherbrooke 2016/2017

export Shpak4

"Univariate multimodal minimization problem Shpak4"
function Shpak4(args...)
  nlp = Model()

  @variable(nlp, x, start=-1.0)

  @NLobjective(
    nlp,
    Min,
    (x + sin(x)) * exp(-(x)^2)
  )

  return nlp
end
