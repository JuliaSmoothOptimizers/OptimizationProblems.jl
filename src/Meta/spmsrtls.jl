spmsrtls_meta = Dict(
  :nvar => max(Int(round((default_nvar + 2) / 3)), 34) * 3 - 2,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "spmsrtls",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 49.32387140878785,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/SPMSRTLS.SIF",
  :notes => raw"""
Liu and Nocedal tridiagonal matrix square root problem.

classification SUR2-AN-V-V
""",
  :origin_notes => raw"""
problem 151 (p. 93) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.
This is a least-squares variant of problem SPMSQRT.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{Buckley1989,
  author      = {Buckley, A. G.},
  title       = {Test functions for unconstrained minimization},
  institution = {Computing Science Division, Dalhousie University},
  address     = {Dalhousie, Canada},
  number      = {CS-3},
  year        = {1989}
}  
  """,
  :lib => "CUTEst:SPMSRTLS, Luksan:54",
)
get_spmsrtls_nvar(; n::Int = default_nvar, kwargs...) = max(Int(round((n + 2) / 3)), 34) * 3 - 2
get_spmsrtls_ncon(; n::Int = default_nvar, kwargs...) = 0
get_spmsrtls_nlin(; n::Int = default_nvar, kwargs...) = 0
get_spmsrtls_nnln(; n::Int = default_nvar, kwargs...) = 0
get_spmsrtls_nequ(; n::Int = default_nvar, kwargs...) = 0
get_spmsrtls_nineq(; n::Int = default_nvar, kwargs...) = 0
get_spmsrtls_nls_nequ(; n::Int = default_nvar, kwargs...) =
  7 * max(Int(round((n + 2) / 3)), 34) - 8
