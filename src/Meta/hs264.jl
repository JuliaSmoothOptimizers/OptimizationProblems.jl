hs264_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs264",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -44,
  :best_known_upper_bound => -44,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 264.
""",
  :origin_notes => raw"""
Problem 264 in
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
  :lib => "HS2:264",
)
get_hs264_nvar(; n::Int = default_nvar, kwargs...) = 4
get_hs264_ncon(; n::Int = default_nvar, kwargs...) = 3
get_hs264_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs264_nnln(; n::Int = default_nvar, kwargs...) = 3
get_hs264_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs264_nineq(; n::Int = default_nvar, kwargs...) = 3
