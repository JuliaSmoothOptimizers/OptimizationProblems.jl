tetra_meta = Dict(
  :nvar => 15,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
 Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
 tetrahedral mesh by adjusting the locations of the free vertices.

  This is problem 19 in the COPS (Version 3) collection of 
   E. Dolan and J. More
   see "Benchmarking Optimization Software with COPS"
   Argonne National Labs Technical Report ANL/MCS-246 (2004)
  
  """,
  :origin_notes => raw"""""",
  :reference => raw"""""",
)
get_tetra_nvar(; n::Integer = default_nvar, kwargs...) = 15
get_tetra_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_tetra_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_nnln(; n::Integer = default_nvar, kwargs...) = 4
get_tetra_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_nineq(; n::Integer = default_nvar, kwargs...) = 4
