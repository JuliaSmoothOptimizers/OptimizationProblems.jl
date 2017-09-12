# A one dimensional optimization problem
#
# Problem 6 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO06

"Univariate multimodal minimization problem AMPGO06"
function AMPGO06(args...)
  nlp = Model()

  @variable(nlp, x, start=-10.0)

  @NLobjective(
    nlp,
    Min,
    -(x + sin(x)) * exp(-x^2)
  )

  return nlp
end
