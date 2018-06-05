# Hock and Schittkowski problem number 45.
#
#   Source:
#   Problem 45 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PBR2-AN-5-0
#
# A. Montoison, Montreal, 05/2018.

export hs45

"HS45 model"
function hs45(args...)

  nlp  = Model()
  @variable(nlp, 0 <= x[i=1:5] <= i, start = 2)

  @NLobjective(
    nlp,
    Min,
    2 - x[1]*x[2]*x[3]*x[4]*x[5]/120
  )

  return nlp
end