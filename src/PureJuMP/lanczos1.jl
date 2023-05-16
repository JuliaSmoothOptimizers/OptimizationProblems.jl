
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/lanczos1.dat

NIST/ITL StRD
Dataset Name:  lanczos1           (lanczos1.dat)

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
# T. Migot, Montreal, 2023.

export lanczos1

function lanczos1(args...; kwargs...)

  y = Rational{Int}[
    2.513400000000E+00  0.000000000000E+00
    2.044333373291E+00  5.000000000000E-02
    1.668404436564E+00  1.000000000000E-01
    1.366418021208E+00  1.500000000000E-01
    1.123232487372E+00  2.000000000000E-01
    9.268897180037E-01  2.500000000000E-01
    7.679338563728E-01  3.000000000000E-01
    6.388775523106E-01  3.500000000000E-01
    5.337835317402E-01  4.000000000000E-01
    4.479363617347E-01  4.500000000000E-01
    3.775847884350E-01  5.000000000000E-01
    3.197393199326E-01  5.500000000000E-01
    2.720130773746E-01  6.000000000000E-01
    2.324965529032E-01  6.500000000000E-01
    1.996589546065E-01  7.000000000000E-01
    1.722704126914E-01  7.500000000000E-01
    1.493405660168E-01  8.000000000000E-01
    1.300700206922E-01  8.500000000000E-01
    1.138119324644E-01  9.000000000000E-01
    1.000415587559E-01  9.500000000000E-01
    8.833209084540E-02  1.000000000000E+00
    7.833544019350E-02  1.050000000000E+00
    6.976693743449E-02  1.100000000000E+00
    6.239312536719E-02  1.150000000000E+00
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:6])
  set_start_value.(x, [1.2, 0.3, 5.6, 5.5, 6.5, 7.6]) # other: [0.5, 0.7, 3.6, 4.2, 4, 6.3]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - (x[1]*exp(-x[2]* y[i, 2]) + x[3]*exp(-x[4]* y[i, 2]) + x[5]*exp(-x[6]*y[i, 2])))^2 for i = 1:24)
  )

  return nlp
end
