hs224_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs224",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -304,
  :best_known_upper_bound => -304,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "http://dx.doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 224.
""",
  :origin_notes => raw"""
Problem 224 in
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

  :lib => "HS2:224",
)
get_hs224_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs224_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_hs224_nlin(; n::Integer = default_nvar, kwargs...) = 4
get_hs224_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs224_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs224_nineq(; n::Integer = default_nvar, kwargs...) = 4
