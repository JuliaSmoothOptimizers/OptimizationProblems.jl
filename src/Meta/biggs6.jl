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
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/BIGGS6.SIF",
  :notes => raw"""
Biggs EXP problem in 6 variables

The objective is the sum of squares of the m residuals (m = 13 by default)

  r_i(x) = x3 exp(-t_i x1) - x4 exp(-t_i x2) + x6 exp(-t_i x5) - y_i,
  t_i = i / 10,   y_i = exp(-t_i) - 5 exp(-10 t_i) + 3 exp(-4 t_i).

The residuals all vanish at x = (1, 10, 1, 5, 4, 3).

classification SUR2-AN-6-0
""",
  :origin_notes => raw"""
problem 18 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

Problem 21 in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

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
  :lib => "CUTEst:BIGGS6",
)
get_biggs6_nvar(; n::Int = default_nvar, kwargs...) = 6
get_biggs6_ncon(; n::Int = default_nvar, kwargs...) = 0
get_biggs6_nlin(; n::Int = default_nvar, kwargs...) = 0
get_biggs6_nnln(; n::Int = default_nvar, kwargs...) = 0
get_biggs6_nequ(; n::Int = default_nvar, kwargs...) = 0
get_biggs6_nineq(; n::Int = default_nvar, kwargs...) = 0
get_biggs6_nls_nequ(; n::Int = default_nvar, m::Int = 13, kwargs...) = max(6, m)
