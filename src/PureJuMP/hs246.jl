# Hock and Schittkowski problem number 246.
#
#   Source:
#   Problem 246 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs246

"HS246 model"
function hs246(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2; 2; 0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @NLobjective(nlp, Min, 100 * (x[3] - ((x[1] + x[2]) / 2)^2)^2 + (1 - x[1])^2 + (1 - x[2])^2)

  return nlp
end
