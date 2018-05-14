# Hock and Schittkowski problem number 35.
#
#   Source:
#   Problem 35 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QLR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs35

"HS35 model"
function hs35(args...)
  nlp = Model()

  x0 = [0.5,0.5,0.5]
  @variable(nlp, x[i=1:3], start=x0[i])

  @NLconstraint(nlp, 3 - x[1] - x[2] -2*x[3] >= 0)

  @constraint(nlp, 0 <= x[1])
  @constraint(nlp, 0 <= x[2])
  @constraint(nlp, 0 <= x[3])

  @NLobjective(
    nlp,
    Min,
    9 - 8*x[1] - 6*x[2] - 4*x[3] + 2*x[1]^2 + 2*x[2]^2 + x[3]^2 + 2*x[1]*x[2] + 2*x[1]*x[3]
  )

  return nlp
end