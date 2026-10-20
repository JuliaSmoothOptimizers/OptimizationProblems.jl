kowosb2_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "kowosb2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 0.00015375280192461824,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/KOWOSB2.SIF",
  :notes => raw"""
A problem arising in the analysis of kinetic data for an enzyme
reaction, known under the name of Kowalik and Osborne problem
in 4 variables.

This is CUTEst's KOWOSB2, with the abscissa u_11 = 0.0625 given in the
source. kowosb is the same problem with u_11 = 0.0624, as in CUTEst's
KOWOSB.

classification SUR2-MN-4-0
""",
  :origin_notes => raw"""
Problem 15 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

SIF input: Ph. Toint, Dec 1989.
           Corrected version of KOWOSB by Tim Holy, Oct 2026.
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
  :lib => "CUTEst:KOWOSB2",
)
get_kowosb2_nvar(; n::Int = default_nvar, kwargs...) = 4
get_kowosb2_ncon(; n::Int = default_nvar, kwargs...) = 0
get_kowosb2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_kowosb2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_kowosb2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_kowosb2_nineq(; n::Int = default_nvar, kwargs...) = 0
get_kowosb2_nls_nequ(; n::Int = default_nvar, kwargs...) = 11
