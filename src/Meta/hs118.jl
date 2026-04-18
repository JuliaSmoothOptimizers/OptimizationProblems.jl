hs118_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 17,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs118",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 942.7162500000001,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Hock and Schittkowski problem number 118.

  Source:
  Problem 118 in
  W. Hock and K. Schittkowski,
  Test examples for nonlinear programming codes,
  Lectures Notes in Economics and Mathematical Systems 187,
  Springer Verlag, Heidelberg, 1981.
  
  classification QLR-AN-15-17

A. Montoison, Montreal, 05/2018.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs118_nvar(; n::Integer = default_nvar, kwargs...) = 15
get_hs118_ncon(; n::Integer = default_nvar, kwargs...) = 17
get_hs118_nlin(; n::Integer = default_nvar, kwargs...) = 17
get_hs118_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs118_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs118_nineq(; n::Integer = default_nvar, kwargs...) = 17
