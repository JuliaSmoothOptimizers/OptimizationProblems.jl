# A one dimensional optimization problem
#
# Problem found in
# http://www.dmi.usherb.ca/~dussault/ROP630E17/
# Jean_pierre Dussault
#
# S. Goyette, Sherbrooke 2016/2017

export Dus2_1

"Univariate unimodal minimization problem Dus2_1"
function Dus2_1(args...)
  nlp = Model()

  @variable(nlp, x, start=-1.0)

  @NLobjective(
    nlp,
    Min,
    exp(x * (x - 1))
  )

  return nlp
end
