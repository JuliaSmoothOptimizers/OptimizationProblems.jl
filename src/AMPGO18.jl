# A one dimensional optimization problem
#
# Problem 18 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO18

"Univariate multimodal minimization problem AMPGO18"
function AMPGO18(args...)
  nlp = Model()

  @variable(nlp, x, start=0.0)

  @NLobjective(
    nlp,
    Min,
    ifelse(x <= 3.0, (x - 2.0)^2, log(x - 2.0) + log(x - 2.0) + 1.0)
  )

  return nlp
end
