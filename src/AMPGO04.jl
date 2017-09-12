# A one dimensional optimization problem
#
# Problem 4 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO04

"Univariate multimodal minimization problem AMPGO04"
function AMPGO04(args...)
  nlp = Model()

  @variable(nlp, x, start=1.9)

  @NLobjective(
    nlp,
    Min,
    -(16 * x^2 - 24 * x + 5) * exp(-x)
  )

  return nlp
end
