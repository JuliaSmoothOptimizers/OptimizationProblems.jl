dixmaann_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dixmaann",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 665.6596520763188,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://www.cs.cas.cz/matonoha/download/V1081.pdf, https://bitbucket.org/optrove/sif/src/master/DIXMAANN.SIF",
  :notes => raw"""
The Dixon-Maany test problem (version M by default)

D. Orban, Montreal, 08/2015.

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
See also

L. Luksan, C. Matonoha and J. Vlcek  
Modified CUTE problems for sparse unconstraoined optimization
Technical Report 1081
Institute of Computer Science
Academy of Science of the Czech Republic
(problem 20) based on
L.C.W. Dixon and Z. Maany,
"A family of test problems with sparse Hessians for unconstrained
optimization",
TR 206, Numerical Optimization Centre, Hatfield Polytechnic, 1988.

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
  :lib => "CUTEst:DIXMAANN,Luksan:20",
)
get_dixmaann_nvar(; n::Int = default_nvar, kwargs...) = 3 * max(1, div(n, 3))
get_dixmaann_ncon(; n::Int = default_nvar, kwargs...) = 0
get_dixmaann_nlin(; n::Int = default_nvar, kwargs...) = 0
get_dixmaann_nnln(; n::Int = default_nvar, kwargs...) = 0
get_dixmaann_nequ(; n::Int = default_nvar, kwargs...) = 0
get_dixmaann_nineq(; n::Int = default_nvar, kwargs...) = 0
