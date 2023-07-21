# Hock and Schittkowski problem number 221.
#
#   Source:
#   Problem 221 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs221

"HS221 model"
function hs221(args...; kwargs...)
  nlp = Model()
  x0 = [0.25, 0.25]
  lvar = [0, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, -x[1])
  @NLconstraint(nlp, (1 - x[1])^3 - x[2] >= 0)

  return nlp
end
