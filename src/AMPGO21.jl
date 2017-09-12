# A one dimensional optimization problem
#
# Problem 21 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO21

"Univariate multimodal minimization problem AMPGO21"
function AMPGO21(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    (x * sin(x)) + (x * cos(2 * x))
  )

  return nlp
end
