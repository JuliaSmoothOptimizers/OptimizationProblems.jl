
#=
https://www.itl.nist.gov/div898/strd/nls/data/LINKS/DATA/eckerle4.dat

NIST/ITL StRD
Dataset Name:  Eckerle4          (Eckerle4.dat)

File Format:   ASCII
               Starting Values   (lines 41 to 43)
               Certified Values  (lines 41 to 48)
               Data              (lines 61 to 95)

Procedure:     Nonlinear Least Squares Regression

Description:   These data are the result of a NIST study involving
               circular interference transmittance.  The response
               variable is transmittance, and the predictor variable
               is wavelength.


Reference:     Eckerle, K., NIST (197?).  
               Circular Interference Transmittance Study.






Data:          1 Response Variable  (y = transmittance)
               1 Predictor Variable (x = wavelength)
               35 Observations
               Higher Level of Difficulty
               Observed Data

Model:         Exponential Class
               3 Parameters (b1 to b3)

               y = (b1/b2) * exp[-0.5*((x-b3)/b2)**2]  +  e
=#

export eckerle4

function eckerle4(args...; kwargs...)

  y = Rational{Int}[
    0.0001575E0    400.000000E0
    0.0001699E0    405.000000E0
    0.0002350E0    410.000000E0
    0.0003102E0    415.000000E0
    0.0004917E0    420.000000E0
    0.0008710E0    425.000000E0
    0.0017418E0    430.000000E0
    0.0046400E0    435.000000E0
    0.0065895E0    436.500000E0
    0.0097302E0    438.000000E0
    0.0149002E0    439.500000E0
    0.0237310E0    441.000000E0
    0.0401683E0    442.500000E0
    0.0712559E0    444.000000E0
    0.1264458E0    445.500000E0
    0.2073413E0    447.000000E0
    0.2902366E0    448.500000E0
    0.3445623E0    450.000000E0
    0.3698049E0    451.500000E0
    0.3668534E0    453.000000E0
    0.3106727E0    454.500000E0
    0.2078154E0    456.000000E0
    0.1164354E0    457.500000E0
    0.0616764E0    459.000000E0
    0.0337200E0    460.500000E0
    0.0194023E0    462.000000E0
    0.0117831E0    463.500000E0
    0.0074357E0    465.000000E0
    0.0022732E0    470.000000E0
    0.0008800E0    475.000000E0
    0.0004579E0    480.000000E0
    0.0002345E0    485.000000E0
    0.0001586E0    490.000000E0
    0.0001143E0    495.000000E0
    0.0000710E0    500.000000E0
  ]

  nlp = Model()

  @variable(nlp, x[j = 1:3])
  set_start_value.(x, [1, 10, 500]) # other: [1.5, 5, 450]

  @NLobjective(
    nlp,
    Min,
    0.5 * sum((y[i, 1] - ( x[1] / x[2] * exp(-0.5*((y[i, 2] - x[3]) / x[2])^2) ))^2 for i = 1:35)
  )

  return nlp
end
