
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/mgh09.dat

NIST/ITL StRD
Dataset Name:  MGH09             (MGH09.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 44)
               Certified Values  (lines 41 to 49)
               Data              (lines 61 to 71)

Procedure:     Nonlinear Least Squares Regression

Description:   This problem was found to be difficult for some very 
               good algorithms.  There is a local minimum at (+inf,
               -14.07..., -inf, -inf) with final sum of squares 
               0.00102734....

               See More, J. J., Garbow, B. S., and Hillstrom, K. E. 
               (1981).  Testing unconstrained optimization software.
               ACM Transactions on Mathematical Software. 7(1): 
               pp. 17-41.

Reference:     Kowalik, J.S., and M. R. Osborne, (1978).  
               Methods for Unconstrained Optimization Problems.  
               New York, NY:  Elsevier North-Holland.

Data:          1 Response  (y)
               1 Predictor (x)
               11 Observations
               Higher Level of Difficulty
               Generated Data

Model:         Rational Class (linear/quadratic)
               4 Parameters (b1 to b4)

               y = b1*(x**2+x*b2) / (x**2+x*b3+b4)  +  e
=#

export mgh09

function mgh09(args...; kwargs...)
  y = Rational{Int}[
    1957//10000 4
    1947//10000 2
    1735//10000 1
    1600//10000 05000//10000
    08440//100000 2500//10000
    06270//100000 1670//10000
    4560//100000 1250//10000
    3420//100000 1000//10000
    3230//100000 8330//100000
    2350//100000 07140//100000
    2460//100000 06250//100000
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:4])
  set_start_value.(x, [25, 39, 41.5, 39]) # other: [0.25, 0.39, 0.415, 0.39]

  @objective(
    nlp,
    Min,
    0.5 * sum(
      (y[i, 1] - (x[1] * (y[i, 2]^2 + y[i, 2] * x[2]) / (y[i, 2]^2 + y[i, 2] * x[3] + x[4])))^2 for
      i = 1:11
    )
  )

  return nlp
end
