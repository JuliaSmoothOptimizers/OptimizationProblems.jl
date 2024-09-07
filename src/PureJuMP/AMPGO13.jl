# A one dimensional optimization problem
#
# Problem 13 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO13

"Univariate multimodal minimization problem AMPGO13"
function AMPGO13(args...; kwargs...)
  nlp = Model()

  @variable(nlp, x, start = 0.001)

  @objective(nlp, Min, ifelse(0.0 < x < 1.0, -(x^(2 / 3) + (1 - x^2)^(1 / 3)), Inf))

  return nlp
end
