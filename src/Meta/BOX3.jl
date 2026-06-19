BOX3_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "BOX3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 662.8684162588787,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/BOX3.SIF",
  :notes => raw"""
SIF input: Ph. Toint, Dec 1989.

Box problem in 3 variables.

classification SUR2-AN-3-0
""",
  :origin_notes => raw"""
Problem 12 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#BOX663

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
  :lib => "CUTEst:BOX3",
)
get_BOX3_nvar(; n::Int = default_nvar, kwargs...) = 3
get_BOX3_ncon(; n::Int = default_nvar, kwargs...) = 0
get_BOX3_nlin(; n::Int = default_nvar, kwargs...) = 0
get_BOX3_nnln(; n::Int = default_nvar, kwargs...) = 0
get_BOX3_nequ(; n::Int = default_nvar, kwargs...) = 0
get_BOX3_nineq(; n::Int = default_nvar, kwargs...) = 0
