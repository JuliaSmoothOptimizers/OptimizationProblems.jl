osborne1_meta = Dict(
  :nvar => 5,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "osborne1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 7.068755591027714,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/OSBORNE1.SIF",
  :notes => raw"""
Osborne first problem in 5 variables. This is a nonlinear equation version
of problem OSBORNEA.
This function  is a nonlinear least squares with 33 groups.  Each
group has 2 nonlinear elements and one linear element.

classification NOR2-MN-5-33
""",
  :origin_notes => raw"""
Problem 17 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See alos Buckley#32 (p. 77).

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
  :lib => "CUTEst:OSBORNE1",
)
get_osborne1_nvar(; n::Int = default_nvar, kwargs...) = 5
get_osborne1_ncon(; n::Int = default_nvar, kwargs...) = 0
get_osborne1_nlin(; n::Int = default_nvar, kwargs...) = 0
get_osborne1_nnln(; n::Int = default_nvar, kwargs...) = 0
get_osborne1_nequ(; n::Int = default_nvar, kwargs...) = 0
get_osborne1_nineq(; n::Int = default_nvar, kwargs...) = 0
get_osborne1_nls_nequ(; n::Int = default_nvar, kwargs...) = 33
