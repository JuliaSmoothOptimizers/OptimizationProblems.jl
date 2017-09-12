# A one dimensional optimization problem
#
# Problem 5 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017
export AMPGO05

"Univariate multimodal minimization problem AMPGO05"
function AMPGO05(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    - (1.4 - 3.0 * x) * sin(18.0 * x)
  )

  return nlp
end
