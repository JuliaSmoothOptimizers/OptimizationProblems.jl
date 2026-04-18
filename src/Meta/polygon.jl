polygon_meta = Dict(
  :nvar => 2 * div(default_nvar, 2),
  :variable_nvar => true,
  :ncon => div(default_nvar, 2),
  :variable_ncon => true,
  :minimize => true,
  :name => "polygon",
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

This is problem 1 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

classification OOR2-AN-V-V

The initial guess is inspired from https://vanderbei.princeton.edu/ampl/nlmodels/polygon/polygon2.mod

See `polygon1`, `polygon2` and `polygon3` for similar variants.
""",
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_polygon_nvar(; n::Integer = default_nvar, kwargs...) = 2 * div(n, 2)
get_polygon_ncon(; n::Integer = default_nvar, kwargs...) =
  div(n, 2) + 1 + Int(div(n, 2) * (div(n, 2) - 1) / 2)
get_polygon_nlin(; n::Integer = default_nvar, kwargs...) = div(n, 2) + 1
get_polygon_nnln(; n::Integer = default_nvar, kwargs...) = Int(div(n, 2) * (div(n, 2) - 1) / 2)
get_polygon_nequ(; n::Integer = default_nvar, kwargs...) = 2
get_polygon_nineq(; n::Integer = default_nvar, kwargs...) =
  div(n, 2) - 1 + Int(div(n, 2) * (div(n, 2) - 1) / 2)
