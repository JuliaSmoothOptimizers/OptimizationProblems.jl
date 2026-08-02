chebyquad_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "chebyquad",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/CHEBYQAD.SIF",
  :notes => raw"""
The Chebyquad problem in variable dimension. This is a nonlinear least-squares
problem with n groups. The Hessian is full.

classification SBR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 35 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#133 (p. 44).

SIF input: Nick Gould, March 1990.
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
  :lib => "CUTEst:CHEBYQAD",
)
get_chebyquad_nvar(; n::Int = default_nvar, kwargs...) = n
get_chebyquad_ncon(; n::Int = default_nvar, kwargs...) = 0
get_chebyquad_nlin(; n::Int = default_nvar, kwargs...) = 0
get_chebyquad_nnln(; n::Int = default_nvar, kwargs...) = 0
get_chebyquad_nequ(; n::Int = default_nvar, kwargs...) = 0
get_chebyquad_nineq(; n::Int = default_nvar, kwargs...) = 0
get_chebyquad_nls_nequ(; n::Int = default_nvar, m::Int = n, kwargs...) = max(m, n)
