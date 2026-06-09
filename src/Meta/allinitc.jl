allinitc_meta = Dict(
  :nvar => 4,
  :variable_nvar => false,
  :ncon => 4,
  :variable_ncon => false,
  :minimize => true,
  :name => "allinitc",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :general,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => Inf,
  :is_feasible => missing,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/ALLINITC.SIF",
  :notes => raw"""
A problem with "all in it". Intended to verify that changes
to LANCELOT are safe.

classification OOR2-AY-4-1
""",
  :origin_notes => raw"""
N. Gould: private communication.

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
  :lib => "CUTEst:ALLINITC",
)
get_allinitc_nvar(; n::Integer = default_nvar, kwargs...) = 4
get_allinitc_ncon(; n::Integer = default_nvar, kwargs...) = 4
get_allinitc_nlin(; n::Integer = default_nvar, kwargs...) = 3
get_allinitc_nnln(; n::Integer = default_nvar, kwargs...) = 1
get_allinitc_nequ(; n::Integer = default_nvar, kwargs...) = 1
get_allinitc_nineq(; n::Integer = default_nvar, kwargs...) = 3
