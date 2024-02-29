# Hock and Schittkowski problem number 222.
#
#   Source:
#   Problem 222 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs222

"HS222 model"
function hs222(args...; kwargs...)
  nlp = Model()
  x0 = [1.3, 0.2]
  lvar = [0, 0]
  @variable(nlp, x[i = 1:2] ≥ lvar[i], start = x0[i])

  @objective(nlp, Min, -x[1])
  @constraint(nlp, (1 - x[1])^3 - x[2] + 0.125 >= 0)

  return nlp
end
