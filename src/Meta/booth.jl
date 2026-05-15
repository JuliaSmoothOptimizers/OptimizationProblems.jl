booth_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "booth",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/BOOTH.SIF",
  :notes => raw"""
SIF input: Ph. Toint, Dec 1989.

Booth quadratic problem in 2 variables.

classification NLR2-AN-2-2
""",
  :origin_notes => raw"""
Problem 36 in
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
  :lib => "CUTEst:BOOTH",
)
get_booth_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_booth_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_booth_nlin(; n::Integer = default_nvar, kwargs...) = 2
get_booth_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_booth_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_booth_nineq(; n::Integer = default_nvar, kwargs...) = 0
