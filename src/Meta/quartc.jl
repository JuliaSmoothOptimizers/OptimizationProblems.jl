quartc_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "quartc",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.85427373e9,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/QUARTC.SIF",
  :notes => raw"""
A simple quartic function.

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
problem 157 (p. 87) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

SIF input: Ph. Toint, March 1991.
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
  :lib => "CUTEst:QUARTC",
)
get_quartc_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_quartc_ncon(; n::Int = default_nvar, kwargs...) = 0
get_quartc_nlin(; n::Int = default_nvar, kwargs...) = 0
get_quartc_nnln(; n::Int = default_nvar, kwargs...) = 0
get_quartc_nequ(; n::Int = default_nvar, kwargs...) = 0
get_quartc_nineq(; n::Int = default_nvar, kwargs...) = 0
