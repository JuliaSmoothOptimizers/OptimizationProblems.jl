engval1_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "engval1",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 5841.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :url => "https://bitbucket.org/optrove/sif/src/master/ENGVAL1.SIF",
  :notes => raw"""
The ENGVAL1 problem.
This problem is a sum of 2n-2 groups, n-1 of which contain 2 nonlinear
elements.

classification OUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 31 in
Ph.L. Toint,
Test problems for partially separable optimization and results
for the routine PSPMIN,
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

See also

problem 26 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

See also Buckley#172 (p. 52)

SIF input: Ph. Toint and N. Gould, Dec 1989.

D. Orban, Montreal, 08/2015.
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
  :lib => "CUTEst:ENGVAL1, Luksan:26",
)
get_engval1_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_engval1_ncon(; n::Int = default_nvar, kwargs...) = 0
get_engval1_nlin(; n::Int = default_nvar, kwargs...) = 0
get_engval1_nnln(; n::Int = default_nvar, kwargs...) = 0
get_engval1_nequ(; n::Int = default_nvar, kwargs...) = 0
get_engval1_nineq(; n::Int = default_nvar, kwargs...) = 0
