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
  :url => "",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.
NB: scaled version of BRYBND

Source: the *unscaled* version is problem 31 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.

See also Buckley#73 (p. 41) and Toint#18

classification SUR2-AN-V-0

This scaled version is Problem 48 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

The terms in the sum should be squared --- corrected (it is not squared in Luksan, but
comparing it against their brybnd that appears to be a typo)

J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_sbrybnd_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_sbrybnd_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_sbrybnd_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
