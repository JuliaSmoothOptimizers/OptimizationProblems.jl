# A one dimensional optimization problem
#
# Problem 9 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO09

"Univariate multimodal minimization problem AMPGO09"
function AMPGO09(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 3.1)

  @objective(nlp, Min, sin(x) + sin((2.0 / 3.0) * x))

  return nlp
end
