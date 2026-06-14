hs229_meta = Dict(
  :nvar => 2,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "hs229",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => 0,
  :best_known_upper_bound => 0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.1007/978-3-642-61582-5",
  :notes => raw"""
Hock and Schittkowski problem number 229.
""",
  :origin_notes => raw"""
Problem 229 in
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
  :lib => "HS2:229",
)
get_hs229_nvar(; n::Int = default_nvar, kwargs...) = 2
get_hs229_ncon(; n::Int = default_nvar, kwargs...) = 0
get_hs229_nlin(; n::Int = default_nvar, kwargs...) = 0
get_hs229_nnln(; n::Int = default_nvar, kwargs...) = 0
get_hs229_nequ(; n::Int = default_nvar, kwargs...) = 0
get_hs229_nineq(; n::Int = default_nvar, kwargs...) = 0
