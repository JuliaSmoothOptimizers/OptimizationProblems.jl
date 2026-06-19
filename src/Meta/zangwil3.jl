zangwil3_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "zangwil3",
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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/ZANGWIL3.SIF",
  :notes => raw"""
Zangwill's problem in 3 variables.

classification NLR2-AN-3-3

 A. Cebola, Paraná 10/2016.
""",
  :origin_notes => raw"""
problem 1 in
   P.T. Boggs and J.W. Tolle,
   "A strategy for global convergence in a sequential
    quadratic programming algorithm",
   SINUM 26(3), pp. 600-623, 1989.

Problem from CUTE: https://github.com/mpf/Optimization-Test-Problems/blob/master/cute/zangwil3.mod

problem 13 (p. 103) in
A.R. Buckley,
"Test functions for unconstrained minimization",
TR 1989CS-3, Mathematics, statistics and computing centre,
Dalhousie University, Halifax (CDN), 1989.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{BoggsTolle1989,
  author  = {Boggs, Paul T. and Tolle, Jon W.},
  title   = {A Strategy for Global Convergence in a Sequential Quadratic Programming Algorithm},
  journal = {SIAM Journal on Numerical Analysis},
  year    = {1989},
  volume  = {26},
  number  = {3},
  pages   = {600--623},
  doi     = {10.1137/0726036}
}
""",
  :lib => "CUTEst:ZANGWIL3",
)
get_zangwil3_nvar(; n::Int = default_nvar, kwargs...) = 3
get_zangwil3_ncon(; n::Int = default_nvar, kwargs...) = 3
get_zangwil3_nlin(; n::Int = default_nvar, kwargs...) = 3
get_zangwil3_nnln(; n::Int = default_nvar, kwargs...) = 0
get_zangwil3_nequ(; n::Int = default_nvar, kwargs...) = 3
get_zangwil3_nineq(; n::Int = default_nvar, kwargs...) = 0
