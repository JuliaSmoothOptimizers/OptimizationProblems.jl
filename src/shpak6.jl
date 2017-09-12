# 6th problem of
# Global optimization in one-dimensional case
# using analytically defined derivatives of
# objective function
#
# A.Shpak
#
#Computer Science Journal of Moldova, vol.3, no.2(8), 1995
#
# S. Goyette, Sherbrooke 2016/2017

export Shpak6

"Univariate multimodal minimization problem Shpak6"
function Shpak6(args...)

  nlp = Model()

  veca=[4.696 4.885 0.800 4.986 3.901 2.395 0.945 8.371 6.181 5.713]
  veck=[2.871 2.328 1.111 1.263 2.399 2.629 2.853 2.344 2.592 2.929]
  vecc=[0.149 0.166 0.175 0.183 0.128 0.117 0.115 0.148 0.188 0.198]

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    -sum(1.0 / (veck[i] ^ 2 * (x - veca[i]) ^ 2 + vecc[i]) for i = 1:10)
  )

  return nlp
end
