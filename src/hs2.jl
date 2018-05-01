# Hock and Schittkowski problem number 2.
#
#   Source:
#   Problem 2 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PBR2-AN-2-0
#
# A. Montoison, Montreal, 04/2018.

export hs2

"HS2 model"
function hs2(args...)
  nlp = Model()

  x0 = [-2,1]
  @variable(nlp, x[i=1:2], start=x0[i])

  @constraint(nlp,1.5 <= x[2])

  @NLobjective(
    nlp,
    Min,
    100*(x[2]-x[1]^2)^2 + (1-x[1])^2
  )

  return nlp
end
