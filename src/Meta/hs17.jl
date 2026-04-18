hs17_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs17",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 Hock and Schittkowski problem number 17.

   Source:
   Problem 17 in
   W. Hock and K. Schittkowski,
   Test examples for nonlinear programming codes,
   Lectures Notes in Economics and Mathematical Systems 187,
   Springer Verlag, Heidelberg, 1981.

   classification SQR2-AN-2-2

 N. Antunes, Curitiba, 10/2016.  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs17_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs17_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs17_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs17_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs17_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs17_nineq(; n::Integer = default_nvar, kwargs...) = 2
