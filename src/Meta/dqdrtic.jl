dqdrtic_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "dqdrtic",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 177282.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/DQDRTIC.SIF",
  :notes => raw"""
Diagonal quadratic problem

classification QUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 22 in
Ph. L. Toint,
"Test problems for partially separable optimization and results
for the routine PSPMIN",
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.  
  ---
Problem :
A simple diagonal quadratic.
Source: problem 22 in
Ph. L. Toint,
"Test problems for partially separable optimization and results
for the routine PSPMIN",
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.
SIF input: Ph. Toint, Dec 1989.
classification QUR2-AN-V-0
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
  :lib => "CUTEst:DQDRTIC",
)
get_dqdrtic_nvar(; n::Integer = default_nvar, kwargs...) = 1 * n + 0
get_dqdrtic_ncon(; n::Integer = default_nvar, kwargs...) = 0
get_dqdrtic_nlin(; n::Integer = default_nvar, kwargs...) = 0
get_dqdrtic_nnln(; n::Integer = default_nvar, kwargs...) = 0
get_dqdrtic_nequ(; n::Integer = default_nvar, kwargs...) = 0
get_dqdrtic_nineq(; n::Integer = default_nvar, kwargs...) = 0
