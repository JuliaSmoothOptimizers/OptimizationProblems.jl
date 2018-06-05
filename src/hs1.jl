# Hock and Schittkowski problem number 1.
#
#   Source:
#   Problem 1 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SBR2-AN-2-0
#
# N. Antunes, Curitiba, 10/2016.

export hs1

"HS1 model"
function hs1(args...)
  
  nlp  = Model()
  x0   = [  -2,    1]
  lvar = [-Inf, -1.5]
  @variable(nlp, x[i=1:2] >= lvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    100*(x[2] - x[1]^2)^2 + (1 - x[1])^2
  )

  return nlp
end
