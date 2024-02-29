# Hock and Schittkowski problem number 228.
#
#   Source:
#   Problem 228 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs228

"HS228 model"
function hs228(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0]
  @variable(nlp, x[i = 1:2], start = x0[i])

  @objective(nlp, Min, x[1]^2 + x[2])
  @constraint(nlp, -x[1] - x[2] + 1 >= 0)
  @constraint(nlp, -(x[1]^2 + x[2]^2) + 9 >= 0)

  return nlp
end
