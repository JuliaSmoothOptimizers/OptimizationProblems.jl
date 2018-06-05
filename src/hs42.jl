# Hock and Schittkowski problem number 42.
#
#   Source:
#   Problem 42 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-4-1
#
# A. Montoison, Montreal, 05/2018.

export hs42

"HS42 model"
function hs42(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:4], start = 1)

  @NLconstraint(nlp, x[3]^2 + x[4]^2 - 2 == 0)

  @constraint(nlp, x[1] - 2 == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)^2 + (x[2] - 2)^2 + (x[3] - 3)^2 + (x[4] - 4)^2
  )

  return nlp
end