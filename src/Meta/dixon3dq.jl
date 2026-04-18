dixon3dq_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixon3dq",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 8.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Dixon's tridiagonal quadratic.

Source: problem 156 (p. 51) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

classification QUR2-AN-V-0
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_dixon3dq_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_dixon3dq_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dixon3dq_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dixon3dq_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dixon3dq_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dixon3dq_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_dixon3dq_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
