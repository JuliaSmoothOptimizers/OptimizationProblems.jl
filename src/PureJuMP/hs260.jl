# Hock and Schittkowski problem number 260.
#
#   Source:
#   Problem 260 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs260

"HS260 model"
function hs260(args...; kwargs...)
  nlp = Model()
  x0 = [-3, -1, -3, -1]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @NLobjective(nlp, Min, 100 * (x[2] - x[1]^2)^2 + (1 - x[1])^2 + 90 * (x[4] - x[3]^2)^2 + (1 - x[3])^2 + 9.9 * ((x[2] - 1) + (x[4] - 1))^2 + 0.2 * ((x[2] - 1)^2 + (x[4] - 1)^2))

  return nlp
end
