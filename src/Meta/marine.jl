marine_meta = Dict(
  :nvar => 111,
  :variable_nvar => true,
  :ncon => 40,
  :variable_ncon => true,
  :minimize => true,
  :name => "marine",
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
  :url => "https://bitbucket.org/optrove/sif/src/master/MARINE.SIF",
  :notes => raw"""
Marine Population Dynamics Problem
 Collocation formulation

 Given observations of ns stages of a marine species over n timesteps, 
 minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x)

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 6 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

Alexander S. Bondarenko - Summer 1998
COPS 2.0 - September 2000
COPS 3.0 - November 2002
COPS 3.1 - March 2004

SIF input: Nick Gould, November 2000
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
  :lib => "CUTEst:MARINE, COPS:6",
)
get_marine_nvar(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  let ne = 8, n = max(n, 3 * 8 * nc + 8 + 2 * 8)  # clamp to model's minimum (ne=8)
    8 + 7 + Int(round((n - 2 * ne + 1) / (3 * ne * nc + ne))) * (ne + 3 * ne * nc)
  end
get_marine_ncon(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nlin(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  8 * (Int(round((n - 2 * 8 + 1) / (3 * 8 * 1 + 8))) - 1) # (nh - 1) * ne
get_marine_nnln(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (2 * nc + nc * (8 - 2))
get_marine_nequ(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nineq(; n::Integer = default_nvar, nc::Int = 1, kwargs...) = 0
