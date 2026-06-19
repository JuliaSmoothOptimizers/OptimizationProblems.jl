threepk_meta = Dict(
  :nvar => 30,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "threepk",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 20236.538579257834,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/3PK.SIF",
  :notes => raw"""
A problem arising in the estimation of structured O/D matrix
""",
  :origin_notes => raw"""
Converted in Julia from https://github.com/mpf/Optimization-Test-Problems

M. Bierlaire, private communication
   see also
   M. Bierlaire and Ph. L. Toint,
   MEUSE: an origin-destination estimator that exploits structure,
   Transportation Research B, 29, 1, 47--60, 1995.
   SIF input: Ph. Toint, Dec 1989, Corrected July 1993.
   classification SUR2-MN-30-0
""",
  :reference => raw"""
@article{Bierlaire1995,
  title = {Meuse: An origin-destination matrix estimator that exploits structure},
  volume = {29},
  ISSN = {0191-2615},
  url = {https://doi.org/10.1016/0191-2615(94)00025-U},
  DOI = {10.1016/0191-2615(94)00025-u},
  number = {1},
  journal = {Transportation Research Part B: Methodological},
  publisher = {Elsevier BV},
  author  = {Bierlaire, M. and Toint, Ph.L.},
  year    = {1995},
  month   = feb,
  pages   = {47--60}
}
""",
  :lib => "CUTEst:3PK",
)
get_threepk_nvar(; n::Int = default_nvar, kwargs...) = 30
get_threepk_ncon(; n::Int = default_nvar, kwargs...) = 0
get_threepk_nlin(; n::Int = default_nvar, kwargs...) = 0
get_threepk_nnln(; n::Int = default_nvar, kwargs...) = 0
get_threepk_nequ(; n::Int = default_nvar, kwargs...) = 0
get_threepk_nineq(; n::Int = default_nvar, kwargs...) = 0
