argtrig_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "argtrig",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.1145/355934.355936, https://bitbucket.org/optrove/sif/src/master/ARGTRIG.SIF",
  :notes => raw"""
Variable dimension trigonometric problem
This problem is a sum of n least-squares groups, each of
which has n+1 nonlinear elements.  Its Hessian matrix is dense.

classification NOR2-AN-V-V
""",
  :origin_notes => raw"""
problem 101 in
    A.R. Buckley,
    "Test functions for unconstrained minimization",
    TR 1989CS-3, Mathematics, statistics and computing centre,
    Dalhousie University, Halifax (CDN), 1989.

Problem 26 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

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
  :lib => "CUTEst:ARGTRIG",
)
get_argtrig_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_argtrig_ncon(; n::Int = default_nvar, kwargs...) = 0
get_argtrig_nlin(; n::Int = default_nvar, kwargs...) = 0
get_argtrig_nnln(; n::Int = default_nvar, kwargs...) = 0
get_argtrig_nequ(; n::Int = default_nvar, kwargs...) = 0
get_argtrig_nineq(; n::Int = default_nvar, kwargs...) = 0
get_argtrig_nls_nequ(; n::Int = default_nvar, kwargs...) = 2 * n
