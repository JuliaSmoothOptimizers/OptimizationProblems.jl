hs235_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs235",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 0.04,
  :best_known_upper_bound => 0.04,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://dx.doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 235.
""",
  :origin_notes => raw"""
Problem 235 in
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

  :lib => "HS2:235",
)
get_hs235_nvar(; n::Integer = default_nvar, kwargs...) = 3
get_hs235_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs235_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs235_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs235_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs235_nineq(; n::Integer = default_nvar, kwargs...) = 0
