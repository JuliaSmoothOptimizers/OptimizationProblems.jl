kowosb_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "kowosb",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.026497849149796696,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/KOWOSB.SIF",
  :notes => raw"""
A problem arising in the analysis of kinetic data for an enzyme
reaction, known under the name of Kowalik and Osborne problem
in 4 variables.

classification SUR2-MN-4-0
""",
  :origin_notes => raw"""
Problem 15 in
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
  :lib => "CUTEst:KOWOSB",
)
get_kowosb_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_kowosb_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_kowosb_nls_nequ(; n::Integer = default_nvar, kwargs...) = 11
