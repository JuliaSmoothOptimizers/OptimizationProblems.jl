#   Source:  Problem 19 in
#   J.J. More', B.S. Garbow and K.E. Hillstrom,
#   "Testing Unconstrained Optimization Software",
#   ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

#   See also Buckley#32 (p.78).

#   classification NOR2-MN-11-65
export osborne2

function osborne2(args...; n::Int = default_nvar, kwargs...)
  y = [
    1.366,
    1.191,
    1.112,
    1.013,
    0.991,
    0.885,
    0.831,
    0.847,
    0.786,
    0.725,
    0.746,
    0.679,
    0.608,
    0.655,
    0.616,
    0.606,
    0.602,
    0.626,
    0.651,
    0.724,
    0.649,
    0.649,
    0.694,
    0.644,
    0.624,
    0.661,
    0.612,
    0.558,
    0.533,
    0.495,
    0.500,
    0.423,
    0.395,
    0.375,
    0.372,
    0.391,
    0.396,
    0.405,
    0.428,
    0.429,
    0.523,
    0.562,
    0.607,
    0.653,
    0.672,
    0.708,
    0.633,
    0.668,
    0.645,
    0.632,
    0.591,
    0.559,
    0.597,
    0.625,
    0.739,
    0.710,
    0.729,
    0.720,
    0.636,
    0.581,
    0.428,
    0.292,
    0.162,
    0.098,
    0.054,
  ]
  m = 65

  nlp = Model()
  x0 = [1.3, 0.65, 0.65, 0.7, 0.6, 3, 5, 7, 2, 4.5, 5.5]
  @variable(nlp, x[i = 1:11], start = x0[i])
  @NLobjective(
    nlp,
    Min,
    sum(
      (
        y[i] - (
          x[1] * exp(-(i - 1) / 10 * x[5]) +
          x[2] * exp(-((i - 1) / 10 - x[9])^2 * x[6]) +
          x[3] * exp(-((i - 1) / 10 - x[10])^2 * x[7]) +
          x[4] * exp(-((i - 1) / 10 - x[11])^2 * x[8])
        )
      )^2 for i = 1:m
    )
  )
  return nlp
end
