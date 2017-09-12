# fifth problem of
# Global optimization in one-dimensional case
# using analytically defined derivatives of
# objective function
#
# A.Shpak
#
# Computer Science Journal of Moldova, vol.3, no.2(8), 1995
#
# S. Goyette, Sherbrooke 2016/2017

export Shpak5

"Univariate multimodal minimization problem Shpak5"
function Shpak5(args...)

  nlp = Model()
  veca=[3.040 1.098 0.674 3.537 6.173 8.679 4.503 3.328 6.937 0.700]
  veck=[2.983 2.378 2.439 1.168 2.406 1.236 2.868 1.378 2.348 2.268]
  vecc=[0.192 0.140 0.127 0.132 0.125 0.189 0.187 0.171 0.188 0.176]

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    -sum(1.0 / (veck[i] ^ 2 * (x - veca[i]) ^ 2 + vecc[i]) for i = 1:10)
  )

  return nlp
end
