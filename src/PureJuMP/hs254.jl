# Hock and Schittkowski problem number 254.
#
#   Source:
#   Problem 254 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs254

"HS254 model"
function hs254(args...; kwargs...)
  nlp = Model()
  x0 = [1, 1, 1]
  lvar = [-Inf, -Inf, 1]
  @variable(nlp, x[i = 1:3] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, log(x[3]) - x[2])
  @NLconstraint(nlp, x[2]^2 + x[3]^2 - 4 == 0)
  @NLconstraint(nlp, x[3] -1 - x[2]^2 == 0)

  return nlp
end
