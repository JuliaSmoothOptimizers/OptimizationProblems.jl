
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/rat43.dat

NIST/ITL StRD
Dataset Name:  Rat43             (Rat43.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 75)

Procedure:     Nonlinear Least Squares Regression

Description:   This model and data are an example of fitting  
               sigmoidal growth curves taken from Ratkowsky (1983).  
               The response variable is the dry weight of onion bulbs 
               and tops, and the predictor variable is growing time. 


Reference:     Ratkowsky, D.A. (1983).  
               Nonlinear Regression Modeling.
               New York, NY:  Marcel Dekker, pp. 62 and 88.





Data:          1 Response  (y = onion bulb dry weight)
               1 Predictor (x = growing time)
               15 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               4 Parameters (b1 to b4)

               y = b1 / ((1+exp[b2-b3*x])**(1/b4))  +  e
=#
# T. Migot, Montreal, 2023.

export rat43

function rat43(args...; kwargs...)

  y = Rational{Int}[
    16.08E0     1.0E0
    33.83E0     2.0E0
    65.80E0     3.0E0
    97.20E0     4.0E0
   191.55E0     5.0E0
   326.20E0     6.0E0
   386.87E0     7.0E0
   520.53E0     8.0E0
   590.03E0     9.0E0
   651.92E0    10.0E0
   724.93E0    11.0E0
   699.56E0    12.0E0
   689.96E0    13.0E0
   637.56E0    14.0E0
   717.41E0    15.0E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:4])
  set_start_value.(x, [100, 10, 1, 1]) # other: [700, 5, 0.75, 1.3]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - x[1] / ((1 + exp(x[2] - x[3] * y[i, 2]))^( 1 / x[4])))^2 for i = 1:15)
  )

  return nlp
end
