# Hock and Schittkowski problem number 63.
#
#   Source:
#   Problem 63 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs63

"HS63 model"
function hs63(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:3] >= 0, start = 2)

  @constraint(nlp, 8*x[1]   + 14*x[2] + 7*x[3] - 56 == 0)
  @NLconstraint(nlp, x[1]^2 + x[2]^2  + x[3]^2 - 25 == 0)

  @NLobjective(
    nlp,
    Min,
    1000 - x[1]^2 - 2*x[2]^2 - x[3]^2 - x[1]*x[2] - x[1]*x[3]
  )

  return nlp
end