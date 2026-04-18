ncb20b_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "ncb20b",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 200.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A banded problem with semi-bandwidth 20.  This problem exhibits frequent
negative curvature in the exact Hessian.  It is a simplified version of
problem NCB20.
Source:
Ph. Toint, private communication, 1992.
classification OUR2-AN-V-0
Problem 41 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_ncb20b_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_ncb20b_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_ncb20b_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_ncb20b_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_ncb20b_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_ncb20b_nineq(; n::Integer = default_nvar, kwargs...) = 0
