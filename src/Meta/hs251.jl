hs251_meta = Dict(
  :nvar => 3,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs251",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -3456,
  :best_known_upper_bound => -3456,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 251.
""",
  :origin_notes => raw"""
Problem 251 in
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
  :lib => "HS2:251",
)
get_hs251_nvar(; n::Int = default_nvar, kwargs...) = 3
get_hs251_ncon(; n::Int = default_nvar, kwargs...) = 1
get_hs251_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs251_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs251_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs251_nineq(; n::Int = default_nvar, kwargs...) = 1
