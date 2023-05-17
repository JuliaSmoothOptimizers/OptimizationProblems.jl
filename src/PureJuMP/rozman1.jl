
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rozman1.dat

NIST/ITL StRD
Dataset Name:  Roszman1          (Roszman1.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 85)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               quantum defects in iodine atoms.  The response
               variable is the number of quantum defects, and the
               predictor variable is the excited energy state.
               The argument to the ARCTAN function is in radians.

Reference:     Roszman, L., NIST (19??).  
               Quantum Defects for Sulfur I Atom.

Data:          1 Response  (y = quantum defect)
               1 Predictor (x = excited state energy)
               25 Observations
               Average Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               4 Parameters (b1 to b4)

               pi = 3.141592653589793238462643383279E0
               y =  b1 - b2*x - arctan[b3/(x-b4)]/pi  +  e
=#

export rozman1

function rozman1(args...; kwargs...)
  y = Rational{Int}[
    0.252429 -4868.68
    0.252141 -4868.09
    0.251809 -4867.41
    0.297989 -3375.19
    0.296257 -3373.14
    0.295319 -3372.03
    0.339603 -2473.74
    0.337731 -2472.35
    0.333820 -2469.45
    0.389510 -1894.65
    0.386998 -1893.40
    0.438864 -1497.24
    0.434887 -1495.85
    0.427893 -1493.41
    0.471568 -1208.68
    0.461699 -1206.18
    0.461144 -1206.04
    0.513532 -997.92
    0.506641 -996.61
    0.505062 -996.31
    0.535648 -834.94
    0.533726 -834.66
    0.568064 -710.03
    0.612886 -530.16
    0.624169 -464.17
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:4])
  set_start_value.(x, [0.1, -0.00001, 1000, -100]) # other: [0.2, -0.000005, 1200, -150]

  @NLobjective(
    nlp,
    Min,
    0.5 *
    sum((y[i, 1] - (x[1] - x[2] * y[i, 2] - atan(x[3] / (y[i, 2] - x[4])) / pi))^2 for i = 1:25)
  )

  return nlp
end
