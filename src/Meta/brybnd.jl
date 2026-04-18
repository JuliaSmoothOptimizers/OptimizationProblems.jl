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
  :url => "",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.

Source:
problem 31 in
J. J. Moré, B. S. Garbow and K. E. Hillstrom,
Testing Unconstrained Optimization Software,
ACM Transactions on Mathematical Software,
vol. 7(1), pp. 17-41, 1981.
http://dx.doi.org/10.1145/355934.355936

See also Buckley#73 (p. 41) and Toint#18

The system in question is described in

C. G. Broyden,
A class of methods for solving nonlinear simultaneous
equations,
Mathematics of Computation, vol. 19, 577-593, 1965.
http://dx.doi.org/10.1090/S0025-5718-1965-0198670-6#sthash.I3Dmi8yu.dpuf

See also

problem 4 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

Moré, Garbow and Hillstrom leave ml and mu as parameters.
Luksan, Matonoha and Vlcek do not.

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.

# Note: discrepancy with CUTEst appears to be a bug in CUTEst, this matches the original paper
# (See issue #36)
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_brybnd_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_brybnd_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_brybnd_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_brybnd_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_brybnd_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_brybnd_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_brybnd_nls_nequ(; n::Integer = default_nvar, kwargs...) = n
