AMPGO11_meta = Dict(
  :nvar => 1,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "AMPGO11",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions",
  :notes => raw"""
A one dimensional optimization problem
""",
  :origin_notes => raw"""
Problem 11 in
http://infinity77.net/global_optimization/test_functions_1d.html#d-test-functions
Andrea Gavana
S. Goyette, Sherbrooke 2016/2017
""",
  :reference => raw"""
@misc{GavanaGOTestSuite,
  author       = {Gavana, Andrea},
  title        = {Global Optimization Benchmarks},
  year         = {2013},
  howpublished = {\url{http://infinity77.net/global_optimization/}},
  note         = {Collection of benchmark functions and algorithm comparisons for global optimization (including AMPGO)}
}
""",
)
get_AMPGO11_nvar(; n::Integer = default_nvar, kwargs...) = 1
get_AMPGO11_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_AMPGO11_nineq(; n::Integer = default_nvar, kwargs...) = 0
