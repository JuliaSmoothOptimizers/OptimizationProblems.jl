eg2_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "eg2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -83.30562749598184,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A simple non convex problem with several local minima.

Source: Section 1.2.4 of
A. R. Conn, N. I. M. Gould and Ph. L. Toint,
LANCELOT, A Fortran Package for Large-Scale Nonlinear Optimization
(Release A)
Springer Verlag, 1992.

See also

problem 25 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification OUR2-AN-1000-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_eg2_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_eg2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_eg2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_eg2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_eg2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_eg2_nineq(; n::Integer = default_nvar, kwargs...) = 0
