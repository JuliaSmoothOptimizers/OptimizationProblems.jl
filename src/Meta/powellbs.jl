powellbs_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "powellbs",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.5676308586741892,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/POWELLBS.SIF",
  :notes => raw"""
Powell badly scaled problem.
This problem is a sum of n-1 sets of 2 groups, both involving
nonlinear elements and being of the least square type.
It Hessian matrix is tridiagonal.

classification NOR2-AN-2-2
""",
  :origin_notes => raw"""
Problem 3 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also  Toint#34, Buckley#22 (p. 82).

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
  :lib => "CUTEst:POWELLBS",
)
get_powellbs_nvar(; n::Int = default_nvar, kwargs...) = 2
get_powellbs_ncon(; n::Int = default_nvar, kwargs...) = 0
get_powellbs_nlin(; n::Int = default_nvar, kwargs...) = 0
get_powellbs_nnln(; n::Int = default_nvar, kwargs...) = 0
get_powellbs_nequ(; n::Int = default_nvar, kwargs...) = 0
get_powellbs_nineq(; n::Int = default_nvar, kwargs...) = 0
