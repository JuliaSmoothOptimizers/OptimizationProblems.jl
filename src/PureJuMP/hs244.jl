# Hock and Schittkowski problem number 244.
#
#   Source:
#   Problem 244 in
#   K. Schittkowski,
#   More Test Examples for Nonlinear Programming Codes,
#   Lectures Notes in Economics and Mathematical Systems 282,
#   Springer Verlag, Heidelberg, 1987.
#
#   
#
# T. Migot, Montreal, 2023.

export hs244

"HS244 model"
function hs244(args...; kwargs...)
  nlp = Model()
  x0 = [1, 2, 1]
  @variable(nlp, x[i = 1:3], start = x0[i])

  @objective(
    nlp,
    Min,
    sum(
      (
        exp(-x[1] * (10 + i) / 100) - x[3] * exp(-x[2] * (10 + i) / 100) -
        (exp(-(10 + i) / 100) - 5 * exp(-(10 + i) / 10))
      )^2 for i = 1:10
    )
  )

  return nlp
end
