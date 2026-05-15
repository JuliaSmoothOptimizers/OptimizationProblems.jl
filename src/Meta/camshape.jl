camshape_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 203,
  :variable_ncon => true,
  :minimize => true,
  :name => "camshape",
  :has_equalities_only => false,
  :has_inequalities_only => true,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :quadratic,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/CAMSHAPE.SIF",
  :notes => raw"""
Maximize the area of the valve opening for one rotation of a convex cam 
with constraints on the curvature and on the radius of the cam

classification LOR2-AN-V-V
""",
  :origin_notes => raw"""
This is problem 3 in the COPS (Version 3) collection of 
E. Dolan and J. More
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
  :lib => "CUTEst:CAMSHAPE, COPS:3",
)
get_camshape_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_camshape_ncon(; n::Integer = default_nvar, kwargs...) = 2 * n + 3
get_camshape_nlin(; n::Integer = default_nvar, kwargs...) = n + 2
get_camshape_nnln(; n::Integer = default_nvar, kwargs...) = n + 1
get_camshape_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_camshape_nineq(; n::Integer = default_nvar, kwargs...) = 2 * n + 3
