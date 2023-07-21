# Hock and Schittkowski problem number 231.
#
#   Source:
#   Problem 231 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs231

"HS231 model"
function hs231(args...; kwargs...)
  nlp = Model()
  x0 = [-1.2, 1]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @NLobjective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2)
  @constraint(nlp, 1 / 3 * x[1] + x[2] + 0.1 >= 0)
  @constraint(nlp, -1 / 3 * x[1] + x[2] + 0.1 >= 0)

  return nlp
end
