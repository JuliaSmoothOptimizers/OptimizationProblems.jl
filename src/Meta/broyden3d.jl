broyden3d_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "broyden3d",
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
Broyden tridiagonal problem in variable dimension.  This is a nonlinear
least-squares problem with n groups.

Source: Problem 30 in
  J.J. More', B.S. Garbow and K.E. Hillstrom,
  "Testing Unconstrained Optimization Software",
  ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
Also problem 78 in 
  A.R. Buckley,
  "Test functions for unconstrained minimization",
  TR 1989CS-3, Mathematics, statistics and computing centre,
  Dalhousie University, Halifax (CDN), 1989.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_broyden3d_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_broyden3d_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_broyden3d_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_broyden3d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_broyden3d_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_broyden3d_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_broyden3d_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1 * n
