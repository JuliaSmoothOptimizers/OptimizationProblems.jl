liarwhd_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "liarwhd",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 58500.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
G. Li,
"The secant/finite difference algorithm for solving sparse
nonlinear systems of equations",
SIAM Journal on Optimization, (to appear), 1990.

classification SUR2-AN-V-0

This is a simplified version of problem NONDIA.

Problem 38 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

based on the original problem by N. Gould

classification OUR2-AN-V-0

J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_liarwhd_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_liarwhd_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_liarwhd_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_liarwhd_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_liarwhd_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_liarwhd_nineq(; n::Integer = default_nvar, kwargs...) = 0
