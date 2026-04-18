polygon3_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => 2 * div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "polygon3",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Find the polygon of maximal area, among polygons with nv sides and diameter d <= 1
Model 3: rectangular coordinates

JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
Introduction to Optimization class.
https://laurentlessard.com/teaching/524-intro-to-optimization/
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_polygon3_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon3_ncon(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon3_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_polygon3_nnln(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon3_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_polygon3_nineq(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
