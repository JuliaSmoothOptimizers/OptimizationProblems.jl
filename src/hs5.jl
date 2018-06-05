# Hock and Schittkowski problem number 5.
#
#   Source:
#   Problem 5 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OBR2-AN-2-0
#
# N. Antunes, Curitiba, 10/2016.

export hs5

"HS5 model"
function hs5(args...)

  nlp  = Model()
  lvar = [ -1.5, -3]
  uvar = [    4,  3]
  @variable(nlp, lvar[i] <= x[i=1:2] <= uvar[i], start = 0)

  @NLobjective(
    nlp,
    Min,
    sin(x[1] + x[2]) + (x[1] - x[2])^2 - 1.5*x[1] + 2.5*x[2] + 1
  )

  return nlp
end
