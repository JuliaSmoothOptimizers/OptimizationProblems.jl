torsion_meta = Dict(
  :nvar => 144,
  :variable_nvar => true,
  :ncon => 144,
  :variable_ncon => true,
  :minimize => true,
  :name => "torsion",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -0.3305785123966928,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :jump,
  :url => "https://doi.org/10.2172/834714",
  :notes => raw"""
Torsion problem
""",
  :origin_notes => raw"""
Liz Dolan - Summer 2000
 Version 2.0 - October 2000
 COPS 3.1 - March 2004
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
  :lib => "COPS:15",
)
get_torsion_nvar(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_ncon(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_nlin(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
get_torsion_nnln(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = 0
get_torsion_nequ(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = 0
get_torsion_nineq(;
  n::Int = default_nvar,
  nx = Int(round(sqrt(max(1, n - 2)))),
  ny = Int(round(sqrt(max(1, n - 2)))),
  kwargs...,
) = (nx + 2) * (ny + 2)
