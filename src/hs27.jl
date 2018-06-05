# Hock and Schittkowski problem number 27.
#
#   Source:
#   Problem 27 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SQR2-AN-3-1
#
# A. Cebola, Curitiba 10/2016.

export hs27

"HS27 Model"
function hs27(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:3], start = 2)

  @NLobjective(
    nlp,
    Min,
    0.01*(x[1] - 1)^2 + (x[2] - x[1]^2)^2
  )

  @NLconstraint(
    nlp,
    constr1,
    x[1] + x[3]^2 + 1 == 0
  )

  return nlp
end
