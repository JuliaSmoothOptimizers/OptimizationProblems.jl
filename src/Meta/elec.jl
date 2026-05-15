elec_meta = Dict(
  :nvar => 99,
  :variable_nvar => true,
  :ncon => 33,
  :variable_ncon => true,
  :minimize => true,
  :name => "elec",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/ELEC.SIF",
  :notes => raw"""
Given np electrons, find the equilibrium state distribution of minimal
Columb potential of the electrons positioned on a conducting sphere

classification OOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 2 in the COPS (Version 3) collection of 
E. Dolan and J. More'
see "Benchmarking Optimization Software with COPS"
Argonne National Labs Technical Report ANL/MCS-246 (2004)

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

  :lib => "CUTEst:ELEC, COPS:2",
)
get_elec_nvar(; n::Integer = default_nvar, kwargs...) = 3 * max(2, div(n, 3))
get_elec_ncon(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 3))
get_elec_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_elec_nnln(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 3))
get_elec_nequ(; n::Integer = default_nvar, kwargs...) = max(2, div(n, 3))
get_elec_nineq(; n::Integer = default_nvar, kwargs...) = 0
