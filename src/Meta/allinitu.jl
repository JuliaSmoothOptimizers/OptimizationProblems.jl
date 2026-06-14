allinitu_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "allinitu",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 13.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/ALLINITU.SIF",
  :notes => raw"""
A problem with "all in it". Intended to verify that changes
to LANCELOT are safe.

classification OUR2-AY-4-0
""",
  :origin_notes => raw"""
N. Gould, private communication.

SIF input: Nick Gould, June 1990.
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
  :lib => "CUTEst:ALLINITU",
)
get_allinitu_nvar(; n::Int = default_nvar, kwargs...) = 4
get_allinitu_ncon(; n::Int = default_nvar, kwargs...) = 0
get_allinitu_nlin(; n::Int = default_nvar, kwargs...) = 0
get_allinitu_nnln(; n::Int = default_nvar, kwargs...) = 0
get_allinitu_nequ(; n::Int = default_nvar, kwargs...) = 0
get_allinitu_nineq(; n::Int = default_nvar, kwargs...) = 0
