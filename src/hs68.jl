# Hock and Schittkowski problem number 68.
#
#   Source:
#   Problem 68 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGR2-AN-4-2
#
# A. Montoison, Montreal, 05/2018.

export hs68

function ϕbis(t)
  dϕ(y) = exp(-y^2/2)
  return quadgk(dϕ, -Inf, t)/sqrt(2*pi)
end

"HS68 model"
function hs68(args...)
  nlp = Model()

  a = 0.0001
  b = 1
  d = 1
  n = 24

  x0 = [1,1,1,1]
  @variable(nlp, x[i=1:4], start=x0[i])

  JuMP.register(nlp, :ϕbis, 1, ϕbis, autodiff=true)
  @NLconstraint(nlp, x[3] - 2*ϕbis(-x[2]) == 0)
  @NLconstraint(nlp, x[4] - ϕbis(-x[2] + d*sqrt(n)) - ϕbis(-x[2] - d*sqrt(n)) == 0)
  
  @constraint(nlp, 0.0001 <= x[1] <= 100)
  @constraint(nlp, 0      <= x[2] <= 100)
  @constraint(nlp, 0      <= x[3] <= 2)
  @constraint(nlp, 0      <= x[4] <= 2)

  @NLobjective(
    nlp,
    Min,
    (a*n - (b*(exp(x[1]) - 1) - x[3])/(exp(x[1]) - 1 + x[4])*x[4])/x[1]
    )

  return nlp
end