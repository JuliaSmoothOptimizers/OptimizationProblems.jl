#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=N=N TZVP+MP2
#   fitting Y to A0 + A2 X**2 + A4 X**4 + A6 X**6 + A8 X**8 +
#                A10 X**10 + A12 X**12
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-7-0

export palmer1d

"A linear least squares problem arising from chemical kinetics."
function palmer1d(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x[j = 1:7], start = 1.0)

  X = [
    -1.788963,
    -1.745329,
    -1.658063,
    -1.570796,
    -1.483530,
    -1.396263,
    -1.308997,
    -1.218612,
    -1.134464,
    -1.047198,
    -0.872665,
    -0.698132,
    -0.523599,
    -0.349066,
    -0.174533,
    0.0000000,
    1.788963,
    1.745329,
    1.658063,
    1.570796,
    1.483530,
    1.396263,
    1.308997,
    1.218612,
    1.134464,
    1.047198,
    0.872665,
    0.698132,
    0.523599,
    0.349066,
    0.174533,
    -1.8762289,
    -1.8325957,
    1.8762289,
    1.8325957,
  ]

  Y = [
    78.596218,
    65.77963,
    43.96947,
    27.038816,
    14.6126,
    6.2614,
    1.538330,
    0.000000,
    1.188045,
    4.6841,
    16.9321,
    33.6988,
    52.3664,
    70.1630,
    83.4221,
    88.3995,
    78.596218,
    65.77963,
    43.96947,
    27.038816,
    14.6126,
    6.2614,
    1.538330,
    0.000000,
    1.188045,
    4.6841,
    16.9321,
    33.6988,
    52.3664,
    70.1630,
    83.4221,
    108.18086,
    92.733676,
    108.18086,
    92.733676,
  ]

  @objective(nlp, Min, 0.5 * sum((Y[i] - sum(x[j] * X[i]^(2 * j - 2) for j = 1:7))^2 for i = 1:35))

  return nlp
end
