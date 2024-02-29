# Hock and Schittkowski problem number 248.
#
#   Source:
#   Problem 248 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs248

"HS248 model: around the world problem"
function hs248(args...; kwargs...)
  nlp = Model()
  x0 = [-0.1, -1, 0.1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(nlp, Min, -x[2])
  @constraint(nlp, 1 - 2 * x[2] + x[1] >= 0)
  @constraint(nlp, x[1]^2 + x[2]^2 + x[3]^2 - 1 == 0)

  return nlp
end
