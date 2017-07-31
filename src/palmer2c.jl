#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=C=O TZVP+MP2
#   fitting Y to A0 + A2 X**2 + A4 X**4 + A6 X**6 + A8 X**8 +
#                A10 X**10 + A12 X**12 + A14 X**14
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-8-0

export palmer2c

"A linear least squares problem arising from chemical kinetics."
function palmer2c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:8], start=1.0)

  X = [-1.745329, -1.570796, -1.396263, -1.221730, -1.047198, -0.937187,
       -0.872665, -0.698132, -0.523599, -0.349066, -0.174533,  0.0,
        0.174533,  0.349066,  0.523599,  0.698132,  0.872665,  0.937187,
        1.047198,  1.221730,  1.396263,  1.570796,  1.745329]

  Y = [72.676767, 40.149455, 18.8548,  6.4762,    0.8596,  0.00000,
        0.2730,    3.2043,    8.1080, 13.4291,   17.714,  19.4529,
       17.7149,   13.4291,    8.1080,  3.2053,    0.2730,  0.00000,
        0.8596,    6.4762,   18.8548, 40.149455, 72.676767]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:8))^2 for i=1:23)
  )

  return nlp

end
