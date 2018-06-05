# Hock and Schittkowski problem number 12.
#
#   Source:
#   Problem 12 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-2-1
#
# N. Antunes, Curitiba, 10/2016.

export hs12

"HS12 model"
function hs12(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:2], start = 0)

  @NLobjective(
    nlp,
    Min,
    x[1]^2/2 + x[2]^2 - x[1]*x[2] - 7*x[1] - 7*x[2]
  )

  @NLconstraint(
    nlp,
    4*x[1]^2 + x[2]^2 <= 25
  )

  return nlp
end
