# Hock and Schittkowski problem number 6.
#
#   Source:
#   Problem 6 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# D. Orban, Montreal, 04/2016.

export hs6

"HS6 model"
function hs6(args...)

  nlp  = Model()
  x0   = [-1.2,    1]
  @variable(nlp, x[i=1:2], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    (1 - x[1])^2
  )

  @NLconstraint(
    nlp,
    10 * (x[2] - x[1]^2) == 0
  )

  return nlp
end
