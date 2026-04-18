pinene_meta = Dict(
  :nvar => 5005,
  :variable_nvar => true,
  :ncon => 5000,
  :variable_ncon => true,
  :minimize => true,
  :name => "pinene",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
This is problem 8 in the COPS (Version 3) collection of
  E. Dolan and J. More
  see "Benchmarking Optimization Software with COPS"
  Argonne National Labs Technical Report ANL/MCS-246 (2004)

Isomerization of Alpha-Pinene Problem
Collocation formulation
Alexander S. Bondarenko - Summer 1998
COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_pinene_ncon(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nlin(; n::Integer = default_nvar, kwargs...) = 35 * n + 0
get_pinene_nnln(; n::Integer = default_nvar, kwargs...) = 15 * n + 0
get_pinene_nequ(; n::Integer = default_nvar, kwargs...) = 50 * n + 0
get_pinene_nineq(; n::Integer = default_nvar, kwargs...) = 0
