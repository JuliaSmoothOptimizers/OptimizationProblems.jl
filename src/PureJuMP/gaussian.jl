#   Source: Problem 9 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#28

#   classification SUR2-AN-3-0
export gaussian

function gaussian(args...; n::Int = default_nvar, kwargs...)
  nlp = Model()

  x0 = [0.4, 1, 0]
  @variable(nlp, x[i = 1:3], start = x0[i])

  y = [
    0.0009,
    0.0044,
    0.0175,
    0.054,
    0.1295,
    0.242,
    0.3521,
    0.3989,
    0.3521,
    0.242,
    0.1295,
    0.054,
    0.0175,
    0.0044,
    0.0009,
  ]

  @objective(
    nlp,
    Min,
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 1) / 2 - x[3])^2) - y[1])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 2) / 2 - x[3])^2) - y[2])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 3) / 2 - x[3])^2) - y[3])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 4) / 2 - x[3])^2) - y[4])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 5) / 2 - x[3])^2) - y[5])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 6) / 2 - x[3])^2) - y[6])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 7) / 2 - x[3])^2) - y[7])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 8) / 2 - x[3])^2) - y[8])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 9) / 2 - x[3])^2) - y[9])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 10) / 2 - x[3])^2) - y[10])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 11) / 2 - x[3])^2) - y[11])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 12) / 2 - x[3])^2) - y[12])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 13) / 2 - x[3])^2) - y[13])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 14) / 2 - x[3])^2) - y[14])^2 +
    0.5 * (x[1] * exp(-x[2] / 2 * ((8 - 15) / 2 - x[3])^2) - y[15])^2
  )
  return nlp
end
