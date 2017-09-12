# A one dimensional optimization problem
#
# Problem 15 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO15

"Univariate multimodal minimization problem AMPGO15"
function AMPGO15(args...)
  nlp = Model()

  @variable(nlp, x, start=-5.0)

  @NLobjective(
    nlp,
    Min,
    (x^2 - 5 * x + 6) / (x^2 + 1)
  )

  return nlp
end
