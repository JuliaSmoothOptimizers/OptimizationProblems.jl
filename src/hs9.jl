#   Hock and Schittkowski problem number 9.
#
#   Source:
#   Problem 9 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification OLR2-AN-2-1
#
# A. Cebola, Curitiba , 10/2016.

export hs9

"HS9 Model"
function hs9(args...)

  nlp  = Model()
  @variable(nlp, x[i=1:2], start = 0)

  @NLobjective(
    nlp,
    Min,
    sin(π * x[1] / 12) * cos(π * x[2] / 16)
  )

  @constraint(
    nlp,
    constr1,
    4 * x[1] - 3 * x[2] == 0
  )

  return nlp
end
