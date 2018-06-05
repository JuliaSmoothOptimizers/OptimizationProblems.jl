# Hock and Schittkowski problem number 64.
#
#   Source:
#   Problem 64 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification PPR2-AN-3-1
#
# A. Montoison, Montreal, 05/2018.

export hs64

"HS64 model"
function hs64(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:3] >= 1e-5, start = 1)

  @NLconstraint(nlp, - 1 + 4/x[1] + 32/x[2] + 120/x[3] <= 0)
  
  @NLobjective(
    nlp,
    Min,
    5*x[1] + 50000/x[1] + 20*x[2] + 72000/x[2] + 10*x[3] + 144000/x[3]
  )

  return nlp
end