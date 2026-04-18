gasoil_meta = Dict(
  :nvar => 2603,
  :variable_nvar => true,
  :ncon => 2600,
  :variable_ncon => true,
  :minimize => true,
  :name => "gasoil",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "",
  :notes => raw"""
Catalytic Cracking of Gas Oil Problem
Collocation formulation
""",
  :origin_notes => raw"""
Michael Merritt - Summer 2000
COPS 2.0 - September 2000
COPS 3.0 - November 2002
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

)
get_gasoil_nvar(; n::Integer = default_nvar, kwargs...) = 26 * n + 3
get_gasoil_ncon(; n::Integer = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nlin(; n::Integer = default_nvar, kwargs...) = 18 * n + 0
get_gasoil_nnln(; n::Integer = default_nvar, kwargs...) = 8 * n + 0
get_gasoil_nequ(; n::Integer = default_nvar, kwargs...) = 26 * n + 0
get_gasoil_nineq(; n::Integer = default_nvar, kwargs...) = 0
