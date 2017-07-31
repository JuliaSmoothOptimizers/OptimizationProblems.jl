#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=C=Se TZVP+MP2
#   fitting Y to A0 T_0 + A2 T_2 + A4 T_4 + A6 T_6 + A8 T_8 +
#                A10 T_10 + A12 T_12 + A14 T_14
#   where T_i is the i-th (shifted) Chebyshev polynomial
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-6-0

export palmer5c

"A linear least squares problem arising from chemical kinetics."
function palmer5c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:6], start=1.0)

  X = [0.000000, 1.570796, 1.396263, 1.308997, 1.221730, 1.125835,
       1.047198, 0.872665, 0.698132, 0.523599, 0.349066, 0.174533]

  Y = [83.57418,  81.007654, 18.983286,  8.051067,  2.044762, 0.000000,
        1.170451, 10.479881, 25.785001, 44.126844, 62.822177, 77.719674]

  b = X[2]
  a = -b
  d = 2 * b

  t = zeros(12, 15)
  for k = 1:12
    t[k, 1] = 1.0
    t[k, 2] = (2 * X[k] - a - b) / d
    for l = 3:15
      t[k, l] = 2 * t[k, l-1] * (2 * X[k] - a - b) / d - t[k, l-2]
    end
  end

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * t[i,2*j-1] for j=1:6))^2 for i=1:12)
  )

  return nlp

end
