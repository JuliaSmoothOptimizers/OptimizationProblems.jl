gulf_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "gulf",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => false,
  :origin => :real,
  :url => "https://bitbucket.org/optrove/sif/src/master/GULF.SIF",
  :notes => raw"""
The Gulf research and development function for m = 99. 

SUR2-MN-3-0

The Gulf RD test problem in 3 variables.
This function  is a nonlinear least squares with 99 groups.  Each
group has a nonlinear element of exponential type.
The number of groups may be varied, but must be larger or equal to 3

classification SUR2-MN-3-0
""",
  :origin_notes => raw"""
problem 27 (p. 57) in
  A.R. Buckley,
  "Test functions for unconstrained minimization",
  TR 1989CS-3, Mathematics, statistics and computing centre,
  Dalhousie University, Halifax (CDN), 1989.

problem 11 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#27

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{MoreGarbowHillstrom1981,
  author  = {Mor{\'e}, Jorge J. and Garbow, Burton S. and Hillstrom, Kenneth E.},
  title   = {Testing Unconstrained Optimization Software},
  journal = {ACM Transactions on Mathematical Software},
  year    = {1981},
  volume  = {7},
  number  = {1},
  pages   = {17--41},
  doi     = {10.1145/355934.355936}
}  
  """,
  :lib => "CUTEst:GULF",
)
get_gulf_nvar(; n::Int = default_nvar, kwargs...) = 3
get_gulf_ncon(; n::Int = default_nvar, kwargs...) = 0
get_gulf_nlin(; n::Int = default_nvar, kwargs...) = 0
get_gulf_nnln(; n::Int = default_nvar, kwargs...) = 0
get_gulf_nequ(; n::Int = default_nvar, kwargs...) = 0
get_gulf_nineq(; n::Int = default_nvar, kwargs...) = 0
get_gulf_nls_nequ(; n::Int = default_nvar, m = 100, kwargs...) = m
