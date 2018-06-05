# Hock and Schittkowski problem number 77.
#
#   Source:
#   Problem 77 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PGR-AN-5-2
#
# A. Montoison, Montreal, 05/2018.

export hs77

"HS77 model"
function hs77(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:5], start = 2)

  @NLconstraint(nlp, x[1]^2 * x[4] + sin(x[4] - x[5]) - 2*sqrt(2) == 0)
  @NLconstraint(nlp, x[2] + x[3]^4 * x[4]^2 - 8 - sqrt(2) == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)^2 + (x[1] - x[2])^2 + (x[3] - 1)^2 + (x[4] - 1)^4 + (x[5] - 1)^6
  )

  return nlp
end