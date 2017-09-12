# A one dimensional optimization problem
#
# Problem 2 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO02

"Univariate multimodal minimization problem AMPGO02"
function AMPGO02(args...)
  nlp = Model()

  @variable(nlp, x, start=2.7)

  @NLobjective(
    nlp,
    Min,
    sin(x) + sin((10.0 / 3.0) * x)
  )

  return nlp
end
