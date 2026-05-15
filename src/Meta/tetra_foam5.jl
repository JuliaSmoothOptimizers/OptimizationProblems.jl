tetra_foam5_meta = Dict(
  :nvar => 4011,
  :variable_nvar => false,
  :ncon => 4847,
  :variable_ncon => false,
  :minimize => true,
  :name => "tetra_foam5",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => true,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 6497.104132398904,
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
get_tetra_foam5_nvar(; n::Integer = default_nvar, kwargs...) = 4011
get_tetra_foam5_ncon(; n::Integer = default_nvar, kwargs...) = 4847
get_tetra_foam5_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_foam5_nnln(; n::Integer = default_nvar, kwargs...) = 4847
get_tetra_foam5_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tetra_foam5_nineq(; n::Integer = default_nvar, kwargs...) = 4847
