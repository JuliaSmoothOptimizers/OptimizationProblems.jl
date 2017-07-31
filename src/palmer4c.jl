#   A linear least squares problem
#   arising from chemical kinetics.
#
#   model: H-N=C=Se TZVP+MP2
#   fitting Y to A0 + A2 X**2 + A4 X**4 + A6 X**6 + A8 X**8 +
#                A10 X**10 + A12 X**12 + A14 X**14
#
#   Source:
#   M. Palmer, Edinburgh, private communication.
#
#   classification QUR2-RN-8-0

export palmer4c

"A linear least squares problem arising from chemical kinetics."
function palmer4c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:8], start=1.0)

  X = [-1.658063, -1.570796, -1.396263, -1.221730, -1.047198, -0.872665,
       -0.766531, -0.698132, -0.523599, -0.349066, -0.174533,  0.0,
        0.174533,  0.349066,  0.523599,  0.698132,  0.766531,  0.872665,
        1.047198,  1.221730,  1.396263,  1.570796,  1.658063]

  Y = [67.27625, 52.8537,  30.2718,  14.9888,   5.5675,   0.92603,
        0.0,      0.085108, 1.867422, 5.014768, 8.263520, 9.8046208,
        8.263520, 5.014768, 1.867422, 0.085108, 0.0,      0.92603,
        5.5675,  14.9888,  30.2718,  52.8537,  67.27625]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:8))^2 for i=1:23)
  )

  return nlp

end
