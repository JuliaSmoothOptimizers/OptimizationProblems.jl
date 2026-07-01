brybnd_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "brybnd",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 3600.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/BRYBND.SIF",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.

# Note: discrepancy with CUTEst appears to be a bug in CUTEst, this matches the original paper
# (See issue #36)
""",
  :origin_notes => raw"""
problem 31 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#73 (p. 41) and Toint#18
SDIF input: Ph. Toint, Dec 1989.
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
  :lib => "CUTEst:BRYBND, Luksan:4",
)
get_brybnd_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_brybnd_ncon(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nlin(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nnln(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nequ(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nineq(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nls_nequ(; n::Int = default_nvar, kwargs...) = n
