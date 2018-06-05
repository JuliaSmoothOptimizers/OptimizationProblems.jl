# Hock and Schittkowski problem number 38.
#
#   Source:
#   Problem 38 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PLR2-AN-4-0
#
# A. Montoison, Montreal, 05/2018.

export hs38

"HS38 model"
function hs38(args...)
  
  nlp  = Model()
  x0   = [-3, -1, -3, -1]
  @variable(nlp, -10 <= x[i=1:4] <= 10, start = x0[i])

  @NLobjective(
    nlp,
    Min,
    100*(x[2] - x[1]^2)^2 + (1 - x[1])^2 + 90*(x[4] - x[3]^2)^2 + (1 - x[3])^2 
    + 10.1*((x[2] - 1)^2 + (x[4] - 1)^2) + 19.8*(x[2] - 1)*(x[4] - 1)
  )

  return nlp
end