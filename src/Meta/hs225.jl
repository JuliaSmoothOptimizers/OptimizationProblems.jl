hs225_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 5,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs225",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => 2,
  :best_known_upper_bound => 2,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 225.
""",
  :origin_notes => raw"""
Problem 225 in
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
  :lib => "HS2:225",
)
get_hs225_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs225_ncon(; n::Int = default_nvar, kwargs...) = 5
get_hs225_nlin(; n::Int = default_nvar, kwargs...) = 1
get_hs225_nnln(; n::Int = default_nvar, kwargs...) = 4
get_hs225_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs225_nineq(; n::Int = default_nvar, kwargs...) = 5
