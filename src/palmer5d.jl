#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=C=Se TZVP+MP2
#   fitting Y to to A0 + A2 X**2 + A4 X**4 + A6 X**6
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-4-0

export palmer5d

"A linear least squares problem arising from chemical kinetics."
function palmer5d(args...)

  nlp = Model()

  @variable(nlp, x[j=1:4], start=1.0)

  X = [0.000000, 1.570796, 1.396263, 1.308997, 1.221730, 1.125835,
       1.047198, 0.872665, 0.698132, 0.523599, 0.349066, 0.174533]

  Y = [83.57418,  81.007654, 18.983286,  8.051067,  2.044762,  0.000000,
        1.170451, 10.479881, 25.785001, 44.126844, 62.822177, 77.719674]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:4))^2 for i=1:12)
  )

  return nlp

end
