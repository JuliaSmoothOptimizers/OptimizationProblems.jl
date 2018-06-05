# Hock and Schittkowski problem number 43.
#
#   Source:
#   Problem 43 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-4-3
#
# A. Montoison, Montreal, 05/2018.

export hs43

"HS43 model"
function hs43(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:4], start = 0)

  @NLconstraint(nlp, - 8  + x[1]^2 +   x[2]^2 + x[3]^2 +   x[4]^2 + x[1] - x[2] + x[3] - x[4] <= 0)
  @NLconstraint(nlp, - 10 + x[1]^2 + 2*x[2]^2 + x[3]^2 + 2*x[4]^2 - x[1] - x[4] <= 0)
  @NLconstraint(nlp, -5 + 2*x[1]^2 +   x[2]^2 + x[3]^2 + 2*x[1]   - x[2] - x[4] <= 0)

  @NLobjective(
    nlp,
    Min,
    x[1]^2 + x[2]^2 + 2*x[3]^2 + x[4]^2 - 5*x[1] - 5*x[2] - 21*x[3] + 7*x[4]
  )

  return nlp
end