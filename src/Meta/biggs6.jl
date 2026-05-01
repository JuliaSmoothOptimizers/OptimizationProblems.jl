biggs6_meta = Dict(
  :nvar => 6,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "biggs6",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -3.156207810643302,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/BIGGS6.SIF",
  :notes => raw"""
Source: problem 18 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

Source: Problem 21 in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

classification SUR2-AN-6-0
""",
  :origin_notes => raw"""
Problem :
Biggs EXP problem in 6 variables
Source: Problem 21 in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.
SIF input: Ph. Toint, Dec 1989.
classification SUR2-AN-6-0
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
  :lib => "CUTEst:BIGGS6",
)
get_biggs6_nvar(; n::Integer = default_nvar, kwargs...) = 6
get_biggs6_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_biggs6_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_biggs6_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_biggs6_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_biggs6_nineq(; n::Integer = default_nvar, kwargs...) = 0
