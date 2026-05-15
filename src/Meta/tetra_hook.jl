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

""",
  :origin_notes => raw"""

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
get_tetra_hook_nvar(; n::Integer = default_nvar, kwargs...) = 3570
get_tetra_hook_ncon(; n::Integer = default_nvar, kwargs...) = 4675
get_tetra_hook_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_hook_nnln(; n::Integer = default_nvar, kwargs...) = 4675
get_tetra_hook_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_hook_nineq(; n::Integer = default_nvar, kwargs...) = 4675
