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

export palmer8c

"A linear least squares problem arising from chemical kinetics."
function palmer8c(args...)

  nlp = Model()

  @variable(nlp, x[j=1:8], start=1.0)

  X = [0.000000, 0.174533, 0.314159, 0.436332, 0.514504, 0.610865,
       0.785398, 0.959931, 1.134464, 1.308997, 1.483530, 1.570796]

  Y = [4.757534,  3.121416,  1.207606,  0.131916,  0.000000,  0.258514,
       3.380161, 10.762813, 23.745996, 44.471864, 76.541947, 97.874528]

  @NLobjective(
    nlp,
    Min,
    sum((Y[i] - sum(x[j] * X[i]^(2*j-2) for j=1:8))^2 for i=1:12)
  )

  return nlp

end
