# Hock and Schittkowski problem number 62.
#
#   Source:
#   Problem 62 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GLR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs62

"HS62 model"
function hs62(args...)
  
  nlp  = Model()
  x0   = [0.7, 0.2, 0.1]
  @variable(nlp, 0 ≤ x[i=1:3] ≤ 1, start = x0[i])

  @constraint(nlp, x[1] + x[2] + x[3] - 1 == 0)

  @NLobjective(
    nlp,
    Min,
    -32.174*(255*log((x[1] + x[2] + x[3] + 0.03)/(0.09*x[1] + x[2] + x[3] + 0.03))
    + 280*log((x[2] + x[3] + 0.03)/(0.07*x[2] + x[3] + 0.03))
    + 290*log((x[3] + 0.03)/(0.13*x[3] + 0.03)))
  )

  return nlp
end