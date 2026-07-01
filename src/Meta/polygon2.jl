polygon2_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => 1,
  :variable_ncon => false,
  :minimize => true,
  :name => "polygon2",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://laurentlessard.com/teaching/524-intro-to-optimization/",
  :notes => raw"""
Find the polygon of maximal area, among polygons with nv sides and diameter d <= 1
Model 2: relative polar coordinates
""",
  :origin_notes => raw"""
JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
Introduction to Optimization class.
""",
  :reference => raw"""
@misc{Lessard524,
  author       = {Lessard, Laurent},
  title        = {Introduction to Optimization, {CS/ECE/ISyE} 524},
  howpublished = {Lecture notes, University of Wisconsin--Madison},
  url          = {https://laurentlessard.com/teaching/524-intro-to-optimization/},
}
""",
  :lib => "",
)
get_polygon2_nvar(; n::Int = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon2_ncon(; n::Int = default_nvar, kwargs...) = 1
get_polygon2_nlin(; n::Int = default_nvar, kwargs...) = 1
get_polygon2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_polygon2_nequ(; n::Int = default_nvar, kwargs...) = 1
get_polygon2_nineq(; n::Int = default_nvar, kwargs...) = 0
