# A one dimensional optimization problem
#
# Problem found in
# http://www.dmi.usherb.ca/~dussault/ROP630E17/
# Jean_pierre Dussault
#
# S. Goyette, Sherbrooke 2016/2017
export Dus2_9

"Univariate multimodal minimization problem Dus2_9"
function Dus2_9(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    1 - 12 * x + 7.5 * x^2 - x^3
  )

  return nlp
end
