
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/chwirut2.dat

NIST/ITL StRD
Dataset Name:  Chwirut2          (Chwirut2.dat)

File Format:   ASCII
               Starting Values   (lines 41 to  43)
               Certified Values  (lines 41 to  48)
               Data              (lines 61 to 114)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               ultrasonic calibration.  The response variable is
               ultrasonic response, and the predictor variable is
               metal distance.



Reference:     Chwirut, D., NIST (197?).  
               Ultrasonic Reference Block Study. 





Data:          1 Response  (y = ultrasonic response)
               1 Predictor (x = metal distance)
               54 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = exp(-b1*x)/(b2+b3*x)  +  e

=#
# T. Migot, Montreal, 2023.

export chwirut2

function chwirut2(args...; kwargs...)

  y = Rational{Int}[
    92.9000E0     0.500E0
    57.1000E0     1.000E0
    31.0500E0     1.750E0
    11.5875E0     3.750E0
     8.0250E0     5.750E0
    63.6000E0     0.875E0
    21.4000E0     2.250E0
    14.2500E0     3.250E0
     8.4750E0     5.250E0
    63.8000E0     0.750E0
    26.8000E0     1.750E0
    16.4625E0     2.750E0
     7.1250E0     4.750E0
    67.3000E0     0.625E0
    41.0000E0     1.250E0
    21.1500E0     2.250E0
     8.1750E0     4.250E0
    81.5000E0      .500E0
    13.1200E0     3.000E0
    59.9000E0      .750E0
    14.6200E0     3.000E0
    32.9000E0     1.500E0
     5.4400E0     6.000E0
    12.5600E0     3.000E0
     5.4400E0     6.000E0
    32.0000E0     1.500E0
    13.9500E0     3.000E0
    75.8000E0      .500E0
    20.0000E0     2.000E0
    10.4200E0     4.000E0
    59.5000E0      .750E0
    21.6700E0     2.000E0
     8.5500E0     5.000E0
    62.0000E0      .750E0
    20.2000E0     2.250E0
     7.7600E0     3.750E0
     3.7500E0     5.750E0
    11.8100E0     3.000E0
    54.7000E0      .750E0
    23.7000E0     2.500E0
    11.5500E0     4.000E0
    61.3000E0      .750E0
    17.7000E0     2.500E0
     8.7400E0     4.000E0
    59.2000E0      .750E0
    16.3000E0     2.500E0
     8.6200E0     4.000E0
    81.0000E0      .500E0
     4.8700E0     6.000E0
    14.6200E0     3.000E0
    81.7000E0      .500E0
    17.1700E0     2.750E0
    81.3000E0      .500E0
    28.9000E0     1.750E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [0.1, 0.01, 0.02]) # other [0.15, 0.008, 0.010]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - exp(- y[i, 2] * x[1]) / exp(x[2] + x[3] * y[i, 2] ))^2 for i = 1:54)
  )

  return nlp
end
