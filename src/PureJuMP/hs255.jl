# Hock and Schittkowski problem number 255.
#
#   Source:
#   Problem 255 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs255

"HS255 model"
function hs255(args...; kwargs...)
  nlp = Model()
  x0 = [-3, 1, -3, 1]
  @variable(nlp, x[i = 1:4], start = x0[i])

  @objective(
    nlp,
    Min,
    100 * (x[2] - x[1]^2) +
    (1 - x[1])^2 +
    90 * (x[4] - x[3]^2) +
    (1 - x[3])^2 +
    10.1 * (x[2] - 1)^2 +
    10.1 * (x[4] - 1)^2 +
    19.8 * (x[2] - 1) * (x[4] - 1)
  )

  return nlp
end
