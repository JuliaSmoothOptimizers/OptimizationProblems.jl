
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/nelson.dat

NIST/ITL StRD
Dataset Name:  Nelson            (Nelson.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 188)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a study involving
               the analysis of performance degradation data from
               accelerated tests, published in IEEE Transactions
               on Reliability.  The response variable is dialectric
               breakdown strength in kilo-volts, and the predictor
               variables are time in weeks and temperature in degrees
               Celcius.

Reference:     Nelson, W. (1981).  
               Analysis of Performance-Degradation Data.  
               IEEE Transactions on Reliability.
               Vol. 2, R-30, No. 2, pp. 149-155.

Data:          1 Response   ( y = dialectric breakdown strength) 
               2 Predictors (x1 = time; x2 = temperature)
               128 Observations
               Average Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               log[y] = b1 - b2*x1 * exp[-b3*x2]  +  e
=#
# T. Migot, Montreal, 2023.

export nelson

function nelson(args...; kwargs...)
  y = Rational{Int}[
    15.00E0 1E0 180E0
    17.00E0 1E0 180E0
    15.50E0 1E0 180E0
    16.50E0 1E0 180E0
    15.50E0 1E0 225E0
    15.00E0 1E0 225E0
    16.00E0 1E0 225E0
    14.50E0 1E0 225E0
    15.00E0 1E0 250E0
    14.50E0 1E0 250E0
    12.50E0 1E0 250E0
    11.00E0 1E0 250E0
    14.00E0 1E0 275E0
    13.00E0 1E0 275E0
    14.00E0 1E0 275E0
    11.50E0 1E0 275E0
    14.00E0 2E0 180E0
    16.00E0 2E0 180E0
    13.00E0 2E0 180E0
    13.50E0 2E0 180E0
    13.00E0 2E0 225E0
    13.50E0 2E0 225E0
    12.50E0 2E0 225E0
    12.50E0 2E0 225E0
    12.50E0 2E0 250E0
    12.00E0 2E0 250E0
    11.50E0 2E0 250E0
    12.00E0 2E0 250E0
    13.00E0 2E0 275E0
    11.50E0 2E0 275E0
    13.00E0 2E0 275E0
    12.50E0 2E0 275E0
    13.50E0 4E0 180E0
    17.50E0 4E0 180E0
    17.50E0 4E0 180E0
    13.50E0 4E0 180E0
    12.50E0 4E0 225E0
    12.50E0 4E0 225E0
    15.00E0 4E0 225E0
    13.00E0 4E0 225E0
    12.00E0 4E0 250E0
    13.00E0 4E0 250E0
    12.00E0 4E0 250E0
    13.50E0 4E0 250E0
    10.00E0 4E0 275E0
    11.50E0 4E0 275E0
    11.00E0 4E0 275E0
    9.50E0 4E0 275E0
    15.00E0 8E0 180E0
    15.00E0 8E0 180E0
    15.50E0 8E0 180E0
    16.00E0 8E0 180E0
    13.00E0 8E0 225E0
    10.50E0 8E0 225E0
    13.50E0 8E0 225E0
    14.00E0 8E0 225E0
    12.50E0 8E0 250E0
    12.00E0 8E0 250E0
    11.50E0 8E0 250E0
    11.50E0 8E0 250E0
    6.50E0 8E0 275E0
    5.50E0 8E0 275E0
    6.00E0 8E0 275E0
    6.00E0 8E0 275E0
    18.50E0 16E0 180E0
    17.00E0 16E0 180E0
    15.30E0 16E0 180E0
    16.00E0 16E0 180E0
    13.00E0 16E0 225E0
    14.00E0 16E0 225E0
    12.50E0 16E0 225E0
    11.00E0 16E0 225E0
    12.00E0 16E0 250E0
    12.00E0 16E0 250E0
    11.50E0 16E0 250E0
    12.00E0 16E0 250E0
    6.00E0 16E0 275E0
    6.00E0 16E0 275E0
    5.00E0 16E0 275E0
    5.50E0 16E0 275E0
    12.50E0 32E0 180E0
    13.00E0 32E0 180E0
    16.00E0 32E0 180E0
    12.00E0 32E0 180E0
    11.00E0 32E0 225E0
    9.50E0 32E0 225E0
    11.00E0 32E0 225E0
    11.00E0 32E0 225E0
    11.00E0 32E0 250E0
    10.00E0 32E0 250E0
    10.50E0 32E0 250E0
    10.50E0 32E0 250E0
    2.70E0 32E0 275E0
    2.70E0 32E0 275E0
    2.50E0 32E0 275E0
    2.40E0 32E0 275E0
    13.00E0 48E0 180E0
    13.50E0 48E0 180E0
    16.50E0 48E0 180E0
    13.60E0 48E0 180E0
    11.50E0 48E0 225E0
    10.50E0 48E0 225E0
    13.50E0 48E0 225E0
    12.00E0 48E0 225E0
    7.00E0 48E0 250E0
    6.90E0 48E0 250E0
    8.80E0 48E0 250E0
    7.90E0 48E0 250E0
    1.20E0 48E0 275E0
    1.50E0 48E0 275E0
    1.00E0 48E0 275E0
    1.50E0 48E0 275E0
    13.00E0 64E0 180E0
    12.50E0 64E0 180E0
    16.50E0 64E0 180E0
    16.00E0 64E0 180E0
    11.00E0 64E0 225E0
    11.50E0 64E0 225E0
    10.50E0 64E0 225E0
    10.00E0 64E0 225E0
    7.27E0 64E0 250E0
    7.50E0 64E0 250E0
    6.70E0 64E0 250E0
    7.60E0 64E0 250E0
    1.50E0 64E0 275E0
    1.00E0 64E0 275E0
    1.20E0 64E0 275E0
    1.20E0 64E0 275E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [2, 0.0001, -0.01]) # other: [2.5, 0.000000005, -0.05]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((log(y[i, 1]) - (x[1] - x[2] * y[i, 2] * exp(-x[3] * y[i, 3])))^2 for i = 1:128)
  )

  return nlp
end
