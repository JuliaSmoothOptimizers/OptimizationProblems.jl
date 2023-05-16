
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/danwood.dat

NIST/ITL StRD
Dataset Name:  DanWood           (DanWood.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 66)

Procedure:     Nonlinear Least Squares Regression

Description:   These data and model are described in Daniel and Wood
               (1980), and originally published in E.S.Keeping, 
               "Introduction to Statistical Inference," Van Nostrand
               Company, Princeton, NJ, 1962, p. 354.  The response
               variable is energy radieted from a carbon filament
               lamp per cm**2 per second, and the predictor variable
               is the absolute temperature of the filament in 1000
               degrees Kelvin.

Reference:     Daniel, C. and F. S. Wood (1980).
               Fitting Equations to Data, Second Edition. 
               New York, NY:  John Wiley and Sons, pp. 428-431.


Data:          1 Response Variable  (y = energy)
               1 Predictor Variable (x = temperature)
               6 Observations
               Lower Level of Difficulty
               Observed Data

Model:         Miscellaneous Class
               2 Parameters (b1 and b2)

               y  = b1*x**b2  +  e
=#
# T. Migot, Montreal, 2023.

export danwood

function danwood(args...; kwargs...)

  y = Rational{Int}[
    2.138E0        1.309E0
    3.421E0        1.471E0
    3.597E0        1.490E0
    4.340E0        1.565E0
    4.882E0        1.611E0
    5.660E0        1.680E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [1, 5]) # other: [0.7, 4]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - x[1]* y[i, 1]^(x[2]))^2 for i = 1:6)
  )

  return nlp
end
