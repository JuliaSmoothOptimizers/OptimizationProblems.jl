hs21_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs21",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 Hock and Schittkowski problem number 21.

   Source:
   Problem 21 in
   W. Hock and K. Schittkowski,
   Test examples for nonlinear programming codes,
   Lectures Notes in Economics and Mathematical Systems 187,
   Springer Verlag, Heidelberg, 1981.

   classification QLR2-AN-2-1

 A. Montoison, Montreal, 04/2018.  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs21_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs21_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs21_nlin(; n::Integer = default_nvar, kwargs...) = 1
get_hs21_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_hs21_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs21_nineq(; n::Integer = default_nvar, kwargs...) = 1
