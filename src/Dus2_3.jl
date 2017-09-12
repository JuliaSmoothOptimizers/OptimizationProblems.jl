# A one dimensional optimization problem
#
# Problem found in
# http://www.dmi.usherb.ca/~dussault/ROP630E17/
# Jean_pierre Dussault
#
# S. Goyette, Sherbrooke 2016/2017
export Dus2_3

"Univariate unimodal minimization problem Dus2_3"
function Dus2_3(args...)
  nlp = Model()

  @variable(nlp, x, start=-2.0)

  @NLobjective(
    nlp,
    Min,
    1 - (1 / (5 * (x^2) - 6 * x + 5))
  )

  return nlp
end
