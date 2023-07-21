# Hock and Schittkowski problem number 233.
#
#   Source:
#   Problem 233 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs233

"HS233 model"
function hs233(args...; kwargs...)
  nlp = Model()
  x0 = [1.2, 1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @NLobjective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)
  @NLconstraint(nlp, x[1]^2 + x[2]^2 - 0.25 >= 0)
  return nlp
end
