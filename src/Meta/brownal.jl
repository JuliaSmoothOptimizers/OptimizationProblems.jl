brownal_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brownal",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
The Brown almost linear problem in variable dimension.  This is a nonlinear
least-squares problems with n groups.

Source: Problem 27 in
  J.J. More', B.S. Garbow and K.E. Hillstrom,
  "Testing Unconstrained Optimization Software",
  ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
Alsso problem 79 in 
  A.R. Buckley,
  "Test functions for unconstrained minimization",
  TR 1989CS-3, Mathematics, statistics and computing centre,
  Dalhousie University, Halifax (CDN), 1989.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_brownal_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_brownal_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brownal_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brownal_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brownal_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brownal_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_brownal_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1 * n
