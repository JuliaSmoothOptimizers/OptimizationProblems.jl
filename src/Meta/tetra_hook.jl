tetra_hook_meta = Dict(
  :nvar => 3570,
  :variable_nvar => false,
  :ncon => 4675,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra_hook",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 6157.142959931886,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.2172/834714",
  :notes => raw"""
Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
tetrahedral mesh by adjusting the locations of the free vertices.

Instance using the `hook` mesh.
""",
  :origin_notes => raw"""
This is problem 19 in the COPS (Version 3) collection of
E. Dolan and J. More
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

Instance using the `hook` mesh.
""",
  :reference => raw"""
@techreport{DolanMore2004COPS,
  author       = {Dolan, Elizabeth D. and Mor{'e}, Jorge J.},
  title        = {Benchmarking Optimization Software with {COPS} 3.0},
  institution  = {Argonne National Laboratory},
  number       = {ANL/MCS-TM-273},
    year         = {2004},
  doi          = {10.2172/834714}
  }
    """,
  :lib => "COPS:19",
)
get_tetra_hook_nvar(; n::Int = default_nvar, kwargs...) = 3570
get_tetra_hook_ncon(; n::Int = default_nvar, kwargs...) = 4675
get_tetra_hook_nlin(; n::Int = default_nvar, kwargs...) = 0
get_tetra_hook_nnln(; n::Int = default_nvar, kwargs...) = 4675
get_tetra_hook_nequ(; n::Int = default_nvar, kwargs...) = 0
get_tetra_hook_nineq(; n::Int = default_nvar, kwargs...) = 4675
