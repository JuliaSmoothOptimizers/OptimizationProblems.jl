# Hock and Schittkowski problem number 19.
#
#   Source:
#   Problem 19 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PQR2-AN-2-2
#
# A. Montoison, Montreal, 04/2018.

export hs19

"HS19 model"
function hs19(args...)
 
  nlp = Model()
  x0   = [20.1,5.84]
  lvar = [13  ,   0]
  uvar = [100 , 100]
  @variable(nlp, lvar[i] <= x[i=1:2] <= uvar[i], start = x0[i])

  @NLconstraint(nlp, (x[1] - 5)^2 + (x[2] - 5)^2 - 100 >= 0)
  @NLconstraint(nlp, (x[2] - 5)^2 + (x[1] - 6)^2 - 82.81 <= 0)

  @NLobjective(
    nlp,
    Min,
    (x[1]-10)^3 + (x[2]-20)^3
  )

  return nlp
end
