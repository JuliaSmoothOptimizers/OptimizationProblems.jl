sbrybnd_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "sbrybnd",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1568.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/SBRYBND.SIF",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.
NB: scaled version of BRYBND

classification SUR2-AN-V-0

The terms in the sum should be squared --- corrected (it is not squared in Luksan, but
comparing it against their brybnd that appears to be a typo)

J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
problem 31 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#73 (p. 41) and Toint#18

SIF input: Ph. Toint and Nick Gould, Nov 1997.
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
  :lib => "CUTEst:SBRYBND, Luksan:48",
)
get_sbrybnd_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_sbrybnd_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
