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
  :url => "https://bitbucket.org/optrove/sif/src/master/DIXON3DQ.SIF",
  :notes => raw"""
Dixon's tridiagonal quadratic.

classification QUR2-AN-V-0
""",
  :origin_notes => raw"""
problem 156 (p. 51) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{Buckley1989,
  author       = {Buckley, A. R.},
  title        = {Test Functions for Unconstrained Minimization},
  institution  = {Mathematics, Statistics and Computing Centre, Dalhousie University},
  number       = {TR 1989CS-3},
  year         = {1989},
  address      = {Halifax, Canada}
}
  """,
  :lib => "CUTEst:DIXON3DQ",
)
get_dixon3dq_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_dixon3dq_ncon(; n::Int = default_nvar, kwargs...) = 0
get_dixon3dq_nlin(; n::Int = default_nvar, kwargs...) = 0
get_dixon3dq_nnln(; n::Int = default_nvar, kwargs...) = 0
get_dixon3dq_nequ(; n::Int = default_nvar, kwargs...) = 0
get_dixon3dq_nineq(; n::Int = default_nvar, kwargs...) = 0
get_dixon3dq_nls_nequ(; n::Int = default_nvar, kwargs...) = n
