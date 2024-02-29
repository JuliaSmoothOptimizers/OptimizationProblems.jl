# Hock and Schittkowski problem number 230.
#
#   Source:
#   Problem 230 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs230

"HS230 model"
function hs230(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[2])
  @constraint(nlp, -2 * x[1]^2 + x[1]^3 + x[2] >= 0)
  @constraint(nlp, -2 * (1 - x[1])^2 + (1 - x[1])^3 + x[2] >= 0)

  return nlp
end
