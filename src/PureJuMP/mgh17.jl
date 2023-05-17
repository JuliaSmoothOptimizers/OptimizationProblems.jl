
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh17.dat

NIST/ITL StRD
Dataset Name:  MGH17             (MGH17.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 45)
               Certified Values  (lines 41 to 50)
               Data              (lines 61 to 93)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very
               good algorithms.

               See More, J. J., Garbow, B. S., and Hillstrom, K. E.
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1):
               pp. 17-41.

Reference:     Osborne, M. R. (1972).  
               Some aspects of nonlinear least squares 
               calculations.  In Numerical Methods for Nonlinear 
               Optimization, Lootsma (Ed).  
               New York, NY:  Academic Press, pp. 171-189.

Data:          1 Response  (y)
               1 Predictor (x)
               33 Observations
               Average Level of Difficulty
               Generated Data

Model:         Exponential Class
               5 Parameters (b1 to b5)

               y = b1 + b2*exp[-x*b4] + b3*exp[-x*b5]  +  e
=#
# T. Migot, Montreal, 2023.

export mgh17

function mgh17(args...; kwargs...)
  y = Rational{Int}[
    8.440000E-01 0.000000E+00
    9.080000E-01 1.000000E+01
    9.320000E-01 2.000000E+01
    9.360000E-01 3.000000E+01
    9.250000E-01 4.000000E+01
    9.080000E-01 5.000000E+01
    8.810000E-01 6.000000E+01
    8.500000E-01 7.000000E+01
    8.180000E-01 8.000000E+01
    7.840000E-01 9.000000E+01
    7.510000E-01 1.000000E+02
    7.180000E-01 1.100000E+02
    6.850000E-01 1.200000E+02
    6.580000E-01 1.300000E+02
    6.280000E-01 1.400000E+02
    6.030000E-01 1.500000E+02
    5.800000E-01 1.600000E+02
    5.580000E-01 1.700000E+02
    5.380000E-01 1.800000E+02
    5.220000E-01 1.900000E+02
    5.060000E-01 2.000000E+02
    4.900000E-01 2.100000E+02
    4.780000E-01 2.200000E+02
    4.670000E-01 2.300000E+02
    4.570000E-01 2.400000E+02
    4.480000E-01 2.500000E+02
    4.380000E-01 2.600000E+02
    4.310000E-01 2.700000E+02
    4.240000E-01 2.800000E+02
    4.200000E-01 2.900000E+02
    4.140000E-01 3.000000E+02
    4.110000E-01 3.100000E+02
    4.060000E-01 3.200000E+02
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:5])
  set_start_value.(x, [50, 150, -100, 1, 2]) # other: [0.5, 1.5, -1, 0.01, 0.02]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum(
      (y[i, 1] - (x[1] + x[2] * exp(-y[i, 2] * x[4]) + x[3] * exp(-y[i, 2] * x[5])))^2 for i = 1:14
    )
  )

  return nlp
end
