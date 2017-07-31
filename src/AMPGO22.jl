# A one dimensional optimization problem
#
# Problem 22 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO22

function AMPGO22(n::Int64=1)
   nlp = Model()

   @variable(nlp, x, start=0.0)

   @NLobjective(
    nlp,
    Min,
    exp(-3.0 * x) - sin(x)^3
   )

   return nlp
end
