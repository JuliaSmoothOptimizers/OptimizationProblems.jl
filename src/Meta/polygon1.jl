polygon1_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "polygon1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => false,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Find the polygon of maximal area, among polygons with nv sides and diameter d <= 1

JuMP model follows Laurent Lessard CS/ECE/ISyE 524, University of Wisconsin–Madison, 
Introduction to Optimization class.
https://laurentlessard.com/teaching/524-intro-to-optimization/

This implementation is similar to
This is problem 1 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_polygon1_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon1_ncon(; n::Integer = default_nvar, kwargs...) = div(n, 2)
get_polygon1_nlin(; n::Integer = default_nvar, kwargs...) = div(n, 2)
get_polygon1_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_polygon1_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_polygon1_nineq(; n::Integer = default_nvar, kwargs...) = div(n, 2) - 1
