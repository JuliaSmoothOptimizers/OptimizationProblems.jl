tridia_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "tridia",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 5049.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/TRIDIA.SIF",
  :notes => raw"""
Shanno's TRIDIA quadratic tridiagonal problem.

   This problem is decomposed in n linear groups, the last n-1 of which
   are 2 x 2 and singular.

classification QUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 8 in
Ph.L. Toint,
"Test problems for partially separable optimization and results
for the routine PSPMIN",
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
See also Buckley#40 (p.96)
SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@techreport{Toint1983,
  author      = {Ph. L. Toint},
  title       = {Test problems for partially separable optimization and results for the routine PSPMIN},
  institution = {Department of Mathematics, FUNDP (Namur, Belgium)},
  number      = {Report 83/4},
  year        = {1983}
}  
  """,
  :lib => "CUTEst:TRIDIA",
)
get_tridia_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_tridia_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_tridia_nineq(; n::Integer = default_nvar, kwargs...) = 0
