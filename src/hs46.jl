# Hock and Schittkowski problem number 46.
#
#   Source:
#   Problem 46 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PGR2-AN-5-2
#
# A. Montoison, Montreal, 05/2018.

export hs46

"HS46 model"
function hs46(args...)
  
  nlp  = Model()
  x0   = [sqrt(2)/2, 1.75, 0.5, 2, 2]
  @variable(nlp, x[i=1:5], start=x0[i])

  @NLconstraint(nlp, (x[1]^2)*x[4] + sin(x[4] - x[5]) - 1 == 0)
  @NLconstraint(nlp, x[2] + (x[3]^4)*(x[4]^2) - 2 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6
  )

  return nlp
end