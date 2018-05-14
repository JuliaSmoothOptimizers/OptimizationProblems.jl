# Hock and Schittkowski problem number 33.
#
#   Source:
#   Problem 33 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PQR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs33

"HS33 model"
function hs33(args...)
  nlp = Model()

  x0 = [0,0,3]
  @variable(nlp, x[i=1:3], start=x0[i])

  @NLconstraint(nlp, x[3]^2 - x[2]^2 - x[1]^2 >= 0)
  @NLconstraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 - 4 >= 0)

  @constraint(nlp, 0 <= x[1])
  @constraint(nlp, 0 <= x[2])
  @constraint(nlp, 0 <= x[3] <= 5)

  @NLobjective(
    nlp,
    Min,
    (x[1] - 1)*(x[1] - 2)*(x[3] - 3) + x[3]
  )

  return nlp
end