# Hock and Schittkowski problem number 241.
#
#   Source:
#   Problem 241 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs241

"HS241 model"
function hs241(args...; kwargs...)
  nlp = Model()
  x0 = [1, 2, 0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(
    nlp,
    Min,
    (x[1]^2 + x[2]^2 + x[3]^2 - 1)^2 +
    (x[1]^2 + x[2]^2 + (x[3] - 2)^2 - 1)^2 +
    (x[1] + x[2] + x[3] - 1)^2 +
    (x[1] + x[2] - x[3] + 1)^2 +
    (x[1]^3 + 3 * x[2]^2 + (5 * x[3] - x[1] + 1)^2 - 36)^2
  )

  return nlp
end
