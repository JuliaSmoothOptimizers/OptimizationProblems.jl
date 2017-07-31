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

export palmer7c

"A linear least squares problem arising from chemical kinetics."
function palmer7c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:8], start=1.0)

  X = [0.000000, 0.139626, 0.261799, 0.436332, 0.565245, 0.512942,
       0.610865, 0.785398, 0.959931, 1.134464, 1.308997, 1.483530, 1.658063]

  Y = [4.419446, 3.564931,  2.139067,  0.404686,  0.000000,   0.035152, 0.146813,
       2.718058, 9.474417, 26.132221, 41.451561, 72.283164, 117.630959]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:8))^2 for i=1:13)
  )

  return nlp

end
