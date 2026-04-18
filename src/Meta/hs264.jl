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
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 264.

  Source:
  Problem 264 in
  K. Schittkowski,
  More Test Examples for Nonlinear Programming Codes,
  Lectures Notes in Economics and Mathematical Systems 282,
  Springer Verlag, Heidelberg, 1987.

T. Migot, Montreal, 2023.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs264_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs264_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs264_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs264_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs264_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs264_nineq(; n::Integer = default_nvar, kwargs...) = 3
