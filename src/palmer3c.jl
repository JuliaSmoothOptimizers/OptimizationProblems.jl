#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=C=S TZVP+MP2
#   fitting Y to A0 + A2 X**2 + A4 X**4 + A6 X**6 + A8 X**8 +
#                A10 X**10 + A12 X**12 + A14 X**14
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-8-0

export palmer3c

"A linear least squares problem arising from chemical kinetics."
function palmer3c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:8], start=1.0)

  X = [-1.658063, -1.570796, -1.396263, -1.221730, -1.047198, -0.872665,
       -0.766531, -0.698132, -0.523599, -0.349066, -0.174533,  0.0,
        0.174533,  0.349066,  0.523599,  0.698132,  0.766531,  0.872665,
        1.047198,  1.221730,  1.396263,  1.570796,  1.658063]

  Y = [64.87939, 50.46046, 28.2034, 13.4575,   4.6547, 0.59447,
        0.0000,   0.2177,   2.3029,  5.5191,   8.5519, 9.8919,
        8.5519,   5.5191,   2.3029,  0.2177,   0.0000, 0.59447,
        4.6547,  13.4575,  28.2034, 50.46046, 64.87939]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:8))^2 for i=1:23)
  )

  return nlp

end
