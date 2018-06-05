# Hock and Schittkowski problem number 31.
#
#   Source:
#   Problem 31 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs31

"HS31 model"
function hs31(args...)

  nlp  = Model()
  lvar = [-10,  1, -10]
  uvar = [ 10, 10,   1]
  @variable(nlp, lvar[i] <= x[i=1:3] <= uvar[i], start = 1)

  @NLconstraint(nlp, x[1]*x[2] - 1 >= 0)

  @NLobjective(
    nlp,
    Min,
    9*x[1]^2 + x[2]^2 + 9*x[3]^2
  )

  return nlp
end
