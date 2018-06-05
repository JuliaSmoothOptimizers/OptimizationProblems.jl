# Hock and Schittkowski problem number 54.
#
#   Source:
#   Problem 54 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GLR2-AN-6-1
#
# A. Montoison, Montreal, 05/2018.

export hs54

"HS54 model"
function hs54(args...)

  nlp  = Model()
  x0   = [6e3, 1.5, 4e6,  2, 3e-3, 5e7]
  lvar = [  0, -10,   0,  0,   -1,   0]
  uvar = [2e4,  10, 1e7, 20,    1, 2e8]
  @variable(nlp, lvar[i] <= x[i=1:6] <= uvar[i], start = x0[i])

  @constraint(nlp, x[1] + 3*x[2] == 0)

  @NLexpression(nlp, h, 
  (((x[1] - 1e4)^2)/6.4e7 + (x[1] - 1e4)*(x[2] - 1)/2e4 + (x[2] - 1)^2)/0.96
  + 0.96((x[3] - 2e6)^2)/(0.96*4.9e13) + ((x[4] - 10)^2)/2.5e3 
  + ((x[5] -1e-3)^2)/(2.5e-3) + ((x[6] - 1.e8)^2)/2.5e17
  )  

  @NLobjective(
    nlp,
    Min,
    -exp(-h/2)
  )

  return nlp
end