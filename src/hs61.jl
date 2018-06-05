# Hock and Schittkowski problem number 61.
#
#   Source:
#   Problem 61 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification QQR2-AN-3-2
#
# A. Montoison, Montreal, 05/2018.

export hs61

"HS61 model"
function hs61(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:3], start = 0)

  @constraint(nlp, 3*x[1] - 2*x[2]^2 -  7 == 0)
  @constraint(nlp, 4*x[1] -   x[3]^2 - 11 == 0)

  @NLobjective(
    nlp,
    Min,
    4*x[1]^2 + 2*x[2]^2 + 2*x[3]^2 - 33*x[1] + 16*x[2] - 24*x[3]
  )

  return nlp
end