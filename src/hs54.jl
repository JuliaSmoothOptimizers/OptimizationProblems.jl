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
  nlp = Model()

  x0 = [6e3,1.5,4e6,2,3e-3,5e7]
  @variable(nlp, x[i=1:6], start=x0[i])

  @constraint(nlp, x[1] + 3*x[2] == 0)

  @constraint(nlp,   0 <= x[1] <= 2e4)
  @constraint(nlp, -10 <= x[2] <= 10)
  @constraint(nlp,   0 <= x[3] <= 1e7)
  @constraint(nlp,   0 <= x[4] <= 20)
  @constraint(nlp,  -1 <= x[5] <= 1)
  @constraint(nlp,   0 <= x[6] <= 2e8)

  @NLexpression(nlp, h, (((x[1] - 1e6)^2)/6.4e7 + (x[1] - 1e4)*(x[2] - 1)/2e4 + (x[2] - 1)^2)
                        *((x[3] - 2e6)^2)/(0.96*4.9e13) + ((x[4] - 10)^2)/2.5e3 
                        + ((x[5] -1e-3)^2)/(2.5e-3) + ((x[6] - 1.e8)^2)/2.5e17
  )  

  @NLobjective(
    nlp,
    Min,
    -exp(-h/2)
  )

  return nlp
end