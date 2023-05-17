
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/boxbod.dat

NIST/ITL StRD
Dataset Name:  BoxBOD            (BoxBOD.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 42)
               Certified Values  (lines 41 to 47)
               Data              (lines 61 to 66)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are described in detail in Box, Hunter and
               Hunter (1978).  The response variable is biochemical
               oxygen demand (BOD) in mg/l, and the predictor
               variable is incubation time in days.

Reference:     Box, G. P., W. G. Hunter, and J. S. Hunter (1978).
               Statistics for Experimenters.  
               New York, NY: Wiley, pp. 483-487.

Data:          1 Response  (y = biochemical oxygen demand)
               1 Predictor (x = incubation time)
               6 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               2 Parameters (b1 and b2)

               y = b1*(1-exp[-b2*x])  +  e
=#
# T. Migot, Montreal, 2023.

export boxbod

function boxbod(args...; kwargs...)
  y = Rational{Int}[
    109 1
    149 2
    149 3
    191 5
    213 7
    224 10
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:2])
  set_start_value.(x, [1, 1]) # other: [100, 0.75]

  @NLobjective(nlp, Min, 0.5 * sum((y[i, 1] - x[1] * (1 - exp(-x[2] * y[i, 2])))^2 for i = 1:6))

  return nlp
end
