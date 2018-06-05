# Hock and Schittkowski problem number 25.
#
#   Source:
#   Problem 25 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification SBR2-AN-3-0
#
# A. Montoison, Montreal, 04/2018.

export hs25

"HS25 model"
function hs25(args...)
  
  nlp  = Model()
  x0   = [100, 12.5, 3]
  lvar = [0.1,    0, 0]
  uvar = [100, 25.6, 5]
  @variable(nlp, lvar[i] <= x[i=1:3] <= uvar[i], start = x0[i])

  @NLexpression(nlp, u[i=1:99], 25 + (-50*log(0.01*i))^(2/3))
  @NLexpression(nlp, f[i=1:99], -0.01*i + exp(-1/x[1]*(u[i]-x[2])^x[3]))

  @NLobjective(
    nlp,
    Min,
    sum(f[i]^2 for i = 1:99)
  )

  return nlp
end
