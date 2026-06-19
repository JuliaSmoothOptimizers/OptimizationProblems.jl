triangle_meta = Dict(
  :nvar => 8,
  :variable_nvar => false,
  :ncon => 3,
  :variable_ncon => false,
  :minimize => true,
  :name => "triangle",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 11.327992479774316,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://doi.org/10.2172/834714",
  :notes => raw"""
Minimize the time taken for a robot arm to travel between two points.
""",
  :origin_notes => raw"""
This is problem 18 in the COPS (Version 3) collection of 
E. Dolan and J. More
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)
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
get_triangle_nvar(; n::Int = default_nvar, kwargs...) = 8
get_triangle_ncon(; n::Int = default_nvar, kwargs...) = 3
get_triangle_nlin(; n::Int = default_nvar, kwargs...) = 0
get_triangle_nnln(; n::Int = default_nvar, kwargs...) = 3
get_triangle_nequ(; n::Int = default_nvar, kwargs...) = 0
get_triangle_nineq(; n::Int = default_nvar, kwargs...) = 3
