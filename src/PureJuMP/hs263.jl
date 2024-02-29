# Hock and Schittkowski problem number 263.
#
#   Source:
#   Problem 263 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs263

"HS263 model"
function hs263(args...; kwargs...)
  nlp = Model()
  x0 = [10, 10, 10, 10]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(nlp, Min, -x[1])
  @constraint(nlp, x[2] - x[1]^3 >= 0)
  @constraint(nlp, x[1]^2 - x[2] >= 0)
  @constraint(nlp, x[2] - x[1]^3 - x[3]^2 == 0)
  @constraint(nlp, x[1]^2 - x[2] - x[4]^2 == 0)

  return nlp
end
