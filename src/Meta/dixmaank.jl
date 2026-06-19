dixmaank_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaank",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2427.645903479237,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf, https://bitbucket.org/optrove/sif/src/master/DIXMAANK.SIF",
  :notes => raw"""
The Dixon-Maany test problem (version I by default)

classification OUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""
problems 15, 16, 17, 18 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

L.C.W. Dixon and Z. Maany,
"A family of test problems with sparse Hessians for unconstrained
optimization",
TR 206, Numerical Optimization Centre, Hatfield Polytechnic, 1988.
See also Buckley#221 (p. 49)

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{DixonMaany1988,
  author      = {L. C. W. Dixon and Z. Maany},
  title       = {A family of test problems with sparse Hessians for unconstrained optimization},
  institution = {Numerical Optimization Centre, Hatfield Polytechnic},
  number      = {TR 206},
  year        = {1988}
}
  """,
  :lib => "CUTEst:DIXMAANK,Luksan:17",
)
get_dixmaank_nvar(; n::Int = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaank_ncon(; n::Int = default_nvar, kwargs...) = 0
get_dixmaank_nlin(; n::Int = default_nvar, kwargs...) = 0
get_dixmaank_nnln(; n::Int = default_nvar, kwargs...) = 0
get_dixmaank_nequ(; n::Int = default_nvar, kwargs...) = 0
get_dixmaank_nineq(; n::Int = default_nvar, kwargs...) = 0
