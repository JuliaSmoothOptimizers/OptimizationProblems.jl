# A one dimensional optimization problem
#
# Problem 10 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO10

"Univariate multimodal minimization problem AMPGO10"
function AMPGO10(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    -x * sin(x)
  )

  return nlp
end
