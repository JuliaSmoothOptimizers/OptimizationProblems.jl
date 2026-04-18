hs378_meta = Dict(
  :nvar => 10,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs378",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :url => "",
  :notes => raw"""
Schittkowski problem number 378.

  Source:
  Problem 378 in
  Schittkowski, K. (1987). 
  More Test Examples for Nonlinear Programming Codes. 
  Lecture Notes in Economics and Mathematical Systems.
  doi:10.1007/978-3-642-61582-5
  
  classification OOR2-AN-10-3

M. Gollier, Montréal, 05/2023
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs378_nvar(; n::Integer = default_nvar, kwargs...) = 10
get_hs378_ncon(; n::Integer = default_nvar, kwargs...) = 3
get_hs378_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs378_nnln(; n::Integer = default_nvar, kwargs...) = 3
get_hs378_nequ(; n::Integer = default_nvar, kwargs...) = 3
get_hs378_nineq(; n::Integer = default_nvar, kwargs...) = 0
