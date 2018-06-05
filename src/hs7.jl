# Hock and Schittkowski problem number 7.
#
#   Source:
#   Problem 7 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OOR2-AN-2-1
#
# D. Orban, Montreal, 04/2016.

export hs7

"HS7 model"
function hs7(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:2], start = 2)

  @NLobjective(
    nlp,
    Min,
    log(1 + x[1]^2) - x[2]
  )

  @NLconstraint(
    nlp,
    (1 + x[1]^2)^2 + x[2]^2 - 4 == 0
  )

  return nlp
end
