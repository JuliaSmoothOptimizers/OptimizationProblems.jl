cliff_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "cliff",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 4.8516519441069025e8,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CLIFF.SIF",
  :notes => raw"""
The "cliff problem" in 2 variables

classification OUR2-AN-2-0
""",
  :origin_notes => raw"""
problem 206 (p. 46) in
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
  :lib => "CUTEst:CLIFF",
)
get_cliff_nvar(; n::Int = default_nvar, kwargs...) = 2
get_cliff_ncon(; n::Int = default_nvar, kwargs...) = 0
get_cliff_nlin(; n::Int = default_nvar, kwargs...) = 0
get_cliff_nnln(; n::Int = default_nvar, kwargs...) = 0
get_cliff_nequ(; n::Int = default_nvar, kwargs...) = 0
get_cliff_nineq(; n::Int = default_nvar, kwargs...) = 0
