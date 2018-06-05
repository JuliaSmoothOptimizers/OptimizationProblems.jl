# Hock and Schittkowski problem number 65.
#
#   Source:
#   Problem 65 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs65

"HS65 model"
function hs65(args...)
  
  nlp  = Model()
  x0   = [  -5,    5,  0]
  lvar = [-4.5, -4.5, -5]
  uvar = [ 4.5,  4.5,  5]
  @variable(nlp, lvar[i] <= x[i=1:3] <= uvar[i], start=x0[i])

  @NLconstraint(nlp, - 48 + x[1]^2 + x[2]^2 + x[3]^2 <= 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] - x[2])^2 + ((x[1] + x[2] -10)^2)/9 + (x[3] - 5)^2
  )

  return nlp
end