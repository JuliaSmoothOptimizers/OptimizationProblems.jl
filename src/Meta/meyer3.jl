meyer3_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "meyer3",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1.6936078094361455e9,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/MEYER3.SIF",
  :notes => raw"""
Meyer function

classification SUR2-RN-3-0
""",
  :origin_notes => raw"""
Problem 10 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley #29 (p. 73).

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
  :lib => "CUTEst:MEYER3",
)
get_meyer3_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_meyer3_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_meyer3_nls_nequ(; n::Integer = default_nvar, kwargs...) = 16
