# Hock and Schittkowski problem number 256.
#
#   Source:
#   Problem 256 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs256

"HS256 model: Powell's function"
function hs256(args...; kwargs...)
  nlp = Model()
  x0 = [3, -1, 0, 1]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @NLobjective(nlp, Min, (x[1] + 10 * x[2])^2 + 5* (x[3] - x[4])^2 + (x[2] - 2 * x[3])^4 + 10 * (x[1] - x[4])^4)

  return nlp
end
