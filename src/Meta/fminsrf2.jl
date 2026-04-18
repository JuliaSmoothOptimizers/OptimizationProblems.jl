fminsrf2_meta = Dict(
  :nvar => 100,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "fminsrf2",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2504.26865839215,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Source: setting the boundary free in
A Griewank and Ph. Toint,
"Partitioned variable metric updates for large structured
optimization problems",
Numerische Mathematik 39:429-448, 1982.

SIF input: Ph. Toint, November 1991.

classification OUR2-MY-V-0

Problem 33 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf
J.-P. Dussault, Rennes 09/2015.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_fminsrf2_nvar(; n::Integer = default_nvar, kwargs...) = 100
get_fminsrf2_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_fminsrf2_nineq(; n::Integer = default_nvar, kwargs...) = 0
