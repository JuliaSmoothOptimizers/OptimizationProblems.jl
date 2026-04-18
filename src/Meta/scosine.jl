scosine_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "scosine",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 86.88067362714696,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Another function with nontrivial groups and
repetitious elements.
NB: scaled version of COSINE

Source:
N. Gould, private communication.

classification OUR2-AN-V-0

Problem 50 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

J.-P. Dussault, Clermont-Ferrand 05/2016.

Note: discrepancy with CUTEst appears to be a bug in CUTEst, this matches the original paper
(See issue #36)
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_scosine_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_scosine_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_scosine_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_scosine_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_scosine_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_scosine_nineq(; n::Integer = default_nvar, kwargs...) = 0
