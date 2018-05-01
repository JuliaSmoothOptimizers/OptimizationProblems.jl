# Hock and Schittkowski problem number 30.
#
#   Source:
#   Problem 30 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-1
#
# A. Montoison, Montreal, 04/2018.

export hs30

"HS30 model"
function hs30(args...)
  nlp = Model()

  x0 = [1,1,1]
  @variable(nlp, x[i=1:3], start=x0[i])

  @NLconstraint(nlp, x[1]^2 + x[2]^2 - 1 >= 0)
  @constraint(nlp, 1 <= x[1] <= 10)
  @constraint(nlp, -10 <= x[2] <= 10)
  @constraint(nlp, -10 <= x[3] <= 10)

  @NLobjective(
    nlp,
    Min,
    sum(x[i]^2 for i = 1:3)
  )

  return nlp
end
