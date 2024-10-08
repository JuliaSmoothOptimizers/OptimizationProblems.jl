
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/lanczos2.dat

Dataset Name:  Lanczos2          (Lanczos2.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 46)
               Certified Values  (lines 41 to 51)
               Data              (lines 61 to 84)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are taken from an example discussed in
               Lanczos (1956).  The data were generated to 6-digits
               of accuracy using
               f(x) = 0.0951*exp(-x) + 0.8607*exp(-3*x) 
                                     + 1.5576*exp(-5*x).

Reference:     Lanczos, C. (1956).
               Applied Analysis.
               Englewood Cliffs, NJ:  Prentice Hall, pp. 272-280.

Data:          1 Response  (y)
               1 Predictor (x)
               24 Observations
               Average Level of Difficulty
               Generated Data

Model:         Exponential Class
               6 Parameters (b1 to b6)

               y = b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x)  +  e
=#
# T. Migot, Montreal, 2023.

export lanczos2

function lanczos2(args...; kwargs...)
  y = Rational{Int}[
    2.51340E+00 0.00000E+00
    2.04433E+00 5.00000E-02
    1.66840E+00 1.00000E-01
    1.36642E+00 1.50000E-01
    1.12323E+00 2.00000E-01
    9.26890E-01 2.50000E-01
    7.67934E-01 3.00000E-01
    6.38878E-01 3.50000E-01
    5.33784E-01 4.00000E-01
    4.47936E-01 4.50000E-01
    3.77585E-01 5.00000E-01
    3.19739E-01 5.50000E-01
    2.72013E-01 6.00000E-01
    2.32497E-01 6.50000E-01
    1.99659E-01 7.00000E-01
    1.72270E-01 7.50000E-01
    1.49341E-01 8.00000E-01
    1.30070E-01 8.50000E-01
    1.13812E-01 9.00000E-01
    1.00042E-01 9.50000E-01
    8.83321E-02 1.00000E+00
    7.83354E-02 1.05000E+00
    6.97669E-02 1.10000E+00
    6.23931E-02 1.15000E+00
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:6])
  set_start_value.(x, [1.2, 0.3, 5.6, 5.5, 6.5, 7.6]) # other: [0.5, 0.7, 3.6, 4.2, 4, 6.3]

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (
        y[i, 1] -
        (x[1] * exp(-x[2] * y[i, 2]) + x[3] * exp(-x[4] * y[i, 2]) + x[5] * exp(-x[6] * y[i, 2]))
      )^2 for i = 1:24
    )
  )

  return nlp
end
