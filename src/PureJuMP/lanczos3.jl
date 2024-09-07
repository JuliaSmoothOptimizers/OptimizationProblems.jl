
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/lanczos3.dat

NIST/ITL StRD
Dataset Name:  Lanczos3          (Lanczos3.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 46)
               Certified Values  (lines 41 to 51)
               Data              (lines 61 to 84)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are taken from an example discussed in
               Lanczos (1956).  The data were generated to 5-digits
               of accuracy using
               f(x) = 0.0951*exp(-x) + 0.8607*exp(-3*x) 
                                     + 1.5576*exp(-5*x).

Reference:     Lanczos, C. (1956).
               Applied Analysis.
               Englewood Cliffs, NJ:  Prentice Hall, pp. 272-280.

Data:          1 Response  (y)
               1 Predictor (x)
               24 Observations
               Lower Level of Difficulty
               Generated Data

Model:         Exponential Class
               6 Parameters (b1 to b6)

               y = b1*exp(-b2*x) + b3*exp(-b4*x) + b5*exp(-b6*x)  +  e

=#
# T. Migot, Montreal, 2023.

export lanczos3

function lanczos3(args...; kwargs...)
  y = Rational{Int}[
    2.5134E+00 0.00000E+00
    2.0443E+00 5.00000E-02
    1.6684E+00 1.00000E-01
    1.3664E+00 1.50000E-01
    1.1232E+00 2.00000E-01
    0.9269E+00 2.50000E-01
    0.7679E+00 3.00000E-01
    0.6389E+00 3.50000E-01
    0.5338E+00 4.00000E-01
    0.4479E+00 4.50000E-01
    0.3776E+00 5.00000E-01
    0.3197E+00 5.50000E-01
    0.2720E+00 6.00000E-01
    0.2325E+00 6.50000E-01
    0.1997E+00 7.00000E-01
    0.1723E+00 7.50000E-01
    0.1493E+00 8.00000E-01
    0.1301E+00 8.50000E-01
    0.1138E+00 9.00000E-01
    0.1000E+00 9.50000E-01
    0.0883E+00 1.00000E+00
    0.0783E+00 1.05000E+00
    0.0698E+00 1.10000E+00
    0.0624E+00 1.15000E+00
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
