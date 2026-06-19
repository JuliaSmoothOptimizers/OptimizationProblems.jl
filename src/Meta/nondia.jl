nondia_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "nondia",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 39604.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/NONDIA.SIF",
  :notes => raw"""
The Shanno nondiagonal extension of Rosenbrock function.

classification SUR2-AN-V-0

Problem 44 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Clermont-Ferrand 05/2016.

Note: discrepancy with CUTEst appears to be a bug in CUTEst, this (now) matches the original paper
(See issue #36)
""",
  :origin_notes => raw"""
D. Shanno,
" On Variable Metric Methods for Sparse Hessians II: the New
Method",
MIS Tech report 27, University of Arizona (Tucson, UK), 1978.
See also Buckley #37 (p. 76) and Toint #15.

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{Shanno1978,
  author      = {Shanno, D. F.},
  title       = {On Variable Metric Methods for Sparse {Hessians} {II}: the New Method},
  institution = {University of Arizona},
  type        = {MIS Technical Report},
  number      = {27},
  address     = {Tucson, AZ},
  year        = {1978}
}  
  """,
  :lib => "CUTEst:NONDIA, Luksan:44",
)
get_nondia_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_nondia_ncon(; n::Int = default_nvar, kwargs...) = 0
get_nondia_nlin(; n::Int = default_nvar, kwargs...) = 0
get_nondia_nnln(; n::Int = default_nvar, kwargs...) = 0
get_nondia_nequ(; n::Int = default_nvar, kwargs...) = 0
get_nondia_nineq(; n::Int = default_nvar, kwargs...) = 0
