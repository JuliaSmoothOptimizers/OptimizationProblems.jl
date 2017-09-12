# A one dimensional optimization problem
#
# Problem 3 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO03

"Univariate multimodal minimization problem AMPGO03"
function AMPGO03(args...)
  nlp = Model()

  @variable(nlp, x, start=-10.0)

  @NLobjective(
    nlp,
    Min,
    -(1 * sin(2 * x + 1) + 2 * sin( 3 * x + 2 ) + 3 * sin(4 * x + 3) +
      4 * sin(5 * x + 4) + 5 * sin(6 * x + 5) + 6 * sin(7 * x + 6))
  )

  return nlp
end
