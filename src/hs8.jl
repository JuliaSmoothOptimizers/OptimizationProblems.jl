# Hock and Schittkowski problem number 8.
#
#   Source:
#   Problem 8 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OOR2-AN-2-1
#
# D. Orban, Montreal, 04/2016.

export hs8

"HS8 model"
function hs8(args...)

  nlp  = Model()
  x0   = [2.0, 1.0]
  @variable(nlp, x[i=1:2], start = x0[i])

  @objective(
    nlp,
    Min,
    -1
  )

  @NLconstraint(
    nlp,
    constr1,
    x[1]^2 + x[2]^2 - 25 == 0
  )

  @NLconstraint(
    nlp,
    constr2,
    x[1] * x[2] - 9 == 0
  )

  return nlp
end
