hs263_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs263",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -1,
  :best_known_upper_bound => -1,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 263.
""",
  :origin_notes => raw"""
Problem 263 in
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
  :lib => "HS2:263",
)
get_hs263_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs263_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_hs263_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs263_nineq(; n::Integer = default_nvar, kwargs...) = 2
