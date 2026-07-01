hs262_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs262",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -10,
  :best_known_upper_bound => -10,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 262.
""",
  :origin_notes => raw"""
Problem 262 in
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
  :lib => "HS2:262",
)
get_hs262_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs262_ncon(; n::Int = default_nvar, kwargs...) = 4
get_hs262_nlin(; n::Int = default_nvar, kwargs...) = 4
get_hs262_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs262_nequ(; n::Int = default_nvar, kwargs...) = 1
get_hs262_nineq(; n::Int = default_nvar, kwargs...) = 3
