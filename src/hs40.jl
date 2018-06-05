# Hock and Schittkowski problem number 40.
#
#   Source:
#   Problem 40 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OOR2-AN-4-3
#
# D. Cabral, Curitiba, 10/2016.


export hs40

"HS40 model"
function hs40(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:4], start = 0.8)

  @NLobjective(
    nlp,
    Min,
    -x[1] * x[2] * x[3] * x[4]
  )

  @NLconstraint(
    nlp,
    x[1]^3 + x[2]^2 - 1 == 0
  )

  @NLconstraint(
    nlp,
    x[4]*x[1]^2 - x[3] == 0
  )

  @NLconstraint(
    nlp,
    x[4]^2 - x[2] == 0
  )

  return nlp
end
