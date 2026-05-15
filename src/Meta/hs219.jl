hs219_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 2,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs219",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :linear,
  :contype => :general,
  :best_known_lower_bound => -1.0,
  :best_known_upper_bound => -1.0,
  :is_feasible => true,
  :defined_everywhere => true,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Schittkowski problem number 219.

Solution is: (1, 1, 0, 0) with f(x^*) = -1
""",
:origin_notes => raw"""
Problem 219 in
  Schittkowski, K. (1987). 
  More Test Examples for Nonlinear Programming Codes. 
  Lecture Notes in Economics and Mathematical Systems.
  doi:10.1007/978-3-642-61582-5

classification LPR-T1-1
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

  :lib => "HS2:219",
)
get_hs219_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_hs219_ncon(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_hs219_nnln(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_hs219_nineq(; n::Integer = default_nvar, kwargs...) = 0