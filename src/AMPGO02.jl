# A one dimensional optimization problem
#
# Problem 2 in
# http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
# Andrea Gavana
#
# S. Goyette, Sherbrooke 2016/2017

export AMPGO02

"Univariate multimodal minimization problem AMPGO02"
function AMPGO02(args...)
  nlp = Model()

  @variable(nlp, x, start=2.7)

  @NLobjective(
    nlp,
    Min,
    sin(x) + sin((10.0 / 3.0) * x)
  )

  return nlp
end

AMPGO02_meta = Dict(
  :nvar => 10,
  :variable_size => false,
  :x0 => ones(10),
  :ncon => 5,
  :variable_con_size => false,
  :y0 => zeros(5),
  :nnzo => 10,
  :nnzh => 15,
  :nnzj => 25,
  :minimize => true,
  :name => "truc",
  :global_solution => zeros(10),
  :local_solution => (),
  :optimal_value => 0.0,
  :has_multiple_solution => false,
  :is_infeasible => false,
  :objtype => :constant,
  :contype => :linear,
  :origin => :real,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => true,
  :has_cvx_obj => true,
  :has_cvx_con => true,
  :has_equalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false
)
