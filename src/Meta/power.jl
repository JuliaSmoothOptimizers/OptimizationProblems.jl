power_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "power",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 2.55025e7,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/POWER.SIF",
  :notes => raw"""
The Power problem by Oren.

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
S.S. Oren,
Self-scaling variable metric algorithms,
Part II: implementation and experiments"
Management Science 20(5):863-874, 1974.
See also Buckley#179 (p. 83)
SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{Oren1974,
  title = {Self-Scaling Variable Metric (SSVM) Algorithms: Part II: Implementation and Experiments},
  volume = {20},
  ISSN = {1526-5501},
  url = {https://doi.org/10.1287/mnsc.20.5.863},
  DOI = {10.1287/mnsc.20.5.863},
  number = {5},
  journal = {Management Science},
  publisher = {Institute for Operations Research and the Management Sciences (INFORMS)},
  author = {Oren,  Shmuel S.},
  year = {1974},
  month = Jan,
  pages = {863–874}
}  
  """,
  :lib => "CUTEst:POWER",
)
get_power_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_power_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_power_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_power_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_power_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_power_nineq(; n::Integer = default_nvar, kwargs...) = 0
get_power_nls_nequ(; n::Integer = default_nvar, kwargs...) = 1
