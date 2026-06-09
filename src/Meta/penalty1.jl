penalty1_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "penalty1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/PENALTY1.SIF",
  :notes => raw"""
A penalty function arising from
min{ sum_1^n(x_i-1)^2 subject to sum_1^n x_i^2 = 1/4}.
At the solution, the hessian has n-1 eigenvalues of order 1e-5 and
one of order 1.

This problem is a sum of n+1 least-squares groups, the first n of
which have only a linear element.
It Hessian matrix is dense.

classification SUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 23 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley #181 (p. 79).

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
  :lib => "CUTEst:PENALTY1",
)
get_penalty1_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_penalty1_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_penalty1_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_penalty1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_penalty1_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_penalty1_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_penalty1_nls_nequ(; n::Integer = default_nvar, kwargs...) = n + 1
