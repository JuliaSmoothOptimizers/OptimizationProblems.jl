
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/thurber.dat

NIST/ITL StRD
Dataset Name:  Thurber           (Thurber.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 47)
               Certified Values  (lines 41 to 52)
               Data              (lines 61 to 97)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               semiconductor electron mobility.  The response 
               variable is a measure of electron mobility, and the 
               predictor variable is the natural log of the density.

Reference:     Thurber, R., NIST (197?).  
               Semiconductor electron mobility modeling.

Data:          1 Response Variable  (y = electron mobility)
               1 Predictor Variable (x = log[density])
               37 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Rational Class (cubic/cubic)
               7 Parameters (b1 to b7)

               y = (b1 + b2*x + b3*x**2 + b4*x**3) / 
                   (1 + b5*x + b6*x**2 + b7*x**3)  +  e
=#
# T. Migot, Montreal, 2023.

export thurber

function thurber(args...; kwargs...)
  y = Rational{Int}[
    80574//1000 -3067//1000
    84248//1000 -2981//1000
    87264//1000 -2921//1000
    87195//1000 -2912//1000
    89076//1000 -2840//1000
    89608//1000 -2797//1000
    89868//1000 -2702//1000
    90101//1000 -2699//1000
    92405//1000 -2633//1000
    95854//1000 -2481//1000
    100696//1000 -2363//1000
    101060//1000 -2322//1000
    401672//1000 -1501//1000
    390724//1000 -1460//1000
    567534//1000 -1274//1000
    635316//1000 -1212//1000
    733054//1000 -1100//1000
    759087//1000 -1046//1000
    894206//1000 -0915//1000
    990785//1000 -0714//1000
    1090109//1000 -0566//1000
    1080914//1000 -0545//1000
    1122643//1000 -0400//1000
    1178351//1000 -0309//1000
    1260531//1000 -0109//1000
    1273514//1000 -0103//1000
    1288339//1000 0010//1000
    1327543//1000 0119//1000
    1353863//1000 0377//1000
    1414509//1000 0790//1000
    1425208//1000 0963//1000
    1421384//1000 1006//1000
    1442962//1000 1115//1000
    1464350//1000 1572//1000
    1468705//1000 1841//1000
    1447894//1000 2047//1000
    1457628//1000 2200//1000
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:7])
  set_start_value.(x, [1000, 1000, 400, 40, 0.7, 0.3, 0.03])
  # other: [1300, 1500, 500, 75, 1, 0.4, 0.05]

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        y[i, 1] - (
          (x[1] + x[2] * y[i, 2] + x[3] * y[i, 2]^2 + x[4] * y[i, 2]^3) /
          (1 + x[5] * y[i, 2] + x[6] * y[i, 2]^2 + x[7] * y[i, 2]^3)
        )
      )^2 for i = 1:37
    )
  )

  return nlp
end
