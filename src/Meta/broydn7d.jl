broydn7d_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "broydn7d",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.0,
  :best_known_upper_bound => 274.2039050428259,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/BROYDN7D.SIF",
  :notes => raw"""
A seven diagonal variant of the Broyden tridiagonal system,
featuring a band far away from the diagonal.

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 3.4 in
Ph. L. Toint,
Some numerical results using a sparse matrix updating formula in
unconstrained optimization,
Mathematics of Computation, vol. 32(143), pp. 839-851, 1978.
https://doi.org/10.1090/S0025-5718-1978-0483452-7

From the paper,

"This function was built from a nonlinear system of equations
suggested originally by Broyden ..."

The system in question is described in

L. K. Schubert,
Modification of a quasi-Newton method for nonlinear equations
with a sparse Jacobian,
Mathematics of Computation, vol. 24, pp. 27-30, 1970.
https://doi.org/10.1090/S0025-5718-1970-0258276-9#sthash.yOkQUwXA.dpuf

See also, with a slight variation in the formulation,

problem 3 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

See also Buckley#84

SIF input: Ph. Toint, Dec 1989.

D. Orban, Montreal, 08/2015.

Two variants of the diagonal term are in use. Toint's printed Problem 3.4
(function G7D) has (3 - x_i/2) x_i and the starting point x_i = -1; this
implementation follows it. CUTEst's BROYDN7D, Problem 3 in Luksan et al., and
the corresponding AMPL model have (3 - 2 x_i) x_i and the starting point
x_i = 1, as in Broyden's tridiagonal system.
""",
  :reference => raw"""
@article{Toint1978MathComp,
  author  = {Toint, Ph. L.},
  title   = {Some numerical results using a sparse matrix updating formula in unconstrained optimization},
  journal = {Mathematics of Computation},
  year    = {1978},
  volume  = {32},
  number  = {143},
  pages   = {839--851},
  doi     = {10.1090/s0025-5718-1978-0483452-7}
}  
  """,
  :lib => "CUTEst:BROYDN7D, Luksan:3",
)
get_broydn7d_nvar(; n::Int = default_nvar, kwargs...) = 2 * max(1, div(n, 2))
get_broydn7d_ncon(; n::Int = default_nvar, kwargs...) = 0
get_broydn7d_nlin(; n::Int = default_nvar, kwargs...) = 0
get_broydn7d_nnln(; n::Int = default_nvar, kwargs...) = 0
get_broydn7d_nequ(; n::Int = default_nvar, kwargs...) = 0
get_broydn7d_nineq(; n::Int = default_nvar, kwargs...) = 0
