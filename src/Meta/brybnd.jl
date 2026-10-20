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
  :best_known_upper_bound => 0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :implementation => :both,
  :url => "https://github.com/ralna/SIF/blob/master/BRYBND2.SIF",
  :notes => raw"""
Broyden banded system of nonlinear equations, considered in the
least square sense.

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.

Residual i is
  x_i (2 + 5 x_i^2) + 1 - sum_{j in J_i} x_j (1 + x_j),
with J_i = {j : j != i, max(1, i-5) <= j <= min(n, i+1)}, and the starting
point is x_i = -1 (Moré, Garbow and Hillstrom, problem 31; Luksan, Matonoha and
Vlcek, Technical Report 1081, Problem 4). The objective is 1/2 the sum of
squared residuals.

This is CUTEst's BRYBND2. CUTEst's BRYBND differs from it in three ways: it
omits the constant +1 in each residual, it exchanges the square and the cube in
rows 6 to n-2 (the diagonal term is x_i^2 and the neighbor terms are x_j^3), and
it starts at +1 instead of -1. The minimum value of the sum of squares is 0.
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
  :lib => "CUTEst:BRYBND2, Luksan:4",
)
get_brybnd_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_brybnd_ncon(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nlin(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nnln(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nequ(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nineq(; n::Int = default_nvar, kwargs...) = 0
get_brybnd_nls_nequ(; n::Int = default_nvar, kwargs...) = n
