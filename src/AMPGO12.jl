# A one dimensional optimization problem
#
# Problem 12 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO12

"Univariate multimodal minimization problem AMPGO12"
function AMPGO12(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    sin(x)^3 + cos(x)^3
  )

  return nlp
end
