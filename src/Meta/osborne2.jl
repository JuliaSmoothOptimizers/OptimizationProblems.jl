osborne2_meta = Dict(
  :nvar => 11,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "osborne2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.093419514212065,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/OSBORNE2.SIF",
  :notes => raw"""
Source:  Problem 19 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#32 (p.78).

classification NOR2-MN-11-65
""",
  :origin_notes => raw"""
Problem :
Osborne second problem in 11 variables. This is a nonlinear equation version
of problem OSBORNEB.
This function  is a nonlinear least squares with 65 groups.  Each
group has 4 nonlinear elements.
Source:  Problem 19 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#32 (p.78).
SIF input: Ph. Toint, Dec 1989.
Modification as a set of nonlinear equations: Nick Gould, Oct 2015.
classification NOR2-MN-11-65
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
  :lib => "CUTEst:OSBORNE2",
)
get_osborne2_nvar(; n::Integer = default_nvar, kwargs...) = 11
get_osborne2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_osborne2_nls_nequ(; n::Integer = default_nvar, kwargs...) = 65
