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
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 274.2039050428259,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A seven diagonal variant of the Broyden tridiagonal system,
featuring a band far away from the diagonal.

Source:
Problem 3.4 in
Ph. L. Toint,
Some numerical results using a sparse matrix updating formula in
unconstrained optimization,
Mathematics of Computation, vol. 32(114), pp. 839-852, 1978.
http://dx.doi.org/10.1090/S0025-5718-1978-0483452-7

From the paper,

"This function was built from a nonlinear system of equations
suggested originally by Broyden ..."

The system in question is described in

L. K. Schubert,
Modification of a quasi-Newton method for nonlinear equations
with a sparse Jacobian,
Mathematics of Computation, vol. 24, pp. 27-30, 1970.
http://dx.doi.org/10.1090/S0025-5718-1970-0258276-9#sthash.yOkQUwXA.dpuf

See also, with a slight variation in the formulation,

problem 3 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

See also Buckley#84

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.

# Note: discrepancy with CUTEst appears to be a bug in CUTEst, this matches the original paper
# (See issue #36)
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_broydn7d_nvar(; n::Integer = default_nvar, kwargs...) = 2 * max(1, div(n, 2))
get_broydn7d_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_broydn7d_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_broydn7d_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_broydn7d_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_broydn7d_nineq(; n::Integer = default_nvar, kwargs...) = 0
