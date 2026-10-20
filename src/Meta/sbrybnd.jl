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
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/SSBRYBND2.SIF",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.
NB: scaled version of BRYBND

classification SUR2-AN-V-0

J.-P. Dussault, Clermont-Ferrand 05/2016.

The problem is BRYBND in the variables z_i = p_i x_i, with scale factors
p_i = exp(6 (i-1)/(n-1)) and starting point x_i = 1/p_i, as in Problem 48 of
L. Luksan, C. Matonoha and J. Vlcek, Technical Report 1081 (the printed formula
omits the square of each residual; their Fortran code squares it, as this
implementation does).

This is CUTEst's SSBRYBND2. CUTEst's SSBRYBND has the same scale factors and
starting point, but, like CUTEst's BRYBND, its residuals omit the constant +1
and exchange the square and the cube in rows 6 to n-2. CUTEst's SBRYBND and
SBRYBND2 use p_i = exp(12 (i-1)/(n-1)), which is also a published choice and
makes the problem far more badly scaled. The minimum value of the sum of
squares is 0.
""",
  :origin_notes => raw"""
problem 31 in
J.J. More', B.S. Garbow and K.E. Hillstrom,
"Testing Unconstrained Optimization Software",
ACM Transactions on Mathematical Software, vol. 7(1), pp. 17-41, 1981.
See also Buckley#73 (p. 41) and Toint#18

The scale factors exp(6 (i-1)/(n-1)) are from problem 48 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

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
  :lib => "CUTEst:SSBRYBND2, Luksan:48",
)
get_sbrybnd_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_sbrybnd_ncon(; n::Int = default_nvar, kwargs...) = 0
get_sbrybnd_nlin(; n::Int = default_nvar, kwargs...) = 0
get_sbrybnd_nnln(; n::Int = default_nvar, kwargs...) = 0
get_sbrybnd_nequ(; n::Int = default_nvar, kwargs...) = 0
get_sbrybnd_nineq(; n::Int = default_nvar, kwargs...) = 0
get_sbrybnd_nls_nequ(; n::Int = default_nvar, kwargs...) = n
