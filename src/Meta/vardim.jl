vardim_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "vardim",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.3105836968932622e14,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/VARDIM.SIF",
  :notes => raw"""
Variable dimension problem.
   This problem is a sum of n+2 least-squares groups, the first n of
   which have only a linear element.
   It Hessian matrix is dense.

classification  OUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 25 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#72 (p.98).
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
  :lib => "CUTEst:VARDIM",
)
get_vardim_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_vardim_ncon(; n::Int = default_nvar, kwargs...) = 0
get_vardim_nlin(; n::Int = default_nvar, kwargs...) = 0
get_vardim_nnln(; n::Int = default_nvar, kwargs...) = 0
get_vardim_nequ(; n::Int = default_nvar, kwargs...) = 0
get_vardim_nineq(; n::Int = default_nvar, kwargs...) = 0
