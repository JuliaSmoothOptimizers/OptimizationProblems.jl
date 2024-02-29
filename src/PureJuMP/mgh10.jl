
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh10.dat

NIST/ITL StRD
Dataset Name:  MGH10             (MGH10.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 76)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very
               good algorithms.

               See More, J. J., Garbow, B. S., and Hillstrom, K. E. 
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1): 
               pp. 17-41.

Reference:     Meyer, R. R. (1970).  
               Theoretical and computational aspects of nonlinear 
               regression.  In Nonlinear Programming, Rosen, 
               Mangasarian and Ritter (Eds).  
               New York, NY: Academic Press, pp. 465-486.

Data:          1 Response  (y)
               1 Predictor (x)
               16 Observations
               Higher Level of Difficulty
               Generated Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = b1 * exp[b2/(x+b3)]  +  e
=#

export mgh10

function mgh10(args...; kwargs...)
  y = Rational{Int}[
    3.478000E+04 5.000000E+01
    2.861000E+04 5.500000E+01
    2.365000E+04 6.000000E+01
    1.963000E+04 6.500000E+01
    1.637000E+04 7.000000E+01
    1.372000E+04 7.500000E+01
    1.154000E+04 8.000000E+01
    9.744000E+03 8.500000E+01
    8.261000E+03 9.000000E+01
    7.030000E+03 9.500000E+01
    6.005000E+03 1.000000E+02
    5.147000E+03 1.050000E+02
    4.427000E+03 1.100000E+02
    3.820000E+03 1.150000E+02
    3.307000E+03 1.200000E+02
    2.872000E+03 1.250000E+02
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [2, 400000, 25000])
  # alternative: [0.02, 4000, 250]

  @objective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] * exp(x[2] / (x[3] + y[i, 2])))^2 for i = 1:16))

  return nlp
end
