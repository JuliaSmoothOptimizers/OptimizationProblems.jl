hs322_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs322",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :quadratic,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :academic,
  :url => "",
  :notes => raw"""
Schittkowski problem number 322.

  Source:
  Problem 322 in
  Schittkowski, K. (1987). 
  More Test Examples for Nonlinear Programming Codes. 
  Lecture Notes in Economics and Mathematical Systems.
  doi:10.1007/978-3-642-61582-5
  
  classification QQR2-AN-2-1

M. Gollier, Montréal, 05/2023
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_hs322_nvar(; n::Integer = default_nvar, kwargs...) = 2
get_hs322_ncon(; n::Integer = default_nvar, kwargs...) = 1
get_hs322_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs322_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_hs322_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_hs322_nineq(; n::Integer = default_nvar, kwargs...) = 0
