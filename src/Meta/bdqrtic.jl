bdqrtic_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "bdqrtic",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 21696.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/BDQRTIC.SIF",
  :notes => raw"""
This problem is quartic and has a banded Hessian with bandwidth = 9

classification SUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 61 in
A.R. Conn, N.I.M. Gould, M. Lescrenier and Ph.L. Toint,
Performance of a multifrontal scheme for partially separable
optimization,
Report 88/4, Dept of Mathematics, FUNDP (Namur, B), 1988.

See also

problem 2 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

SIF input: Ph. Toint, Dec 1989.

D. Orban, Montreal, 08/2015.
""",
  :reference => raw"""
@techreport{ConnGouldLescrenierToint1988,
  author      = {Conn, A. R. and Gould, N. I. M. and Lescrenier, M. and Toint, Ph. L.},
  title       = {Performance of a multifrontal scheme for partially separable optimization},
  institution = {Department of Mathematics, FUNDP},
  address     = {Namur, Belgium},
  number      = {Report 88/4},
  year        = {1988}
}  
  """,
  :lib => "CUTEst:BDQRTIC, Luksan:2",
)
get_bdqrtic_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_bdqrtic_ncon(; n::Int = default_nvar, kwargs...) = 0
get_bdqrtic_nlin(; n::Int = default_nvar, kwargs...) = 0
get_bdqrtic_nnln(; n::Int = default_nvar, kwargs...) = 0
get_bdqrtic_nequ(; n::Int = default_nvar, kwargs...) = 0
get_bdqrtic_nineq(; n::Int = default_nvar, kwargs...) = 0
get_bdqrtic_nls_nequ(; n::Int = default_nvar, kwargs...) = 2 * (max(5, n) - 4)
