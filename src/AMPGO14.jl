# A one dimensional optimization problem
#
# Problem 14 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO14

"Univariate multimodal minimization problem AMPGO14"
function AMPGO14(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    -exp(-x) * sin(2 * pi * x)
  )

  return nlp
end
