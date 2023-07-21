# Hock and Schittkowski problem number 227.
#
#   Source:
#   Problem 227 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs227

"HS227 model"
function hs227(args...; kwargs...)
  nlp = Model()
  x0 = [0.5, 0.5]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @NLobjective(nlp, Min, (x[1] - 2)^2 + (x[2] - 1)^2)
  @NLconstraint(nlp, -x[1]^2 + x[2] >= 0)
  @NLconstraint(nlp, x[1] - x[2]^2 >= 0)

  return nlp
end
