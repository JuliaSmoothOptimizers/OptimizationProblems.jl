# A one dimensional optimization problem
#
# Problem 9 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO09

function AMPGO09(n::Int64=1)
   nlp = Model()

   @variable(nlp, x, start=3.1)

   @NLobjective(
    nlp,
    Min,
    sin(x)+sin(2/3*x)
   )

   return nlp
end
