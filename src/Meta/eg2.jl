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
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/EG2.SIF",
  :notes => raw"""
A simple nonlinear problem given as an example in Section 1.2.4 of
the LANCELOT Manual.
The problem is non convex and has several local minima.

classification OUR2-AN-1000-0
""",
  :origin_notes => raw"""
Section 1.2.4 of
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

SIF input: N. Gould and Ph. Toint, June 1994.

D. Orban, Montreal, 08/2015.
""",
  :reference => raw"""
@book{ConnGouldToint1992LANCELOT,
  author    = {Conn, A. R. and Gould, N. I. M. and Toint, Ph. L.},
  title     = {{LANCELOT}: a {Fortran} package for large-scale nonlinear optimization ({Release A})},
  series    = {Springer Series in Computational Mathematics},
  volume    = {17},
  publisher = {Springer},
  address   = {Heidelberg},
  year      = {1992},
  doi       = {10.1007/978-3-662-12211-2}
}  
  """,
  :lib => "CUTEst:EG2, Luksan:25",
)
get_eg2_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_eg2_ncon(; n::Int = default_nvar, kwargs...) = 0
get_eg2_nlin(; n::Int = default_nvar, kwargs...) = 0
get_eg2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_eg2_nequ(; n::Int = default_nvar, kwargs...) = 0
get_eg2_nineq(; n::Int = default_nvar, kwargs...) = 0
