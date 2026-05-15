powellsg_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "powellsg",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 5375.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/POWELLSG.SIF",
  :notes => raw"""
The extended Powell singular problem.
This problem is a sum of n/4 sets of four terms, each of which is assigned its own group.

classification OUR2-AN-V-0

J.-P. Dussault, Clermont-Ferrand 05/2016.

Difference with the following is the initial guess.
""",
  :origin_notes => raw"""
Problem 13 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Toint#19, Buckley#34 (p.85)

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
  :lib => "CUTEst:POWELLSG, Luksan:47, LuksanSparse:3",
)
get_powellsg_nvar(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))  # number of variables adjusted to be a multiple of 4
get_powellsg_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_powellsg_nls_nequ(; n::Integer = default_nvar, kwargs...) = 4 * max(1, div(n, 4))
