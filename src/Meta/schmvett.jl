schmvett_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "schmvett",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -189.06775423656546,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
The Schmidt and Vetters problem.

This problem has N-2 trivial groups, all of which have 3 nonlinear
elements

Source:
J.W. Schmidt and K. Vetters,
"Albeitungsfreie Verfahren fur Nichtlineare Optimierungsproblem",
Numerische Mathematik 15:263-282, 1970.

See also Toint#35 and Buckley#14 (p90)

classification OUR2-AY-V-0

Problem 49 in
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
get_schmvett_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_schmvett_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_schmvett_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_schmvett_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_schmvett_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_schmvett_nineq(; n::Integer = default_nvar, kwargs...) = 0
