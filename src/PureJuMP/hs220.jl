# Hock and Schittkowski problem number 220.
#
#   Source:
#   Problem 220 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs220

"HS220 model"
function hs220(args...; kwargs...)
  nlp = Model()
  x0 = [25000, 25000]
  lvar = [1, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @NLobjective(nlp, Min, x[1])
  @NLconstraint(nlp, (x[1] - 1)^3 - x[2] == 0)

  return nlp
end
