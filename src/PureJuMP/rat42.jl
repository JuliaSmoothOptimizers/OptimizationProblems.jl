
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rat42.dat

NIST/ITL StRD
Dataset Name:  Rat42             (Rat42.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 69)

Procedure:     Nonlinear Least Squares Regression

Description:   This model and data are an example of fitting
               sigmoidal growth curves taken from Ratkowsky (1983).
               The response variable is pasture yield, and the
               predictor variable is growing time.


Reference:     Ratkowsky, D.A. (1983).  
               Nonlinear Regression Modeling.
               New York, NY:  Marcel Dekker, pp. 61 and 88.





Data:          1 Response  (y = pasture yield)
               1 Predictor (x = growing time)
               9 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = b1 / (1+exp[b2-b3*x])  +  e
=#

export rat42

function rat42(args...; kwargs...)

  y = Rational{Int}[
    8.930E0        9.000E0
    10.800E0       14.000E0
    18.590E0       21.000E0
    22.330E0       28.000E0
    39.350E0       42.000E0
    56.110E0       57.000E0
    61.730E0       63.000E0
    64.620E0       70.000E0
    67.080E0       79.000E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [100, 1, 0.1]) # other: [75, 2.5, 0.07]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - x[1] / (1 + exp(x[2] - x[3] * y[i, 2])))^2 for i = 1:9)
  )

  return nlp
end
