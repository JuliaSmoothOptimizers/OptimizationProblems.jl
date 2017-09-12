# A one dimensional optimization problem
#
# Problem 11 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO11

"Univariate multimodal minimization problem AMPGO11"
function AMPGO11(args...)
  nlp = Model()

  @variable(nlp, x, start=-pi)

  @NLobjective(
    nlp,
    Min,
    2 * cos(x) + cos(2 * x)
  )

  return nlp
end
