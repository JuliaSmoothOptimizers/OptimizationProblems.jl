hs254_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs254",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -sqrt(3),
  :best_known_upper_bound => -sqrt(3),
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://dx.doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 254.
""",
  :origin_notes => raw"""
  Problem 254 in
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

  :lib => "HS2:254",
)
get_hs254_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs254_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs254_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs254_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs254_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs254_nineq(; n::Integer = default_nvar, kwargs...) = 0
