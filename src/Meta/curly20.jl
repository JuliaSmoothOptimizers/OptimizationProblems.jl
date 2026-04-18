curly20_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "curly20",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.01296535045367952,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
A banded function with semi-bandwidth b and
negative curvature near the starting point.

Note that the initial point in the reference below is erroneous.
In this model, we use the starting point specified in the
original SIF model, part of the CUTE collection.

See also

problems 8, 9, 10 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

classification SUR2-AN-V-0

D. Orban, Montreal, 08/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_curly20_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_curly20_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_curly20_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_curly20_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_curly20_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_curly20_nineq(; n::Integer = default_nvar, kwargs...) = 0
