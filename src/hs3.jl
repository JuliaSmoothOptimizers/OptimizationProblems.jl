# Hock and Schittkowski problem number 3.
#
#   Source:
#   Problem 3 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QBR2-AN-2-0
#
# N. Antunes, Curitiba, 10/2016.

export hs3

"HS3 model"
function hs3(args...)

  nlp  = Model()
  x0   = [  10, 1]
  lvar = [-Inf, 0]
  @variable(nlp, x[i=1:2] >= lvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    x[2] + 0.00001*(x[2] - x[1])^2
  )

  return nlp
end
