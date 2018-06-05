# Hock and Schittkowski problem number 4.
#
#   Source:
#   Problem 4 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OBR2-AN-2-0
#
# N. Antunes, Curitiba, 10/2016.

export hs4

"HS4 model"
function hs4(args...)

  nlp  = Model()
  x0   = [1.125, 0.125]
  lvar = [    1,     0]
  @variable(nlp, x[i=1:2] >= lvar[i], start = x0[i])

  @NLobjective(
    nlp,
    Min,
    (x[1] + 1)^3/3 + x[2]
  )

  return nlp
end
