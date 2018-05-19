# Hock and Schittkowski problem number 69.
#
#   Source:
#   Problem 69 in
#   W. Hock and K. Schittkowski,
#   Test examples for nonlinear programming codes,
#   Lectures Notes in Economics and Mathematical Systems 187,
#   Springer Verlag, Heidelberg, 1981.
#
#   classification GGR2-AN-4-2
#
# A. Montoison, Montreal, 05/2018.

export hs69

function ϕ(t)
  dϕ(y) = exp(-y^2/2)
  return quadgk(dϕ, -Inf, t)/sqrt(2*pi)
end

"HS69 model"
function hs69(args...)
  nlp = Model()

  a = 0.1
  b = 1000
  d = 1
  n = 4

  x0 = [1,1,1,1]
  @variable(nlp, x[i=1:4], start=x0[i])

  JuMP.register(nlp, :ϕ, 1, ϕ, autodiff=true)
  @NLconstraint(nlp, x[3] - 2*ϕ(-x[2]) == 0)
  @NLconstraint(nlp, x[4] - ϕ(-x[2] + d*sqrt(n)) - ϕ(-x[2] - d*sqrt(n)) == 0)
  
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