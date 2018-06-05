# Hock and Schittkowski problem number 26.
#
#   Source:
#   Problem 26 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OOR2-AY-3-1
#
# A. Cebola, Curitiba 10/2016.

export hs26

"HS26 Model"
function hs26(args...)

  nlp  = Model()
  x0   = [-2.6,  2.0,  2.0]
  @variable(nlp, x[i=1:3], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[2] - x[3])^4
  )

  @NLconstraint(
    nlp,
    constr1,
    (1 + x[2]^2) * x[1] + x[3]^4 - 3 == 0
  )

  return nlp
end
