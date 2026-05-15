hs243_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs243",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0.7966,
  :best_known_upper_bound => 0.7966,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 243.
""",
  :origin_notes => raw"""
Problem 243 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.
""",
  :reference => raw"""
@book{Schittkowski1987,
  author    = {Schittkowski, Klaus},
  title     = {More Test Examples for Nonlinear Programming Codes},
  series    = {Lecture Notes in Economics and Mathematical Systems},
  volume    = {282},
  publisher = {Springer-Verlag},
  address   = {Heidelberg},
  year      = {1987}
}
  """,

  :lib => "HS2:243",
)
get_hs243_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs243_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_hs243_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs243_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs243_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs243_nineq(; n::Integer = default_nvar, kwargs...) = 0
