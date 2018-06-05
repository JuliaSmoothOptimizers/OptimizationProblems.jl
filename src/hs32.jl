# Hock and Schittkowski problem number 32.
#
#   Source:
#   Problem 32 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QPR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs32

"HS32 model"
function hs32(args...)

  nlp  = Model()
  x0   = [0.1, 0.7, 0.2]
  @variable(nlp, x[i=1:3] >= 0, start = x0[i])

  @NLconstraint(nlp, 6*x[2] + 4*x[3] - x[1]^3 - 3 >= 0)
  @constraint(nlp, -1 + x[1] + x[2] + x[3] == 0)

  @NLobjective(
    nlp,
    Min,
    (x[1] + 3*x[2] + x[3])^2 + 4*(x[1] - x[2])^2
  )

  return nlp
end
