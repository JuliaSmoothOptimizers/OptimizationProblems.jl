extrosnb_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "extrosnb",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => 39604.0,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/EXTROSNB.SIF",
  :notes => raw"""
The extended Rosenbrock function (nonseparable version).

classification SUR2-AN-V-0
""",
  :origin_notes => raw"""
Problem 10 in
Ph.L. Toint,
"Test problems for partially separable optimization and results
for the routine PSPMIN",
Report 83/4, Department of Mathematics, FUNDP (Namur, B), 1983.

See also Buckley#116.  Note that MGH#21 is the separable version.
SIF input: Ph. Toint, Dec 1989.

problem 29 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic

http://www.cs.cas.cz/matonoha/download/V1081.pdf

J.-P. Dussault, Rennes 09/2015.
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
  :lib => "CUTEst:EXTROSNB, Luksan:29",
)
get_extrosnb_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_extrosnb_ncon(; n::Int = default_nvar, kwargs...) = 0
get_extrosnb_nlin(; n::Int = default_nvar, kwargs...) = 0
get_extrosnb_nnln(; n::Int = default_nvar, kwargs...) = 0
get_extrosnb_nequ(; n::Int = default_nvar, kwargs...) = 0
get_extrosnb_nineq(; n::Int = default_nvar, kwargs...) = 0
