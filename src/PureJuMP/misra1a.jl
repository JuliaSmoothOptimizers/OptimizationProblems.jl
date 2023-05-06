
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/misra1a.dat

NIST/ITL StRD
Dataset Name:  misra1a           (misra1a.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 74)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study regarding
               dental research in monomolecular adsorption.  The
               response variable is volume, and the predictor
               variable is pressure.

Reference:     Misra, D., NIST (1978).  
               Dental Research Monomolecular Adsorption Study.

Data:          1 Response Variable  (y = volume)
               1 Predictor Variable (x = pressure)
               14 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Exponential Class
               2 Parameters (b1 and b2)

               y = b1*(1-exp[-b2*x])  +  e
=#

export misra1a

function misra1a(args...; kwargs...)
  y = Rational{Int}[
    10.07E0 77.6E0
    14.73E0 114.9E0
    17.94E0 141.1E0
    23.93E0 190.8E0
    29.61E0 239.9E0
    35.18E0 289.0E0
    40.02E0 332.8E0
    44.82E0 378.4E0
    50.76E0 434.8E0
    55.05E0 477.3E0
    61.01E0 536.8E0
    66.40E0 593.1E0
    75.47E0 689.1E0
    81.78E0 760.0E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [500, 0.0001])

  @NLobjective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2])))^2 for i = 1:14))

  return nlp
end
