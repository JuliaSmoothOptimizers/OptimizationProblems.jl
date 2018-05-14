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
  nlp = Model()

  x0 = [1,1,1]
  @variable(nlp, x[i=1:3], start=x0[i])

  @NLconstraint(nlp, x[1]*x[2] - 1 >= 0)
  
  @constraint(nlp, -10 <= x[1] <= 10)
  @constraint(nlp,   1 <= x[2] <= 10)
  @constraint(nlp, -10 <= x[3] <= 1)

  @NLobjective(
    nlp,
    Min,
    9*x[1]^2 + x[2]^2 + 9*x[3]^2
  )

  return nlp
end
