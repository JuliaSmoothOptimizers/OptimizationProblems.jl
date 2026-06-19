hs211_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs211",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 750.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 211.
""",
  :origin_notes => raw"""
Problem 211 in
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
  :lib => "HS2:211",
)
get_hs211_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs211_ncon(; n::Int = default_nvar, kwargs...) = 0
get_hs211_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs211_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs211_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs211_nineq(; n::Int = default_nvar, kwargs...) = 0
