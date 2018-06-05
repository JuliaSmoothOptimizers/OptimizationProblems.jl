# Hock and Schittkowski problem number 73.
#
#   Source:
#   Problem 73 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification LGI-AN-4-3
#
# A. Montoison, Montreal, 05/2018.

export hs73

"HS73 model"
function hs73(args...)
  
  nlp  = Model()
  @variable(nlp, x[i=1:4] >= 0, start = 1)

  @constraint(nlp, 2.3*x[1] +5.6*x[2] + 11.1*x[3] + 1.3*x[4] - 5 >= 0)
  @NLconstraint(nlp, 12*x[1] + 11.9*x[2] + 41.8*x[3] + 52.1*x[4] - 21 
  - 1.645*sqrt(0.28x[1]^2 + 0.19*x[2]^2 + 20.5*x[3]^2 + 0.62x[4]^2) >= 0)
  @constraint(nlp, x[1] + x[2] + x[3] + x[4] - 1 == 0)

  @objective(
    nlp,
    Min,
    24.55*x[1] + 26.75*x[2] + 39*x[3] + 40.50*x[4]
  )

  return nlp
end