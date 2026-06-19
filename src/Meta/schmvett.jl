schmvett_meta = Dict(
  :nvar => 100,
  :variable_nvar => true,
  :ncon => 0,
  :variable_ncon => false,
  :minimize => true,
  :name => "schmvett",
  :has_equalities_only => false,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :objtype => :other,
  :contype => :unconstrained,
  :best_known_lower_bound => -Inf,
  :best_known_upper_bound => -189.06775423656546,
  :is_feasible => true,
  :defined_everywhere => missing,
  :origin => :unknown,
  :implementation => :both,
  :url => "https://bitbucket.org/optrove/sif/src/master/SCHMVETT.SIF",
  :notes => raw"""
The Schmidt and Vetters problem.

This problem has N-2 trivial groups, all of which have 3 nonlinear
elements

classification OUR2-AY-V-0

Problem 49 in
L. Luksan, C. Matonoha and J. Vlcek
Modified CUTE problems for sparse unconstrained optimization,
Technical Report 1081,
Institute of Computer Science,
Academy of Science of the Czech Republic
http://www.cs.cas.cz/matonoha/download/V1081.pdf

J.-P. Dussault, Clermont-Ferrand 05/2016.
""",
  :origin_notes => raw"""
J.W. Schmidt and K. Vetters,
"Albeitungsfreie Verfahren fur Nichtlineare Optimierungsproblem",
Numerische Mathematik 15:263-282, 1970.
See also Toint#35 and Buckley#14 (p90)

SIF input: Ph. Toint, Dec 1989.
""",
  :reference => raw"""
@article{SchmidtVetters1970NM,
  author  = {Schmidt, Jochen W. and Vetters, Klaus},
  title   = {Ableitungsfreie {Verfahren} f{\"u}r nichtlineare {Optimierungsprobleme}},
  journal = {Numerische Mathematik},
  year    = {1970},
  volume  = {15},
  number  = {4},
  pages   = {263--282},
  doi     = {10.1007/BF02165118}
}  
  """,
  :lib => "CUTEst:SCHMVETT, Luksan:49",
)
get_schmvett_nvar(; n::Int = default_nvar, kwargs...) = 1 * n + 0
get_schmvett_ncon(; n::Int = default_nvar, kwargs...) = 0
get_schmvett_nlin(; n::Int = default_nvar, kwargs...) = 0
get_schmvett_nnln(; n::Int = default_nvar, kwargs...) = 0
get_schmvett_nequ(; n::Int = default_nvar, kwargs...) = 0
get_schmvett_nineq(; n::Int = default_nvar, kwargs...) = 0
