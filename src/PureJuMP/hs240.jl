# Hock and Schittkowski problem number 240.
#
#   Source:
#   Problem 240 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs240

"HS240 model"
function hs240(args...; kwargs...)
  nlp = Model()
  x0 = [100, -1, 2.5]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @NLobjective(nlp, Min, (x[1] - x[2] + x[3])^2 + (-x[1] + x[2] + x[3])^2 + (x[1] + x[2] - x[3])^2)

  return nlp
end
