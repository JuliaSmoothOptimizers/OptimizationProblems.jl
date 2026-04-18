hs13_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs13",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 Hock and Schittkowski problem number 13.

   Source:
   Problem 13 in
   W. Hock and K. Schittkowski,
   Test examples for nonlinear programming codes,
   Lectures Notes in Economics and Mathematical Systems 187,
   Springer Verlag, Heidelberg, 1981.

   classification QQR2-AN-2-1

 N. Antunes, Curitiba, 10/2016.  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs13_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs13_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs13_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_hs13_nineq(; n::Integer = default_nvar, kwargs...) = 1
get_hs13_nls_nequ(; n::Integer = default_nvar, kwargs...) = 2
