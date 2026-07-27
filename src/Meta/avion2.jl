avion2_meta = Dict(
  :nvar => 49,
  :variable_nvar => false,
  :ncon => 15,
  :variable_ncon => false,
  :minimize => true,
  :name => "avion2",
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => true,
  :has_fixed_variables => false,
  :objtype => :least_squares,
  :contype => :linear,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/AVION2.SIF",
  :notes => raw"""
Dassault France avion (airplane design) problem

classification OLR2-RN-49-15
""",
  :origin_notes => raw"""
SIF input:  A. R. Conn, June 1993.
""",
  :reference => raw"""
@article{Gould2015CUTEst,
  author  = {Gould, N. I. M. and Orban, D. and Toint, Ph. L.},
  title   = {{CUTEst}: a Constrained and Unconstrained Testing Environment with safe threads for mathematical optimization},
  journal = {Computational Optimization and Applications},
  year    = {2015},
  volume  = {60},
  number  = {3},
  pages   = {545--557},
  doi     = {10.1007/s10589-014-9687-3}
}
""",
  :lib => "CUTEst:AVION2",
)
get_avion2_nvar(; n::Int = default_nvar, kwargs...) = 49
get_avion2_ncon(; n::Int = default_nvar, kwargs...) = 15
get_avion2_nlin(; n::Int = default_nvar, kwargs...) = 15
get_avion2_nnln(; n::Int = default_nvar, kwargs...) = 0
get_avion2_nequ(; n::Int = default_nvar, kwargs...) = 15
get_avion2_nineq(; n::Int = default_nvar, kwargs...) = 0
get_avion2_nls_nequ(; n::Int = default_nvar, kwargs...) = 17
