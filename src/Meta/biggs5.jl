biggs5_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "biggs5",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -3.156207810643302,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Biggs problem in 5 variables.
This function is a nonlinear least squares with 13 groups.  It is a
variation on the biggs6 problem where the 6-th variable is fixed to 3.

Source: Inspited by problem 18 in
  J.J. More', B.S. Garbow and K.E. Hillstrom,
  "Testing Unconstrained Optimization Software",
  ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
Also problem 74 in
  A.R. Buckley,
  "Test functions for unconstrained minimization",
  TR 1989CS-3, Mathematics, statistics and computing centre,
  Dalhousie University, Halifax (CDN), 1989.

classification SXR2-AN-6-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_biggs5_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_biggs5_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_biggs5_nineq(; n::Integer = default_nvar, kwargs...) = 0
