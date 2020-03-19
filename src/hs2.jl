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
  
  nlp  = Model()
  x0   = [  -2,   1]
  lvar = [-Inf, 1.5]
  @variable(nlp, x[i=1:2] ≥ lvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
  )

  return nlp
end
