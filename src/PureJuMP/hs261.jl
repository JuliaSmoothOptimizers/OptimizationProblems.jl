# Hock and Schittkowski problem number 261.
#
#   Source:
#   Problem 261 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs261

"HS261 model"
function hs261(args...; kwargs...)
  nlp = Model()
  x0 = [0, 0, 0, 0]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @NLobjective(nlp, Min, (exp(x[1]) - x[2])^4 + 100 * (x[2] - x[3])^6 + tan(x[3] - x[4])^4 + x[1]^8 + (x[4] - 1)^2)

  return nlp
end
