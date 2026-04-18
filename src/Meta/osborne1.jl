osborne1_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "osborne1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.068755591027714,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source:  Problem 17 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See alos Buckley#32 (p. 77).

classification NOR2-MN-5-33
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_osborne1_nvar(; n::Integer = default_nvar, kwargs...) = 5
get_osborne1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_osborne1_nls_nequ(; n::Integer = default_nvar, kwargs...) = 33
