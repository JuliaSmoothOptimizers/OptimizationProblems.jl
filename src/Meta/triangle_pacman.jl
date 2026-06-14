triangle_pacman_meta = Dict(
  :nvar => 1366,
  :variable_nvar => false,
  :ncon => 1182,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle_pacman",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 1316.282216286999,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://doi.org/10.2172/834714",
  :notes => raw"""
Minimize the sum of the inverse weighted mean ratio of the elements in a fixed–boundary
triangular mesh by adjusting the locations of the free vertices.

Instance using the `pacman` shape mesh.
""",
  :origin_notes => raw"""
This is problem 18 in the COPS (Version 3) collection of
E. Dolan and J. More
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

Instance using the `pacman` shape mesh.
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
  :lib => "COPS:18",
)
get_triangle_pacman_nvar(; n::Int = default_nvar, kwargs...) = 1366
get_triangle_pacman_ncon(; n::Int = default_nvar, kwargs...) = 1182
get_triangle_pacman_nlin(; n::Int = default_nvar, kwargs...) = 0
get_triangle_pacman_nnln(; n::Int = default_nvar, kwargs...) = 1182
get_triangle_pacman_nequ(; n::Int = default_nvar, kwargs...) = 0
get_triangle_pacman_nineq(; n::Int = default_nvar, kwargs...) = 1182
