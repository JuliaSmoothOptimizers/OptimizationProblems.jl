# A one dimensional optimization problem
#
# Problem 8 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017
export AMPGO08

"Univariate multimodal minimization problem AMPGO08"
function AMPGO08(args...)
  nlp = Model()

  @variable(nlp, x, start=-10.0)

  @NLobjective(
    nlp,
    Min,
    -(1 * cos(2 * x + 1) + 2 * cos(3 * x + 2) + 3 * cos(4 * x + 3) +
      4 * cos(5 * x + 4) + 5 * cos(6 * x + 5) + 6 * cos(7 * x + 6))
  )

  return nlp
end
