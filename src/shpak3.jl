#third problem of
#Global optimization in one-dimensional case
#using analytically defined derivatives of
#objective function
#
#A.Shpak
#
#Computer Science Journal of Moldova, vol.3, no.2(8), 1995
# S. Goyette, Sherbrooke 2016/2017

export Shpak3

"Univariate multimodal minimization problem Shpak3"
function Shpak3(args...)
  nlp = Model()

  @variable(nlp, x, start=-10.0)

  @NLobjective(
    nlp,
    Min,
    1 * sin(2 * x + 1) + 2 * sin(3 * x + 2) +
    3 * sin(4 * x + 3) + 4 * sin(5 * x + 4) + 5 * sin(6 * x + 5)
  )

  return nlp
end
