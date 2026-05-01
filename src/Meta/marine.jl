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
 Given observations of ns stages of a marine species over n timesteps, 
 minimize the loss between the observation and the computed law of paraneters : growth, mortality and number of specimens (g,m,x) 

   This is problem 6 in the COPS (Version 3) collection of 
   E. Dolan and J. More'
   see "Benchmarking Optimization Software with COPS"
   Argonne National Labs Technical Report ANL/MCS-246 (2004)

   classification OOR2-AN-V-V

 Marine Population Dynamics Problem
 Collocation formulation
 Alexander S. Bondarenko - Summer 1998
 COPS 2.0 - September 2000
 COPS 3.0 - November 2002
 COPS 3.1 - March 2004  
  """,
  :origin_notes => raw"""
Problem :
Given estimates of the abundance of the population of a marine
spieces at each stage as a function of time, determine specific
growth and mortality rates. Th emodel for the population dynamics
of the n_e -stage population is 
y_j' = g_j-1 y_j-1 - (m_j + g_j) y_j   (1 <= j <= n_e)
where m_i and g_i are unknown mortality and growth rates at stage i
with g_0 = 0 = g_n_e. This model assumes that the species eventually
dies or grows into the next stage, with the implicit assumption that
the species cannot skip a stage. Initial conditions for the differntial
equation are unknown, since the stage abundance measurements at the
initial time might also be contaminated with experimental error. The
problem is to minimize the error between the observed and computed data,
sum{i=1,nm} || y(tau_i,m,g) - z_i||^2
where the z_i are stage abundance measurements.
This is problem 6 in the COPS (Version 2) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2000)
SIF input: Nick Gould, November 2000
classification OOR2-AN-V-V
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
  8 + 7 + Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 3 * 8 * nc)
get_marine_ncon(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nlin(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  8 * (Int(round((n - 2 * 8 + 1) / (3 * 8 * 1 + 8))) - 1) # (nh - 1) * ne
get_marine_nnln(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (2 * nc + nc * (8 - 2))
get_marine_nequ(; n::Integer = default_nvar, nc::Int = 1, kwargs...) =
  Int(round((n - 2 * 8 + 1) / (3 * 8 * nc + 8))) * (8 + 2 * nc + nc * (8 - 2)) - 8
get_marine_nineq(; n::Integer = default_nvar, nc::Int = 1, kwargs...) = 0
