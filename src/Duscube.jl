# A one dimensional optimization problem
#
# Problem found in
# http://www.dmi.usherb.ca/~dussault/ROP630E17/
# Jean_pierre Dussault
#
# S. Goyette, Sherbrooke 2016/2017
export Duscube

"Univariate multimodal minimization problem Duscube"
function Duscube(args...)
  nlp = Model()

  @variable(nlp, x, start=1.0)

  @NLobjective(
    nlp,
    Min,
    x^3 - (x - 4)^2 - 100 * x
  )

  return nlp
end
