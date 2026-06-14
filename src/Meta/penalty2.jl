penalty2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "penalty2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.6884776914936244e6,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/PENALTY2.SIF",
  :notes => raw"""
The second penalty function
This is a nonlinear least-squares problem with M=2*N groups.
Group 1 is linear.
Groups 2 to N use 2 nonlinear elements.
Groups N+1 to M-1 use 1 nonlinear element.
Group M uses N nonlinear elements.
The Hessian matrix is dense.

classification SUR2-AN-V-0
J.-P. Dussault, Clermont-Ferrand 06/2016.
""",
  :origin_notes => raw"""
Problem 24 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#112 (p. 80)

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
  :lib => "CUTEst:PENALTY2",
)
get_penalty2_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_penalty2_ncon(; n::Int = default_nvar, kwargs...) = 0
get_penalty2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_penalty2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_penalty2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_penalty2_nineq(; n::Int = default_nvar, kwargs...) = 0
